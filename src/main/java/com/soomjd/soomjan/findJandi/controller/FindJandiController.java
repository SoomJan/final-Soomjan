package com.soomjd.soomjan.findJandi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findJandi/*")
public class FindJandiController {

	@GetMapping("/findAllJandiMain")
	public void findAllJandiMain() {}
	
	@GetMapping("/findTopJandiMain")
	public void findTopJandiMain() {}
	
	@GetMapping("/detailJandi")
	public void detailJandi() {}
	
	@GetMapping("/readmentor")
	public void readmentor() {}
	
	@GetMapping("/jandiProfile")
	public void jandiProfile() {}
}
