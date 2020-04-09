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
public class BookingPageController {
	@Autowired
	CruiseDao cruiseDao;
	
	@Autowired
	RouteDao routeDao;
	
	@Autowired
	BookingDao bookingDao;
	
	@Autowired
	CustomerDao customerDao;

	@RequestMapping("/admin")
	public String handler(Model model) {
		List<CruiseModel> listCruise = cruiseDao.findAll();
		List<RouteModel> listRoute = routeDao.findAll();
		List<BookingModel> listBooking = bookingDao.findAll();
		List<CustomerModel> listCustomer = customerDao.findAll();
		CruiseModel cruiseID  = cruiseDao.findById(1);
		
		for(CruiseModel c : listCruise) {
			c.filterRoutes(listRoute);
		}
		
		//System.out.println("Cruise: " + listCruise.size());
		System.out.println("Booking: " + listBooking.size());
		
		model.addAttribute("bookings", listBooking);
		model.addAttribute("customer", listCustomer);

		return "admin";
	}
}
