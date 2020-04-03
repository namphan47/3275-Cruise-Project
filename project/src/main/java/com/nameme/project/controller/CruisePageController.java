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
public class CruisePageController {
	@Autowired
	CruiseDao cruiseDao;

	@RequestMapping("/cruise")
	public String handler(Model model) {
		List<CruiseModel> list = cruiseDao.findAll();
		System.out.println("Cruise: " + list.size());

		return "cruise";
	}
}
