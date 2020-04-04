var KEY = "CRUISE_DATA";
var DATA = {};
var URLS = {
	cruise : "cruise",
	route : "route",
	room_type : "room_type",
	room_selection : "room_selection",
	activity_selection : "activity_selection",
	summary : "summary"
};

var ROOM_NO = {
	disabled : [ 1001, 1002 ],
	data : [],
	from : 1001,
	to : 1034
};

function init() {
	DATA = {
		cruise : {},
		route : {},
		room_type : {},
		room : {},
		activities : {}
	};
}

function selectCruise(id) {
	console.log(id);
	DATA.cruise["id"] = id;
	save();
	move(URLS.route + "?cruise-id=" + id);
}

function selectRoute(id) {
	console.log(id);
	DATA.route["id"] = id;
	save();
	move(URLS.room_type);
}

function nextRoom() {
	console.log($("[name=name]"));
	var name = $("[name=name]").val();
	if (name) {
		DATA.room_type["name"] = name;
		DATA.room_type["guest"] = parseInt($("[name=guest-number]").val());
		save();
		move(URLS.room_selection);
	} else {
		alert("Name cannot be empty");
	}
}

function nextActivity() {
	if ($("[name=room-selection]")[0].selectedIndex > 0) {
		save();
		move(URLS.activity_selection);
	} else {
		alert("Please select room");
	}
}

function addActivity(dom) {
	var id = $(dom).data("activity");
	console.log(id);
	DATA.activities[id] = {
		price : 100,
		count : 1
	};
	renderActivities();
}

function removeActivity(id) {
	delete DATA.activities[id];
	renderActivities();
}

function renderActivities() {

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
	} else if (currentPage.indexOf(URLS.room_selection) > 0) {
		$("[name=room-selection]").val(DATA.room["id"]);
		selectRoom($(".box[data-number=" + DATA.room["id"] + "]"));
	} else if (currentPage.indexOf(URLS.activity_selection) > 0) {
	}
}

function save() {
	localStorage.setItem(KEY, JSON.stringify(DATA));
}

function move(path) {
	window.location.href = window.location.origin + "/" + path;
}

// animations

function selectRoomType(dom) {
	console.log(dom);
	$(".image-group").parent().removeClass("active");
	$(dom).parent().addClass("active");
	var index = $(dom).data("index");
	DATA.room_type["id"] = index;
	$("[name=room-type]").val(index);
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
