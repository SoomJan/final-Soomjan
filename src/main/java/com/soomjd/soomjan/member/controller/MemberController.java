package com.soomjd.soomjan.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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

	// 죄송해요 순표님 테스트하나만 넣을게요ㅜㅜ
	@GetMapping("classChat")
	public String memberClassChat(Model model) {

		return "mypage/class/classChat";
	}

	@GetMapping("regist")
	public String registForm() {

		return "join/join";
	}

	@PostMapping("regist")
	public String registMember(@ModelAttribute MemberDTO member, HttpServletRequest request)
			throws MemberRegistException {

		System.out.println(member);

		/* 비밀번호 암호화 처리 */
		member.setPassword(passwordEncoder.encode(member.getPassword()));

		/* 성공 실패의 처리 */
		if (!memberService.registMember(member)) {

			throw new MemberRegistException("회원가입에 실패하셨습니다.");
		} else {

			return "redirect:/";
		}
	}
	
	@PostMapping("idDupCheck")
	public void idDupCheck(HttpServletResponse response, @RequestParam("email") String email) throws IOException {
		
		System.out.println("중복체크할 이메일 : " + email);
		
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		
		boolean isDup = memberService.idDupCheck(map);
		System.out.println("이메일 중복 체크 결과 : " + isDup);
		
		if(isDup) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	@PostMapping("nickDupCheck")
	public void nickDupCheck(HttpServletResponse response, @RequestParam("nickName") String nickName) throws IOException {
		
		System.out.println("중복 체크할 닉네임 : " + nickName);
		
		Map<String, String> map = new HashMap<>();
		map.put("nickName", nickName);
		
		boolean isDup = memberService.nickDupCheck(map);
		System.out.println("닉네임 중복 체크 결과 : " + isDup);
		
		if(isDup) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
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
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	
}
