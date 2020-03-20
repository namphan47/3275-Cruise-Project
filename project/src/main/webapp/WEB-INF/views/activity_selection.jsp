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
                        onclick="move(URLS.route)">Routes</span> / Activities
                </div>
                <div class="page-content flex-grow-1 pt-5">
                    <div class="d-flex h-100">
                        <div class="flex-grow-1 pr-5 left-content">
                            <h4>
                                Sailing to <br>
                                Dawes Glacier, Alaska | Skagway, Alaska | Juneau, Alaska | Ketchikan, Alaska
                            </h4>
                            <div class="py-3">
                                From July 20, 2020 to July 27, 2020
                            </div>
                            <hr>
                            <h4>
                                Selected Room Type
                            </h4>
                            <div class="d-flex flex-column">
                                <div class="d-flex room-type-box mt-4 active">
                                    <div class="image-group">
                                        <img src="../resources/images/room_type1.png" alt="">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <div class="d-flex align-items-end">
                                            <h5>Inside</h5>
                                            <div class="flex-grow-1"></div>
                                            <div>Starting From: &nbsp;</div>
                                            <h4 class="m-0">$5,500 CAD</h4>
                                        </div>
                                        <div>
                                            Sail away in a generous-sized stateroom with a nautical
                                            motif and porthole mirror (no exterior view).
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <h4 class="d-flex">
                                <span>Selected Room</span>
                                <span class="flex-grow-1 text-right">#1001</span>
                            </h4>
                            <hr>
                            <h4>
                                Select Activities
                            </h4>
                            <div class="d-flex flex-column">
                                <div class="d-flex room-type-box mt-4 active">
                                    <div class="image-group" name="activity-box" data-activity="0">
                                        <img src="../resources/images/activity_1.png" alt="">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <div class="d-flex align-items-end">
                                            <h5>Beverage Tastings</h5>
                                            <div class="flex-grow-1"></div>
                                            <h4 class="m-0">$100 CAD each</h4>
                                        </div>
                                        <div>
                                            Discover libation tastings that take you from Amari to
                                            Whiskey with an assortment of pleasurable beverages in
                                            between!
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex room-type-box mt-4">
                                    <div class="image-group" name="activity-box" data-activity="1">
                                        <img src="../resources/images/activity_2.png" alt="">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <div class="d-flex align-items-end">
                                            <h5>Pirate Night</h5>
                                            <div class="flex-grow-1"></div>
                                            <h4 class="m-0">$100 CAD each</h4>
                                        </div>
                                        <div>
                                            On select itineraries, eat, dance and be merry at a
                                            buccaneer bash fit for a pirate.
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex room-type-box mt-4">
                                    <div class="image-group" name="activity-box" data-activity="2">
                                        <img src="../resources/images/activity_3.png" alt="">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <div class="d-flex align-items-end">
                                            <h5>Frozen, A Musical Spectacular</h5>
                                            <div class="flex-grow-1"></div>
                                            <h4 class="m-0">$100 CAD each</h4>
                                        </div>
                                        <div>
                                            Be enchanted as the magic of Frozen springs to life before
                                            your eyes in this musical extravaganza inside the Walt
                                            Disney Theatre now playing on the Disney Wonder and
                                            the Disney Fantasy.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex-shrink-0 right-content">
                            <div class="pb-5 mb-5 px-3 d-flex flex-column h-100">
                                <form class="flex-grow-1 overflow-auto">
                                    <div class="form-group">
                                        <div class="d-flex">
                                            <div class="input-text flex-grow-1" title="Beverage Tastings">Beverage
                                                Tastings
                                            </div>
                                            <input type="number" class="form-control ml-3" style="width: 60px;"
                                                value="1">
                                            <div class="icon justify-content-center align-items-center mx-3">
                                                <i class="far fa-times-circle"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h4 class="text-right">$100 x 1</h4>
                                    <div class="form-group">
                                        <div class="d-flex">
                                            <div class="input-text flex-grow-1" title="Frozen, A Musical Spectacular
                                            ">Frozen, A Musical Spectacular
                                            </div>
                                            <input type="number" class="form-control ml-3" style="width: 60px;"
                                                value="1">
                                            <div class="icon justify-content-center align-items-center mx-3">
                                                <i class="far fa-times-circle"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h4 class="text-right">$100 x 1</h4>
                                </form>
                                <div class="d-flex ">
                                    <button type="button" class="btn" onclick="move(URLS.room_selection)">BACK</button>
                                    <span class="flex-grow-1"></span>
                                    <button type="button" class="btn">NEXT</button>
                                </div>
                                <hr>
                                <div class="d-flex">
                                    <span>Sub Total</span>
                                    <span class="flex-grow-1"></span>
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