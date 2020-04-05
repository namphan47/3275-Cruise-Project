package com.nameme.project.model;

public class RoomModel {
	public RoomTypeModel roomType;
	public int roomNumber;
	public int roomTypeID;

	public double calculatePrice(int guestCount) {
//		same price for 1 or 2 guests
		return roomType.basePrice * (guestCount < 2 ? 2 : guestCount);
	}

	public RoomTypeModel getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomTypeModel roomType) {
		this.roomType = roomType;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public int getRoomTypeID() {
		return roomTypeID;
	}

	public void setRoomTypeID(int roomTypeID) {
		this.roomTypeID = roomTypeID;
	}
	
}
