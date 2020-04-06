package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.*;

 
public interface ActivityDao {
	 
	List<OnBoardActivityModel> findAllOnboard();
	List<ActivityModel> findAllByBookingId(int bookingId);
	int createActivity(int guestCount, int bookingID, double totalAmount);

}
