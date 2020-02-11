package com.nameme.project.model;

public class ActivityModel {
	public String name;
	public String description;
	public String imageSrc;
	public double price;
	public int guestCount;

	public double calculatePrice() {
		return price * guestCount;
	}
}
