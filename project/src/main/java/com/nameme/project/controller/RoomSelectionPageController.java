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

import com.nameme.project.dao.CruiseDao;
import com.nameme.project.dao.RoomDao;
import com.nameme.project.dao.RoomTypeDao;
import com.nameme.project.dao.RouteDao;
import com.nameme.project.model.CruiseModel;
import com.nameme.project.model.RoomModel;
import com.nameme.project.model.RoomTypeModel;
import com.nameme.project.model.RouteModel;

@Controller
@RequestMapping("room_selection")
public class RoomSelectionPageController {

	@Autowired
	CruiseDao cruiseDao;

	@Autowired
	RouteDao routeDao;

	@Autowired
	RoomTypeDao roomTypeDao;
	
	@Autowired
	RoomDao roomDao;

	@RequestMapping(params = { "cruise-id", "route-id", "room-type-id" })
	public String handler(@RequestParam("cruise-id") int id, @RequestParam("route-id") int routeId,
			@RequestParam("room-type-id") int roomTypeId, Model model) {

		CruiseModel cruise = cruiseDao.findById(id);
		RouteModel route = routeDao.findById(routeId);
		RoomTypeModel roomType = roomTypeDao.findById(roomTypeId);
		List<RoomModel> rooms = roomDao.findAll();

		model.addAttribute("cruise", cruise);
		model.addAttribute("route", route);
		model.addAttribute("roomType", roomType);
		model.addAttribute("rooms", rooms);
		
		return "room_selection";
	}
}
