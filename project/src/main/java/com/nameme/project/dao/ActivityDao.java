package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.ActivityModel;

 
public interface ActivityDao {
	 
	List<ActivityModel> findAll();

}
