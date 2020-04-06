<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="en_CA" scope="session" />
<!DOCTYPE html>
<html>

<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<c:url value="/resources/jquery-3.4.1.min.js" />"></script>
<script
	src="<c:url value="/resources/bootstrap-4.4.1-dist/js/bootstrap.min.js" />"></script>
<link
	href="<c:url 
value="/resources/bootstrap-4.4.1-dist/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css">
</link>
<link href="<c:url 
value="/resources/css/style.css" />"
	rel="stylesheet" type="text/css">
</link>
<link
	href="<c:url 
value="/resources/fontawesome-free-5.12.1-web/css/all.min.css" />"
	rel="stylesheet" type="text/css">
</link>
<script src="<c:url value="/resources/js/controller.js" />"></script>
<%@ page isELIgnored="false"%>
<script type="text/javascript">
ROOM_NO["disabled"] = [
			  <c:forEach items="${rooms}" var="room">
			  ${room.roomNumber},
		  </c:forEach>
		];
var ROOM_TYPES = {
		  <c:forEach items="${roomTypes}" var="roomType">
		  ${roomType.id}:{
			  id:${roomType.id},
			  name: "${roomType.name}",
			  basePrice: ${roomType.basePrice}
		  },
	  </c:forEach>
};
</script>
</head>

<body>
	<div class="main-wrapper">
		<jsp:include page="left_bar.jsp" />
		<div class="main-content">
			<div class="d-flex flex-column h-100">
				<div class="bread-crumb">
					Home / <span onclick="move(URLS.cruise)">Cruises</span> / <span
						onclick="moveWithParams(URLS.route)">Routes</span> / <span
						onclick="moveWithParams(URLS.room_type)">Rooms</span>
				</div>
				<div class="page-content flex-grow-1 pt-5">
					<div class="d-flex h-100">
						<div class="flex-grow-1 pr-5 left-content">
							<h4>
								Sailing to - ${cruise.name} </br> ${route.name}
							</h4>
							<div class="py-3">
								From
								<fmt:formatDate value="${route.startDateObj}" type="date"
									pattern="MMM dd, yyyy" />
								to
								<fmt:formatDate value="${route.endDateObj}" type="date"
									pattern="MMM dd, yyyy" />
							</div>
							<hr>
							<h4>Selected Room Type</h4>
							<div class="d-flex flex-column">
								<div class="d-flex room-type-box mt-4 active">
									<div class="image-group">
										<img src="../resources/images/${roomType.image}" alt="">
									</div>
									<div class="flex-grow-1 pl-3 d-flex flex-column">
										<div class="d-flex align-items-end">
											<h5>${roomType.name}</h5>
											<div class="flex-grow-1"></div>
											<div>Starting From: &nbsp;</div>
											<h4 class="m-0">
												<fmt:formatNumber value="${roomType.basePrice}"
													type="currency" currencySymbol="$" />
											</h4>
										</div>
										<div class="flex-grow-1">${roomType.description}</div>
										<h5>
											Number of guests: <span id="number-of-guest"></span>
										</h5>
									</div>
								</div>
							</div>
							<hr>
							<h4>Available Rooms</h4>
							<div class="text-center m-5">
								<div class="room-selection-wrapper ">
									<div class="d-flex">
										<div class="left">
											<div class="box" data-number="1001">1001</div>
											<div class="box" data-number="1002">1002</div>
											<div class="box" data-number="1003">1003</div>
											<div class="box" data-number="1004">1004</div>
											<div class="box" data-number="1005">1005</div>
											<div class="box" data-number="1006">1006</div>
											<div class="box" data-number="1007">1007</div>
											<div class="box" data-number="1008">1008</div>
											<div class="box" data-number="1009">1009</div>
											<div class="box" data-number="1010">1010</div>
											<div class="box" data-number="1011">1011</div>
										</div>
										<div>
											<div class="middle d-flex">
												<div class="">
													<div class="box" data-number="1023">1023</div>
													<div class="box" data-number="1024">1024</div>
													<div class="box" data-number="1025">1025</div>
												</div>
												<div class="">
													<div class="box" data-number="1026">1026</div>
													<div class="box" data-number="1027">1027</div>
													<div class="box" data-number="1028">1028</div>
												</div>
											</div>
											<div class="circle"></div>
											<div class="middle d-flex">
												<div class="">
													<div class="box" data-number="1029">1020</div>
													<div class="box" data-number="1030">1030</div>
													<div class="box" data-number="1031">1031</div>
												</div>
												<div class="">
													<div class="box" data-number="1032">1032</div>
													<div class="box" data-number="1033">1033</div>
													<div class="box" data-number="1034">1034</div>
												</div>
											</div>
										</div>
										<div class="right">
											<div class="box" data-number="1012">1012</div>
											<div class="box" data-number="1013">1013</div>
											<div class="box" data-number="1014">1014</div>
											<div class="box" data-number="1015">1015</div>
											<div class="box" data-number="1016">1016</div>
											<div class="box" data-number="1017">1017</div>
											<div class="box" data-number="1018">1018</div>
											<div class="box" data-number="1019">1019</div>
											<div class="box" data-number="1020">1020</div>
											<div class="box" data-number="1021">1021</div>
											<div class="box" data-number="1022">1022</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="flex-shrink-0 right-content">
							<div class="pb-5 mb-5 px-3 d-flex flex-column h-100">
								<form class="flex-grow-1 overflow-auto">
									<div class="form-group">
										<label for="">Room number</label> <select class="form-control"
											name="room-selection">
											<option disabled selected>Select</option>
										</select>
									</div>
									<div>
										<div class="d-flex align-items-center">
											<div class="sample-box white"></div>
											<div class="m-4">Available Room</div>
										</div>
										<div class="d-flex align-items-center">
											<div class="sample-box blue"></div>
											<div class="m-4">Selected Room</div>
										</div>
										<div class="d-flex align-items-center">
											<div class="sample-box grey"></div>
											<div class="m-4">Not Available Room</div>
										</div>
									</div>
								</form>
								<div class="d-flex ">
									<button type="button" class="btn" onclick="goBack()">BACK</button>
									<span class="flex-grow-1"></span>
									<button type="button" class="btn" onclick="nextActivity()">NEXT</button>
								</div>
								<hr>
								<div class="d-flex">
									<span>Sub Total</span> <span class="flex-grow-1"></span>
									<h4>
										<span id="total-text"></span> CAD
									</h4>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</body>

</html>