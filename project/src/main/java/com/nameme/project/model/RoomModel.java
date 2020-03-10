package com.nameme.project.model;

public class RoomModel {
	public RoomTypeModel type;
	public int roomNumber;
	private int max = 8;

	public double calculatePrice(int guestCount) {
//		same price for 1 or 2 guests
		return type.basePrice * (guestCount < 2 ? 2 : guestCount);
	}
}
