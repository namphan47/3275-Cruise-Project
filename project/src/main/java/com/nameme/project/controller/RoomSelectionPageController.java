package com.nameme.project.controller;

import java.time.LocalDateTime; 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nameme.project.dao.RoomDao;
import com.nameme.project.model.RoomModel;
import com.nameme.project.model.RouteModel;


@Controller
public class RoomSelectionPageController {

	@Autowired
	RoomDao roomDao;
	
	@RequestMapping("/room_selection")
	public String handler(Model model) {

		List<RoomModel> listRoom = roomDao.findAll();
		System.out.println("Room: " + listRoom.size());
		
		
		return "room_selection";
	}
}
