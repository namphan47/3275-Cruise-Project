package com.nameme.project.model;

import java.util.ArrayList;
import java.util.List;

public class RouteModel {
	public String name;
	public String ship;
	public int startDate;
	public int returnDate;
	public String video;
	public double minPriceForTwo;
	
	public List<RoomModel> rooms = new ArrayList<RoomModel>();
	public List<ActivityModel> activities = new ArrayList<ActivityModel>();
	
	public String startDateToString() {
		return "";
	}

	public String returnDateToString() {
		return "";
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}
