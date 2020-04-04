package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.*;
 
public interface RoomDao {
	 
	List<RoomModel> findAll();
	RoomModel findById(int id);

}
