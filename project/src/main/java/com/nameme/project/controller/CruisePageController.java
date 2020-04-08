package com.nameme.project.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nameme.project.dao.*;
import com.nameme.project.model.*;

@Controller
public class CruisePageController {
	@Autowired
	CruiseDao cruiseDao;
	
	@Autowired
	RouteDao routeDao;

	@RequestMapping("/cruise")
	public String handler(Model model) {
		List<CruiseModel> listCruise = cruiseDao.findAll();
		List<RouteModel> listRoute = routeDao.findAll();
		CruiseModel cruiseID  = cruiseDao.findById(1);
		
		for(CruiseModel c : listCruise) {
			c.filterRoutes(listRoute);
		}
		
		System.out.println("Cruise: " + listCruise.size());
		System.out.println("Cruise Name: " + cruiseID.getName());
		System.out.println("route: " + listRoute.size());
		
		model.addAttribute("cruises", listCruise);

		return "cruise";
	}
}
