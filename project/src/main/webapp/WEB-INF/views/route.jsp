<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="en_CA" scope="session"/>
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
					<span onclick="move(URLS.cruise)">Home</span> / <span onclick="move(URLS.cruise)">Cruises</span> / <span
						onclick="moveWithParams(URLS.route)">Routes</span>
				</div>
				<div class="page-content flex-grow-1 pt-5">
					<div class="d-flex h-100">
						<div class="flex-grow-1 pr-3 left-content">
							<div>
								<video width="100%" height="50%" muted autoplay>
									<source src="../resources/videos/video1.mp4" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
							<h4 class="mt-5">
								Sailing to <br> ${cruise.name}
							</h4>
							<hr>
							<div class="mb-3">
								<b>What's Included in the Price of a Disney Cruise</b>
							</div>
							<div class="row">
								<div class="col">
									Live Shows & Deck Parties <br> Spacious Staterooms <br>
									Adult-Exclusive Activities
								</div>
								<div class="col">
									Pools, Waterslides & Recreation <br> Upscale, Casual, &
									24-Hour In-Room Dining <br> Clubs for Kids, Tweens, and
									Teens
								</div>
							</div>
						</div>
						<div class="flex-shrink-0 pl-3 right-content overflow-auto">
							<c:forEach items="${routes}" var="route">
								<div class="route-box pb-5 mb-5 pr-3">
									<h5>From <fmt:formatDate value="${route.startDateObj}" type="date"
										pattern="MMM dd, yyyy" /> to <fmt:formatDate value="${route.endDateObj}" type="date"
										pattern="MMM dd, yyyy" /></h5>
									<div>${route.name}</div>
									<div>on Disney Wonder ship</div>
									<br>
									<div class="d-flex">
										<div class="flex-grow-1 row">
											<c:forEach items="${roomTypes}" var="roomType">
												<div class="col">
													${roomType.name} <br>
													<fmt:formatNumber value="${roomType.basePrice}"
														type="currency" currencySymbol="$" />
												</div>
											</c:forEach>
										</div>
										<div class="pl-3">
											<button type="button" class="btn"
												onclick="selectRoute(${route.id})">SELECT</button>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</body>

</html>