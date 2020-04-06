package com.nameme.project.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nameme.project.dao.*;
import com.nameme.project.model.*;

@Controller
@RequestMapping("summary")
public class SummaryPageController {
	@Autowired
	CruiseDao cruiseDao;

	@Autowired
	RouteDao routeDao;

	@Autowired
	CustomerDao customerDao;

	@Autowired
	RoomTypeDao roomTypeDao;

	@Autowired
	RoomDao roomDao;

	@Autowired
	ActivityDao activityDao;

	@Autowired
	BookingDao bookingDao;

	@RequestMapping(params = { "cruise-id", "route-id", "room-type-id" })
	public String handler(@RequestParam("cruise-id") int id, @RequestParam("route-id") int routeId,
			@RequestParam("room-type-id") int roomTypeId, Model model) {
		CruiseModel cruise = cruiseDao.findById(id);
		RouteModel route = routeDao.findById(routeId);
		RoomTypeModel roomType = roomTypeDao.findById(roomTypeId);
		List<ActivityModel> activityList = activityDao.findAll();

		model.addAttribute("cruise", cruise);
		model.addAttribute("route", route);
		model.addAttribute("roomType", roomType);
		model.addAttribute("activities", activityList);

		return "summary";
	}

	@RequestMapping(params = { "cruise-id", "route-id", "room-type-id", "room-number", "activities", "activities-count",
			"guest-count", "email" })
	public String handler(@RequestParam("cruise-id") int cruiseId, @RequestParam("route-id") int routeId,
			@RequestParam("room-type-id") int roomTypeId, @RequestParam("room-number") int roomNumber,
			@RequestParam("activities") String activities, @RequestParam("activities-count") String activitiesCount,
			@RequestParam("guest-count") int guestCount, @RequestParam("email") String email, Model model) {
//		CruiseModel cruise = cruiseDao.findById(id);
//		RouteModel route = routeDao.findById(routeId);
//		RoomTypeModel roomType = roomTypeDao.findById(roomTypeId);
//		List<ActivityModel> activityList = activityDao.findAll();
//
//		model.addAttribute("cruise", cruise);
//		model.addAttribute("route", route);
//		model.addAttribute("roomType", roomType);
//		model.addAttribute("activities", activityList);

		// create room
		roomDao.create(roomNumber, roomTypeId);

		// create customer
		CustomerModel customerModel = customerDao.findByEmail(email);
		if (customerModel == null) {
			customerDao.create(email, "123");
			customerModel = customerDao.findByEmail(email);
		}

		// create booking
		int bookingId = bookingDao.findAll().size() + 1;
		bookingDao.create(bookingId, guestCount, customerModel.id, routeId, roomNumber);

		// create activities
		String[] activityIds = activities.split(",");
		String[] activityCounts = activitiesCount.split(",");
		System.out.println(roomNumber);
		System.out.println(activities);
		System.out.println(activitiesCount);

		System.out.println(customerDao.findById(23));

		return "summary";
	}
}
