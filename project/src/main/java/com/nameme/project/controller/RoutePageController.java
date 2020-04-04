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
@RequestMapping("route")
public class RoutePageController {
	@Autowired
	CruiseDao cruiseDao;

	@Autowired
	RouteDao routeDao;

	@RequestMapping(params = "cruise-id")
	public String handleEmployeeRequestByDept(@RequestParam("cruise-id") int id, Model model) {
		CruiseModel cruise = cruiseDao.findById(id);
		List<RouteModel> listRoute = routeDao.findAll();

		cruise.filterRoutes(listRoute);
		
		model.addAttribute("cruise", cruise);
		model.addAttribute("routes", listRoute);
		return "route";
	}

}
