<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<span onclick="move(URLS.cruise)">Home</span> / <span onclick="move(URLS.cruise)">Cruises</span>
				</div>
				<div class="page-content flex-grow-1 overflow-auto">
					<c:forEach items="${cruises}" var="cruise">
						<div class="cruise-mini-card d-flex mt-5">
							<img src="../resources/images/route1_mini.png" alt="">
							<div class="d-flex flex-column px-5 flex-grow-1">
								<div>Sailing to</div>
								<h5>${cruise.name}</h5>
								<div>Number of routes: ${cruise.routes.size()}</div>
								<span class="flex-grow-1"></span>
								<div class="d-flex">
									<h4>
										Starting from <b>${cruise.minPrice}</b>
									</h4>
									<span class="flex-grow-1"></span>
									<c:if test = "${cruise.routes.size() > 0}">
									<button type="button" class="btn" onclick="selectCruise(${cruise.id})">SELECT</button>
									</c:if>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
</body>

</html>