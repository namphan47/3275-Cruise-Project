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
					<span onclick="move(URLS.cruise)">Home</span> / Summary
				</div>
				<div class="page-content flex-grow-1 pt-5">
					<div class="d-flex h-100 justify-content-center align-items-center">
						<div class="text-center">
							<h5>Thank you for booking</h5>
							<br>
							<button type="button" class="btn" onclick="move(URLS.cruise)">Back
								to Home</button>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</body>

</html>