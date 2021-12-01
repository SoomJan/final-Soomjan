package com.soomjd.soomjan.findmentor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findmentor/*")
public class FindmentorController {

	@GetMapping("/findAllMentorMain")
	public void findAllMentorMain() {}
	
	@GetMapping("/findTopMentorMain")
	public void findTopMentorMain() {}
	
	@GetMapping("/detailmentor")
	public void detailmentor() {}
	
	@GetMapping("/readmentor")
	public void readmentor() {}
	
	@GetMapping("/mentorProfile")
	public void mentorProfile() {}
}
