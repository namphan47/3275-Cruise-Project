var KEY = "CRUISE_DATA";
var DATA = {};
var URLS = {
	cruise : "cruise",
	route : "route",
	room_type : "room_type",
	room_selection : "room_selection",
	activity_selection : "activity_selection",
	summary : "summary",
	thankYou:"summary/thank-you",
	admin:"admin"
};

var ROOM_NO = {
	disabled : [],
	data : [],
	from : 1001,
	to : 1034
};

var ROOM_TYPES = {};

var ACTIVITIES = {};

var formatter = new Intl.NumberFormat('en-US', {
	  style: 'currency',
	  currency: 'USD',
	  minimumFractionDigits: 2
	});

var params = new URLSearchParams(window.location.search);

function init() {
	DATA = {
		cruise : {},
		route : {},
		room_type : {},
		room : {},
		activities : {}
	};
}

function calculateTotal(){
	var total = 0;
	
	try{
		total +=DATA.room_type.basePrice/2 * DATA.room_type.guest;
		
		for(var act of Object.keys(DATA.activities)){
			total += DATA.activities[act].price*DATA.activities[act].count;
		}
		
	}catch (e) {
		
	}
	if(isNaN(total)){
		total = 0;
	}
	console.log(total);
	$("#total-text").text(formatter.format(total));
}

function selectCruise(id) {
	console.log(id);
	DATA.cruise["id"] = id;
	save();
	params.set("cruise-id", id);
	move(URLS.route + "?" + params.toString());
}

function selectRoute(id) {
	console.log(id);
	DATA.route["id"] = id;
	save();
	params.set("route-id", id);
	move(URLS.room_type + "?" + params);
}

function nextRoom() {
	if(Object.keys(DATA.room_type).length === 0){
		alert("Room type cannot be empty");
		return;
	}
		DATA.room_type["guest"] = parseInt($("[name=guest-number]").val());
		save();
		params.set("room-type-id", DATA.room_type["id"]);
		params.set("name", DATA.room_type["name"]);
		params.set("guest", DATA.room_type["guest"]);
		move(URLS.room_selection + "?" + params.toString());
}

function nextActivity() {
	if ($("[name=room-selection]")[0].selectedIndex > 0) {
		save();
		params.set("guest", DATA.room["id"]);
		move(URLS.activity_selection + "?" + params.toString());
	} else {
		alert("Please select room");
	}
}

function nextSummary(){
	save();
	var ids = [];
	for(var id of Object.keys(DATA.activities)){
		ids.push(id);
	}
	params.set("activities",ids.join(","));
	move(URLS.summary + "?" + params.toString());
}

function addActivity(dom) {
	var id = $(dom).data("activity");
	console.log(id);
	if (DATA.activities[id]) {
		removeActivity(id);
	} else {
		var obj = ACTIVITIES[id];
		DATA.activities[id] = obj;
		DATA.activities[id].count = 1;
		
		console.log(DATA.activities);
		renderActivities();
	}
	calculateTotal();
}

function removeActivity(id) {
	
	delete DATA.activities[id];
	renderActivities();
}

function renderActivities() {
	var $dom = $("#activities-selection-form");
	$dom.html("");
	$("[name=activity-box]").parent().removeClass("active");
	if(Object.keys(DATA.activities).length == 0){
		$dom.append("<h5>No Activities is selected</h5>");
	}
	for(var id of Object.keys(DATA.activities)){
		var obj = DATA.activities[id];
		$("[name=activity-box][data-activity=" + id + "]").parent().addClass("active");
		$dom.append(`
		<div>
			<div class="form-group">
				<div class="d-flex">
					<div class="input-text flex-grow-1">${obj.name}</div>
					<input type="number" min=1
					 class="form-control ml-3" onchange="onActivityChange(this,${id})"
						style="width: 60px;" value="${obj.count}" data-activity="${id}">
					<div
						class="icon justify-content-center align-items-center mx-3">
						<i class="far fa-times-circle cursor-pointer" onClick="removeActivity(${id})"></i>
					</div>
				</div>
			</div>
			<h4 class="text-right">${obj.price} x ${obj.count}</h4>
		</div>
		`);
	}
}

