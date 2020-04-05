package com.nameme.project.model;

import java.util.ArrayList;
import java.util.Date;
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

	public Date startDateObj;
	public Date endDateObj;

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShip() {
		return ship;
	}

	public void setShip(String ship) {
		this.ship = ship;
	}

	public double getMinPriceForTwo() {
		return minPriceForTwo;
	}

	public void setMinPriceForTwo(double minPriceForTwo) {
		this.minPriceForTwo = minPriceForTwo;
	}

	public float getStartDate() {
		return startDate;
	}

	public void setStartDate(float startDate) {
		this.startDate = startDate;
		this.startDateObj = new Date((long) this.startDate);
		System.out.println(this.startDateObj.toLocaleString());
	}

	public float getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(float returnDate) {
		this.returnDate = returnDate;
		this.endDateObj = new Date((long) this.returnDate);
	}

	public Date getStartDateObj() {
		return startDateObj;
	}

	public void setStartDateObj(Date startDateObj) {
		this.startDateObj = startDateObj;
	}

	public Date getEndDateObj() {
		return endDateObj;
	}

	public void setEndDateObj(Date endDateObj) {
		this.endDateObj = endDateObj;
	}

}
