package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.*;
 
public interface RoomTypeDao {
	
	List<RoomTypeModel> findAll();
	RoomTypeModel findById(int id);

}
