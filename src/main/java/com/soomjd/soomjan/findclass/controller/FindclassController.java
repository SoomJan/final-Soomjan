package com.soomjd.soomjan.findclass.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	/*
	 * @GetMapping("/class/classRoomNav") public void classRoomNav() {}
	 * 
	 * @GetMapping("/class/classRoom") public void classRoom() {}
	 * 
	 * @GetMapping("/class/classLecture") public void classLecture() {}
	 */
}
