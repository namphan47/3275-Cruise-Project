package com.nameme.project.controller;

import java.time.LocalDateTime; 
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CruisePageController {

	
	@RequestMapping("/cruise")
	public String handler(Model model) {

		return "cruise";
	}
}
