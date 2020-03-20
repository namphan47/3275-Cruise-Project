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
                        onclick="move(URLS.route)">Routes</span> / <span onclick="move(URLS.room_type)">Rooms</span>
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
                                Available Room Types
                            </h4>
                            <div class="d-flex flex-column">
                                <div class="d-flex room-type-box mt-4">
                                    <div class="image-group" onclick="selectRoomType(this)" data-index="0">
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
                                <div class="d-flex room-type-box mt-4">
                                    <div class="image-group" onclick="selectRoomType(this)" data-index="1">
                                        <img src="../resources/images/room_type2.png" alt="">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <div class="d-flex align-items-end">
                                            <h5>Oceanview</h5>
                                            <div class="flex-grow-1"></div>
                                            <div>Starting From: &nbsp;</div>
                                            <h4 class="m-0">$7,500 CAD</h4>
                                        </div>
                                        <div>
                                            Unwind in roomy quarters adorned in a charming nautical
                                            motif, with a real porthole window or possibly 2!
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex room-type-box mt-4">
                                    <div class="image-group" onclick="selectRoomType(this)" data-index="2">
                                        <img src="../resources/images/room_type3.png" alt="">
                                    </div>
                                    <div class="flex-grow-1 pl-3">
                                        <div class="d-flex align-items-end">
                                            <h5>Verandah</h5>
                                            <div class="flex-grow-1"></div>
                                            <div>Starting From: &nbsp;</div>
                                            <h4 class="m-0">$9,500 CAD</h4>
                                        </div>
                                        <div>
                                            These are our most spacious non-Concierge staterooms,
                                            each with a private verandah (some with partial views).
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex-shrink-0 right-content">
                            <div class="pb-5 mb-5 px-3 d-flex flex-column h-100">
                                <form class="flex-grow-1 overflow-auto">
                                    <div class="form-group">
                                        <label for="">Name</label>
                                        <input type="text" class="form-control" name="name"
                                            placeholder="Enter Your Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Room Type</label>
                                        <select class="form-control" name="room-type">
                                            <option disabled selected>Select Room Type</option>
                                            <option value="0">Inside</option>
                                            <option value="1">Oceanview</option>
                                            <option value="2">Verandah</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Number of guests</label>
                                        <select class="form-control" name="guest-number">
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