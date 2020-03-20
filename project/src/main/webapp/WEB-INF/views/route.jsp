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
<script
	src="<c:url value="/resources/js/controller.js" />"></script>
<%@ page isELIgnored="false"%>
</head>

<body>
    <div class="main-wrapper">
        <div class="left-bar d-flex flex-column">
            <img class="logo" src="../resources/images/logo.png" alt="">
            <span class="flex-grow-1"></span>
            <div class="text-center p-3">
                <i class="far fa-user-circle"></i>
            </div>
            <div class="text-center p-3">
                <i class="far fa-question-circle"></i>
            </div>
        </div>
        <div class="main-content">
            <div class="d-flex flex-column h-100">
                <div class="bread-crumb">
                    Home / <span onclick="move(URLS.cruise)">Cruises</span> / <span
                        onclick="move(URLS.route)">Routes</span>
                </div>
                <div class="page-content flex-grow-1 pt-5">
                    <div class="d-flex h-100">
                        <div class="flex-grow-1 pr-3 left-content">
                            <div>
                                <video width="100%" height="50%" autoplay=true>
                                    <source src="../resources/videos/video1.mp4" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            </div>
                            <h4 class="mt-5">
                                Sailing to <br>
                                Dawes Glacier, Alaska | Skagway, Alaska | Juneau, Alaska | Ketchikan, Alaska
                            </h4>
                            <hr>
                            <div class="mb-3"><b>What's Included in the Price of a Disney Cruise</b></div>
                            <div class="row">
                                <div class="col">
                                    Live Shows & Deck Parties <br>
                                    Spacious Staterooms <br>
                                    Adult-Exclusive Activities
                                </div>
                                <div class="col">
                                    Pools, Waterslides & Recreation <br>
                                    Upscale, Casual, & 24-Hour In-Room Dining <br>
                                    Clubs for Kids, Tweens, and Teens
                                </div>
                            </div>
                        </div>
                        <div class="flex-shrink-0 pl-3 right-content overflow-auto">
                            <div class="route-box pb-5 mb-5 pr-3">
                                <h5>From July 20, 2020 to July 27, 2020</h5>
                                <div>on Disney Wonder ship</div>
                                <br>
                                <div class="d-flex">
                                    <div class="flex-grow-1 row">
                                        <div class="col">
                                            Inside
                                            <br>
                                            $5,000
                                        </div>
                                        <div class="col">
                                            Oceanview
                                            <br>
                                            $7,000
                                        </div>
                                        <div class="col">
                                            Verandah
                                            <br>
                                            $9,000
                                        </div>
                                    </div>
                                    <div class="pl-3">
                                        <button type="button" class="btn" onclick="selectRoute(0)">SELECT</button>
                                    </div>
                                </div>
                            </div>
                            <div class="route-box pb-5 mb-5 pr-3">
                                <h5>From July 20, 2020 to July 27, 2020</h5>
                                <div>on Disney Wonder ship</div>
                                <br>
                                <div class="d-flex">
                                    <div class="flex-grow-1 row">
                                        <div class="col">
                                            Inside
                                            <br>
                                            $5,000
                                        </div>
                                        <div class="col">
                                            Oceanview
                                            <br>
                                            $7,000
                                        </div>
                                        <div class="col">
                                            Verandah
                                            <br>
                                            $9,000
                                        </div>
                                    </div>
                                    <div class="pl-3">
                                        <button type="button" class="btn">SELECT</button>
                                    </div>
                                </div>
                            </div>
                            <div class="route-box pb-5 mb-5 pr-3">
                                <h5>From July 20, 2020 to July 27, 2020</h5>
                                <div>on Disney Wonder ship</div>
                                <br>
                                <div class="d-flex">
                                    <div class="flex-grow-1 row">
                                        <div class="col">
                                            Inside
                                            <br>
                                            $5,000
                                        </div>
                                        <div class="col">
                                            Oceanview
                                            <br>
                                            $7,000
                                        </div>
                                        <div class="col">
                                            Verandah
                                            <br>
                                            $9,000
                                        </div>
                                    </div>
                                    <div class="pl-3">
                                        <button type="button" class="btn">SELECT</button>
                                    </div>
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