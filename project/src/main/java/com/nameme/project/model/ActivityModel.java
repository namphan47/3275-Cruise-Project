package com.nameme.project.model;

public class ActivityModel {
	public int activityId;
	public String name;
	public String description;
	public String imageSrc;
	public double price;
	public int guestCount;

	public double calculatePrice() {
		return price * guestCount;
	}

	public int getActivityId() {
		return activityId;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getImageSrc() {
		return imageSrc;
	}

	public double getPrice() {
		return price;
	}

	public int getGuestCount() {
		return guestCount;
	}

}
