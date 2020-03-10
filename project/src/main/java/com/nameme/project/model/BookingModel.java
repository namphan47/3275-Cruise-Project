package com.nameme.project.model;

import java.util.ArrayList;
import java.util.List;

public class BookingModel {
	public int id;
	public int guestCount;
	public CustomerModel customer;
	public RouteModel route;
	public List<ActivityModel> activities = new ArrayList<ActivityModel>();
	public RoomModel room;

	public double calculatePrice() {
		double total = room.calculatePrice(guestCount);
		for (ActivityModel a : activities) {
			total += a.calculatePrice();
		}
		return total;
	}
}
