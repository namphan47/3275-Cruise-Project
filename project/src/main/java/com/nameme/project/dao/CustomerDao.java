package com.nameme.project.dao;

import java.util.List;

import com.nameme.project.model.CustomerModel;
 
public interface CustomerDao {
	 
	List<CustomerModel> findAll();
	CustomerModel findById(int id);
	CustomerModel findByEmail(String email);
	int create(String email,String password);
}
