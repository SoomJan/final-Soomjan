package com.soomjd.soomjan.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")
@SessionAttributes("loginMember")
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	@GetMapping("regist")
	public String registForm() {
		
		return "join/join";
	}
	
	@PostMapping("regist")
	public String registMember(@ModelAttribute MemberDTO member,
			HttpServletRequest request) throws MemberRegistException {
		
		System.out.println(member);
		
		/* 비밀번호 암호화 처리 */
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		
		/* 성공 실패의 처리 */
		if(!memberService.registMember(member)) {
			
			throw new MemberRegistException("회원가입에 실패하셨습니다.");
		} else {
			
			return "redirect:/";
		}
	}
	
	@GetMapping("login")
	public String loginFrom() {
		
		return "login/login";
	}
	
	@PostMapping("login")
	public String login(@ModelAttribute MemberDTO member, Model model) throws LoginFailedException {
		
		model.addAttribute("loginMember", memberService.loginMember(member));
		
		return "redirect:/";
		
	}
	
	
	
	
}
