package com.soomjd.soomjan.findclass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.findclass.service.FindclassService;

@Controller
@RequestMapping("/findclass/*")
public class FindclassController {

	private FindclassService findClassService;
	
	@Autowired
	public FindclassController(FindclassService findClassService) {
		this.findClassService = findClassService;
	}
	
	// GETMapping-> 주소를 통해서 페이지를 이동시키기
	// POSTMapping 

	@GetMapping("/findAllClassMain")
	public void findAllClassMain() {
		System.out.println("확인");
	//  반환형                      변수명                	
		List<ClassDTO> classDTOList = findClassService.selectfindclass();
		System.out.println(classDTOList);
		// DATABAE로 필요한 데이터를 조회 
	}
	
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
