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
import com.nameme.project.dao.RoomTypeDao;
import com.nameme.project.dao.RouteDao;
import com.nameme.project.model.CruiseModel;
import com.nameme.project.model.RoomModel;
import com.nameme.project.model.RoomTypeModel;
import com.nameme.project.model.RouteModel;

@Controller
@RequestMapping("room_type")
public class RoomTypePageController {

	@Autowired
	CruiseDao cruiseDao;

	@Autowired
	RouteDao routeDao;

	@Autowired
	RoomTypeDao roomTypeDao;

	@RequestMapping(params = { "cruise-id", "route-id" })
	public String handler(@RequestParam("cruise-id") int id, @RequestParam("route-id") int routeId, Model model) {
		CruiseModel cruise = cruiseDao.findById(id);
		RouteModel route = routeDao.findById(routeId);
		List<RoomTypeModel> listRoomType = roomTypeDao.findAll();

		model.addAttribute("cruise", cruise);
		model.addAttribute("route", route);
		model.addAttribute("roomTypes", listRoomType);
		return "room_type";
	}
}
