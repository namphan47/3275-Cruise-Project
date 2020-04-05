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
							<h4>Available Room Types</h4>
							<div class="d-flex flex-column">
								<c:forEach items="${roomTypes}" var="roomType" varStatus="loop">
									<div class="d-flex room-type-box mt-4">
										<div class="image-group" onclick="selectRoomType(this)"
											data-index="${roomType.id}">
											<img src="../resources/images/${roomType.image}" alt="">
										</div>
										<div class="flex-grow-1 pl-3">
											<div class="d-flex align-items-end">
												<h5>${roomType.name}</h5>
												<div class="flex-grow-1"></div>
												<div>Starting From: &nbsp;</div>
												<h4 class="m-0">
													<fmt:formatNumber value="${roomType.basePrice}"
														type="currency" currencySymbol="$" />
												</h4>
											</div>
											<div>${roomType.description}</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="flex-shrink-0 right-content">
							<div class="pb-5 mb-5 px-3 d-flex flex-column h-100">
								<form class="flex-grow-1 overflow-auto">
									<div class="form-group">
										<label for="">Name</label> <input type="text"
											class="form-control" name="name"
											placeholder="Enter Your Name">
									</div>
									<div class="form-group">
										<label for="">Room Type</label> <select class="form-control"
											name="room-type">
											<option disabled selected>Select Room Type</option>
											<c:forEach items="${roomTypes}" var="roomType"
												varStatus="loop">
												<option value="${roomType.id}">${roomType.name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="">Number of guests</label> <select
											class="form-control" name="guest-number">
											<option value="1">1</option>
											<option value="2" selected>2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
										</select>
									</div>
								</form>
								<div class="d-flex ">
									<span class="flex-grow-1"></span>
									<button type="button" class="btn" onclick="nextRoom()">NEXT</button>
								</div>
								<hr>
								<div class="d-flex">
									<span>Sub Total</span> <span class="flex-grow-1"></span>
									<h4>$25,000 CAD</h4>
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