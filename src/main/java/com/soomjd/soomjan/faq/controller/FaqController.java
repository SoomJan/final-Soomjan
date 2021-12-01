package com.soomjd.soomjan.faq.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/faq/*")
@SessionAttributes("loginMember")
public class FaqController {

	
	@GetMapping(value= {"/", "faq"})
	public String faq() {
		return "faq/FAQ";
	}
	
	@GetMapping(value= {"/", "policy"})
	public String policy() {
		return "faq/policy";
	}

	
}
