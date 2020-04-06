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
var ACTIVITIES = {
			  <c:forEach items="${activities}" var="activity">
			  ${activity.activityId}:{
				  id:${activity.activityId},
				  name: "${activity.name}",
				  description: "${activity.description}",
				  price: ${activity.price}
			  },
		  </c:forEach>
};
		console.log(ACTIVITIES);
</script>
</head>

<body>
	<div class="main-wrapper">
		<jsp:include page="left_bar.jsp" />
		<div class="main-content">
			<div class="d-flex flex-column h-100">
				<div class="bread-crumb">
					<span onclick="move(URLS.cruise)">Home</span> / <span
						onclick="move(URLS.cruise)">Cruises</span> / <span
						onclick="moveWithParams(URLS.route)">Routes</span> / Activities
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
							<h4 class="d-flex">
								<span>Selected Room</span> <span class="flex-grow-1 text-right"
									id="selected-room"></span>
							</h4>
							<hr>
							<h4>Select Activities</h4>
							<div class="d-flex flex-column">
								<c:forEach items="${activities}" var="activity" varStatus="loop">
									<div class="d-flex room-type-box mt-4">
										<div class="image-group" name="activity-box"
											data-activity="${activity.activityId}">
											<img src="../resources/images/${activity.imageSrc}" alt="">
										</div>
										<div class="flex-grow-1 pl-3">
											<div class="d-flex align-items-end">
												<h5>${activity.name}</h5>
												<div class="flex-grow-1"></div>
												<h4 class="m-0">
													<fmt:formatNumber value="${activity.price}" type="currency"
														currencySymbol="$" />
													each
												</h4>
											</div>
											<div>${activity.description}</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="flex-shrink-0 right-content">
							<div class="pb-5 mb-5 px-3 d-flex flex-column h-100">
								<form class="flex-grow-1 overflow-auto"
									id="activities-selection-form">
									<!-- <div>
										<div class="form-group">
											<div class="d-flex">
												<div class="input-text flex-grow-1">Beverage Tastings</div>
												<input type="number" class="form-control ml-3"
													style="width: 60px;" value="1" data-activity="">
												<div
													class="icon justify-content-center align-items-center mx-3">
													<i class="far fa-times-circle cursor-pointer"
														onClick="removeActivity(1)"></i>
												</div>
											</div>
										</div>
										<h4 class="text-right">$100 x 1</h4>
									</div>
									 -->
								</form>
								<div class="d-flex ">
									<button type="button" class="btn" onclick="goBack()">BACK</button>
									<span class="flex-grow-1"></span>
									<button type="button" class="btn" onclick="nextSummary()">NEXT</button>
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