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

@RequestMapping("/admin")
public class BookingPageController {
	@Autowired
	CruiseDao cruiseDao;
	
	@Autowired
	RouteDao routeDao;
	
	@Autowired
	BookingDao bookingDao;
	
	@Autowired
	CustomerDao customerDao;
	
	@Autowired
	RoomTypeDao roomTypeDao;	
	
	@Autowired
	ActivityDao activityDao;


	@RequestMapping()
	public String handler(Model model) {
		List<CruiseModel> listCruise = cruiseDao.findAll();
		List<RouteModel> listRoute = routeDao.findAll();
		List<BookingModel> listBooking = bookingDao.findAll();
		List<CustomerModel> listCustomer = customerDao.findAll();
		List<RoomTypeModel> listRoomType = roomTypeDao.findAll();
		//List<ActivityModel> listActivity = activityDao.findAllByBookingId();
		//CruiseModel cruiseID  = cruiseDao.findById(1);
		
		for(CruiseModel c : listCruise) {
			c.filterRoutes(listRoute);
		}
		
		//System.out.println("Cruise: " + listCruise.size());
		System.out.println("Booking: " + listBooking.size());
		
		for(BookingModel c : listBooking) {
			for(CustomerModel d : listCustomer)
			{
				if(c.customerID == d.id)
				{
					c.customer = d;
				}
			}
		}
		for(BookingModel c : listBooking) {
			for(RouteModel d : listRoute)
			{
				if(c.routeID == d.id)
				{
					c.route = d;
				}
			}
		}
		for(BookingModel c : listBooking) {
			for(RoomTypeModel d : listRoomType)
			{
				if(c.roomTypeID == d.id)
				{
					c.roomType = d;
				}
			}
		}
		
		model.addAttribute("bookings", listBooking);

		return "admin";
	}
}