function checkout(){
	var $email = $("[name=email]");
	if(!$email[0].checkValidity()){
		alert("An valid email is required");
		return;
	}
	var activity_ids = [];
	for(var id of Object.keys(DATA.activities)){
		activity_ids.push(DATA.activities[id].count);
	}
	var new_params = params;
	new_params.set("email",$email.val());
	new_params.set("room-number",DATA.room.id);
	new_params.set("activities-count",activity_ids.join(","));
	new_params.set("guest-count",DATA.room_type.guest);
	$.get(window.location.origin + "/" + URLS.summary + "?" + new_params.toString(),function(){
		init();
		save();
		move(URLS.thankYou);		
	});

}

function checkPage() {
	var currentPage = window.location.href;
	if (currentPage.indexOf(URLS.room_type) > 0) {
		if (!$.isEmptyObject(DATA.room_type)) {
			$("[name=name]").val(DATA.room_type["name"]);
			$("[name=guest-number]").val(DATA.room_type["guest"]);
			$("[name=room-type]").val(DATA.room_type["id"]);
			selectRoomType($(".image-group[data-index=" + DATA.room_type["id"]
					+ "]"));
		}
		calculateTotal();
	} else if (currentPage.indexOf(URLS.room_selection) > 0) {
		$("[name=room-selection]").val(DATA.room["id"]);
		selectRoom($(".box[data-number=" + DATA.room["id"] + "]"));
		calculateTotal();
	} else if (currentPage.indexOf(URLS.activity_selection) > 0) {
		renderActivities();
		calculateTotal();
	} else if (currentPage.indexOf(URLS.summary) > 0) {
		renderActivities();
		calculateTotal();
	}
	// set room
	$("#selected-room").text(DATA.room["id"]);
	
	// set guest
	$("#number-of-guest").text(DATA.room_type.guest);
}

function save() {
	localStorage.setItem(KEY, JSON.stringify(DATA));
}

function move(path) {
	window.location.href = window.location.origin + "/" + path;
}

function moveWithParams(path) {
	window.location.href = window.location.origin + "/" + path
			+ window.location.search;
}

// animations

function onActivityChange(dom, id){
	console.log(dom);
	console.log($(dom).val());
	DATA.activities[id].count = parseInt($(dom).val()); 
	
	calculateTotal();
	renderActivities();
}

function selectRoomType(dom) {
	console.log(dom);
	$(".image-group").parent().removeClass("active");
	$(dom).parent().addClass("active");
	var index = $(dom).data("index");
	DATA.room_type = ROOM_TYPES[index];
	$("[name=room-type]").val(index);
	onGuestChange();
	calculateTotal();
}

function onGuestChange(){
	DATA.room_type["guest"] = parseInt($("[name=guest-number]").val());
	calculateTotal();
}

function selectRoom(dom) {
	console.log(dom);
	$(".box").removeClass("active");
	$(dom).addClass("active");
	// change selection
	var $selection = $("[name=room-selection]");
	var id = parseInt($(dom).data("number"));
	$selection.val(id);
	DATA.room["id"] = id;
	
	calculateTotal();
}

function generateRoomTypeSelection() {
	var $selection = $("[name=room-type]");
	$selection.on("change", function() {
		// console.log(this);
		selectRoomType($(".image-group[data-index="
				+ this.selectedOptions[0].value + "]"));
	});
}

function generateRoomSelection() {
	var $selection = $("[name=room-selection]");
	if ($selection.length) {
		for (var i = ROOM_NO.from; i < ROOM_NO.to + 1; i++) {
			ROOM_NO.data.push(i);
			var option = document.createElement("option");
			option.text = i;
			option.value = i;
			if (ROOM_NO.disabled.indexOf(i) >= 0) {
				option.disabled = true;
				$(".box[data-number=" + i + "]").addClass("disabled");
			}

			$selection[0].add(option);
		}
		console.log(ROOM_NO);

		$selection.on("change", function() {
			// console.log(this);
			selectRoom($(".box[data-number=" + this.selectedOptions[0].value
					+ "]"));
		});
	}
}

function generateActivity() {
	var $activities = $("[name=activity-box]");
	if ($activities.length) {
		$activities.on("click", function() {
			addActivity(this);
		});
	}
}

function goBack() {
	window.history.back();
}

$(document).ready(function() {
	// room on click
	$(".box:not([class=disabled])").on("click", function() {
		selectRoom(this);
	});

	// generate room type select
	generateRoomTypeSelection();

	// generate room select
	generateRoomSelection();

	// generate activity
	generateActivity();

	//
	DATA = JSON.parse(localStorage.getItem(KEY));
	if (DATA) {
		checkPage();
	} else {
		init();
	}
});
