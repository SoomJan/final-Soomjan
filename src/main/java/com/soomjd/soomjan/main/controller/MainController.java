package com.soomjd.soomjan.main.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soomjd.soomjan.member.model.service.MemberService;

@Controller
@RequestMapping("/*")
public class MainController {
	

	@RequestMapping(value= {"/", "main"})
	public String main() {
		
		return "main/main";
	}
	
}
