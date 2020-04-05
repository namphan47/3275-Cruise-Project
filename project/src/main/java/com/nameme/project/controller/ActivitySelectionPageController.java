package com.nameme.project.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nameme.project.dao.*;
import com.nameme.project.model.*;

@Controller
@RequestMapping("activity_selection")
public class ActivitySelectionPageController {
	@Autowired
	CruiseDao cruiseDao;

	@Autowired
	RouteDao routeDao;

	@Autowired
	RoomTypeDao roomTypeDao;

	@Autowired
	ActivityDao activityDao;

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

		return "activity_selection";
	}
}
