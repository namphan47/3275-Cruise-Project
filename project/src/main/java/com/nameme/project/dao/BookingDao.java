package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.BookingModel;


public interface BookingDao {
	 
	List<BookingModel> findAll();

}
