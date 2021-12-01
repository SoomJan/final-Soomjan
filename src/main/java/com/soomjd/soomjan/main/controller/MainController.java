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
	
	private MemberService memberService;
	
	@Autowired
	public MainController(MemberService memberService) {
		this.memberService = memberService;
	}


	@GetMapping(value= {"/", "main"})
	public String main() {
		
		List<HashMap<String, Object>> memberList = memberService.selectTest();
		for(HashMap<String, Object> member : memberList) {
			System.out.println(member);
		}
		
		return "findclass/class/classLecture";
	}
	
}