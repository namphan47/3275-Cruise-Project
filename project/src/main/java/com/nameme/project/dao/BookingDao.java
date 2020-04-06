package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.BookingModel;

public interface BookingDao {

	List<BookingModel> findAll();
	int updateTotal(int id, double total);
	int create(int id, int guestCount, int customerID, int routeID, int roomNumber);
}
