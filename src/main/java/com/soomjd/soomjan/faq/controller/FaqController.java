package com.soomjd.soomjan.faq.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.faq.model.dto.FaqDTO;

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

	//사용자 공지사항 조회
	@GetMapping("/notice")
	public String notice(Model model, FaqDTO faq, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,@RequestParam(defaultValue = "1") int currentPage) {
		
		return "faq/notice";
	}
	
}
