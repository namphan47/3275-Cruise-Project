package com.nameme.project.controller;

import java.time.LocalDateTime; 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nameme.project.dao.*;
import com.nameme.project.model.*;

@Controller
public class ActivitySelectionPageController {

	@Autowired
	ActivityDao activityDao;
	
	@RequestMapping("/activity_selection")
	public String handler(Model model) {
		List<ActivityModel> list = activityDao.findAll();
		System.out.println("activity_selection: " + list.size());
		
		return "activity_selection";
	}
}
