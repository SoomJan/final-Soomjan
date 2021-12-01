package com.soomjd.soomjan.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class MainController {
	

	@RequestMapping(value= {"/", "main"})
	public String main() {
		
		List<HashMap<String, Object>> memberList = memberService.selectTest();
		for(HashMap<String, Object> member : memberList) {
			System.out.println(member);
		}
		
		return "findclass/class/classLecture";

	}
	
}
