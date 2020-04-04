package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.CruiseModel;
import com.nameme.project.model.RouteModel;
 
public interface CruiseDao {
	 
	List<CruiseModel> findAll();
	CruiseModel findById(int id);

}
