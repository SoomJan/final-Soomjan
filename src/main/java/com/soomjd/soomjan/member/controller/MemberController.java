package com.soomjd.soomjan.member.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soomjd.soomjan.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}


	@GetMapping("/testDb")
	public String testDb() {

		List<HashMap<String, Object>> memberList = memberService.selectTest();
		for(HashMap<String, Object> member : memberList) {
			System.out.println(member);
		}

		return "/login";
	}

}
