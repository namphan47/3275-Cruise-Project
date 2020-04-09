package com.nameme.project.model;

import java.util.ArrayList;
import java.util.List;

public class BookingModel {
	public int id;
	public int guestCount;
	public int customerID;
	public int routeID;
	public int roomNumber;
	public CustomerModel customer;
	public RouteModel route;
	public List<ActivityModel> activities = new ArrayList<ActivityModel>();
	public RoomModel room;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGuestCount() {
		return guestCount;
	}
	public void setGuestCount(int guestCount) {
		this.guestCount = guestCount;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public int getRouteID() {
		return routeID;
	}
	public void setRouteID(int routeID) {
		this.routeID = routeID;
	}
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public CustomerModel getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerModel customer) {
		this.customer = customer;
	}
	public RouteModel getRoute() {
		return route;
	}
	public void setRoute(RouteModel route) {
		this.route = route;
	}
	public List<ActivityModel> getActivities() {
		return activities;
	}
	public void setActivities(List<ActivityModel> activities) {
		this.activities = activities;
	}
	public RoomModel getRoom() {
		return room;
	}
	public void setRoom(RoomModel room) {
		this.room = room;
	}

	
//	public double calculatePrice() {
//		double total = room.calculatePrice(guestCount);
//		for (ActivityModel a : activities) {
//			total += a.calculatePrice();
//		}
//		return total;
//	}
}
