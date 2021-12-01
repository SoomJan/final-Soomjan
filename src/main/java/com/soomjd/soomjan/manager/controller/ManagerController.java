package com.soomjd.soomjan.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@GetMapping("/managermain")
	public String managerMain() {
		
		return "manager/managermain";
	}
	
	@GetMapping("/mentilist")
	public String mentilist() {
		
		return "manager/mentilist";
	}
	
	@GetMapping("/mentolist")
	public String mentolist() {
		
		return "manager/mentolist";
	}
	
	@GetMapping("/manproduce")
	public String manproduce() {
		
		return "manager/manproduce";
	}
	
	@GetMapping("/reportedmentee")
	public String reportedmentee() {
		
		return "manager/reportedmentee";
	}
	
	@GetMapping("/reportedmentor")
	public String reportedmentor() {
		
		return "manager/reportedmentor";
	}
	
	@GetMapping("/reportedboard")
	public String reportedboard() {
		
		return "manager/reportedboard";
	}
	
	
	
	
}
