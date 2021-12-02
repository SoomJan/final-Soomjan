package com.soomjd.soomjan.findclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findclass/*")
public class FindclassController {

	@GetMapping("/findAllClassMain")
	public void findAllClassMain() {}
	
	@GetMapping("/findTopClassMain")
	public void findTopClassMain() {}
	
	@GetMapping("/detailclass")
	public void detailclass() {}
	
	@GetMapping("/detailclassvideo")
	public void detailclassvideo() {}
	
	@GetMapping("/class/classRoomNav")
	public void classRoomNav() {}
	
	@GetMapping("/class/classRoom")
	public void classRoom() {}
	
	@GetMapping("/class/classLecture")
	public void classLecture() {}
}
