package com.nameme.project.model;

import java.util.ArrayList;
import java.util.List;

public class RouteModel {
	public int id;
	public String name;
	public String ship;
	public float startDate;
	public float returnDate;
	public String video;
	public double minPriceForTwo;
	
	public List<RoomModel> rooms = new ArrayList<RoomModel>();
	public List<ActivityModel> activities = new ArrayList<ActivityModel>();
	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}
