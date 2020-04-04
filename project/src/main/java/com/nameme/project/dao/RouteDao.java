package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.CruiseModel;
import com.nameme.project.model.RouteModel;
 
public interface RouteDao {
	 
	List<RouteModel> findAll();
	RouteModel findById(int id);

}
