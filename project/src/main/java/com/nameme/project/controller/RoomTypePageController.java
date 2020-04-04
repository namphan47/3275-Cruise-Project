package com.nameme.project.controller;

import java.time.LocalDateTime; 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nameme.project.dao.RoomTypeDao;
import com.nameme.project.model.RoomModel;
import com.nameme.project.model.RoomTypeModel;


@Controller
public class RoomTypePageController {

	@Autowired
	RoomTypeDao roomTypeDao;
	
	@RequestMapping("/room_type")
	public String handler(Model model) {
		List<RoomTypeModel> listRoom = roomTypeDao.findAll();
				
		System.out.println("Room: " + listRoom.size());
		
		return "room_type";
	}
}
