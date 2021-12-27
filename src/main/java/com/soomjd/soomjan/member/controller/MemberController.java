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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember", "isjandi"})
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	/**
	 * @author 권순표
	 * 이용 약관 조회
	 */
	@GetMapping("terms")
	public String termsForm() {
		
		return "join/userAgreement";
	}

	/**
	 * @author 권순표
	 * 회원가입 폼 조회
	 */
	@GetMapping("regist")
	public String registForm() {

		return "join/join";
	}

	/**
	 * @author 권순표
	 * 회원 정보 등록
	 * @param member 사용자가 입력한 정보
	 * @param proof 사용자가 입력한 인증 번호
	 * @return 회원가입 성공 여부
	 */
	@PostMapping("regist")
	public String registMember(@ModelAttribute MemberDTO member, @RequestParam("proof") String proof)
			throws MemberRegistException {

		System.out.println("회원가입할 회원의 정보 : " + member);
		System.out.println("회원가입할 회원의 인증번호 : " + proof);

		/* 비밀번호 암호화 처리 */
		member.setPassword(passwordEncoder.encode(member.getPassword()));

		/* 성공 실패의 처리 */
		if (!memberService.registMember(member)) {

			throw new MemberRegistException("회원가입에 실패하셨습니다.");
		} else {
			
			/* 인증번호 이력 테이블 업데이트 */
			Map<String, String> map = new HashMap<>();
			map.put("email", member.getEmail());
			map.put("number", proof);
			
			boolean checkUpdate = memberService.checkUpdate(map);
			
			if(checkUpdate) {
				return "redirect:/";
			} else {
				throw new MemberRegistException("회원가입에 실패하셨습니다.");
			}
		}
	}
	
	/**
	 * @author 권순표
	 * 이메일 중복 체크
	 * @param response 이메일 중복 여부
	 * @param email 사용자가 입력한 이메일
	 */
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
	
	/**
	 * @author 권순표
	 * 인증번호 확인
	 * @param response 인증번호 일치 여부
	 * @param number 사용자가 입력한 인증 번호
	 */
	@PostMapping("mailCheck")
	public void mailCheck(HttpServletResponse response, @RequestParam("number") String number) throws IOException {
		
		System.out.println("사용자가 입력한 인증 번호 : " + number);
		
		int trueNumber = memberService.numberCheck();
		System.out.println("trueNumber : " + trueNumber);
		
		int number2 = Integer.parseInt(number);
		
		if(number2 == trueNumber) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		
	}
	
	/** 
	 * @author 권순표
	 * 닉네임 중복 체크
	 * @param response 닉네임 중복 여부
	 * @param nickName 사용자가 입력한 닉네임
	 */
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
	
	/**
	 * @author 권순표
	 * 로그인 페이지 조회
	 */
	@GetMapping("login")
	public String loginFrom() {

		return "login/login";
	}

	/**
	 * @author 권순표 
	 * 사용자 로그인
	 * @param response 이메일 및 비밀번호 일치 여부
	 * @param email 사용자 입력 이메일
	 * @param password 사용자 입력 비밀번호
	 */
	@PostMapping("login")
	public void login(SessionStatus status, HttpServletResponse response, @RequestParam("email") String email, @RequestParam("password") String password, Model model) throws IOException {
		
		response.setContentType("application/text; charset=UTF8");
		
		System.out.println("로그인할 이메일 : " + email);
	    System.out.println("로그인할 패스워드 : " + password);
	    
	    Map<String, String> map = new HashMap<>();
	    map.put("email", email);
	    map.put("password", password);
	    
	    /* 사용자가 입력한 이메일이 존재하는지 확인 */
	    if(!memberService.selectEmail(map)) {
	    	response.getWriter().write("emailFalse");
	    
	    /* 해당 이메일의 비밀번호와 사용자가 입력한 비밀번호가 일치하는지 확인 */
	    } else if (!passwordEncoder.matches(password, memberService.selectEncPassword(map))) {
	    	response.getWriter().write("pwdFalse");
	    	
	    /* 회원 정보를 조회 후 세션에 담아준다. */	
	    } else {
	    	MemberDTO loginMember = memberService.loginMember(map);
	    	model.addAttribute("loginMember", loginMember);
	    	
	    	/*
	    	 * 로그인 한 회원 잔디 여부 및 블랙리스 관련 로직
	    	 * 임예람
	    	 * */
	    	if(loginMember.getIsJandi() == 'Y') {
	    		model.addAttribute("isjandi", "Y");
	    	}else {
	    		model.addAttribute("isjandi", "N");
	    	}
	    	
	    	// 블랙리스트 여부가 Y이면
	    	if(loginMember.getIsBlack() == 'Y') {
	    		
	    		// 해당 멤버의 현재 날짜 - 블랙리스트 해제 날짜를 조회하여 해제 까지 남은 일수를 구한다.
	    		double blackD_day = memberService.selectBlackDDay(loginMember.getEmail());
	    		if(blackD_day > 0) { // 남은 일수가 0보다 크면 남은 일수를 반환하고 로그인된 세션 정보를 삭제한다.
	    			System.out.println((int)blackD_day + "일 남음");
	    			response.getWriter().write("누적 경고로 인해 블랙리스트 조치되었습니다. 로그인 가능까지 " + (int)blackD_day + "일 남았습니다." );
	    			status.setComplete();
	    		}else { // 남은 일 수가 0보다 작으면 블랙리스트를 해제하고 로그인을 성공 시킨다.
	    			if(memberService.modifyBlackStatus(loginMember.getEmail())) {
	    				System.out.println("블랙리스트 해제 성공");
	    			}else {
	    				System.out.println("블랙리스트 해제 실패");
	    			}
	    			response.getWriter().write("true");
	    		}
	    	}else {
	    		response.getWriter().write("true");
	    	}
	    }
	}
	
	/**
	 * @author 권순표
	 * 이메일 찾기 폼 조회
	 */
	@GetMapping("findEmail")
	public String findEmailForm() {
		
		return "join/findEmail";
	}
	
	/**
	 * @author 권순표
	 * 사용자 이메일 찾기
	 * @param response 사용자의 이메일
	 * @param name 사용자가 입력한 이름
	 * @param phone 사용자가 입력한 핸드폰 번호
	 */
	@PostMapping("findEmail")
	public void findEmail(HttpServletResponse response, @RequestParam("name") String name, @RequestParam("phone") String phone) throws IOException {
		
		System.out.println("이메일 조회할 이름 : " + name);
		System.out.println("이메일 조회할 핸드폰 번호 : " + phone);
		
	    Map<String, String> map = new HashMap<>();
	    map.put("name", name);
	    map.put("phone", phone);
	    
	    String findEmail = memberService.findEmail(map);
	    System.out.println("찾아온 이메일 : " + findEmail);
	    
	    if(findEmail != null) {
	    	response.getWriter().write(findEmail);
	    } else {
	    	response.getWriter().write("");
	    }
	}
	
	
	/**
	 * @author 권순표
	 * 비밀번호 찾기 폼 조회
	 */
	@GetMapping("findPwd")
	public String findPwdForm() {
		
		return "join/findPwd1";
	}
	
	/**
	 * @author 권순표
	 * 사용자 비밀번호 찾기
	 * @param response 사용자 이메일 존재 여부
	 * @param name 사용자 입력한 이름
	 * @param email 사용자가 입력한 이메일
	 */
	@PostMapping("findPwd")
	public void findPwd(HttpServletResponse response, @RequestParam("name") String name, @RequestParam("email") String email) throws IOException {
		
		System.out.println("비밀번호를 조회할 이름 : " + name);
		System.out.println("비밀번호를 조회할 이메일 : " + email);
		
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		
		boolean findPwd = memberService.findPwd(map);
		System.out.println("계정(비밀번호) 조회 여부 : " + findPwd);
		
		if(findPwd) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	/**
	 * @author 권순표
	 * 사용자 비밀번호 찾기
	 * @param email 사용자 입력 이메일
	 */
	@PostMapping("findPwd2")
	public ModelAndView findPwd2(@RequestParam("email") String email, ModelAndView mv) {
		
		System.out.println("넘어온 이메일 : " + email);
		
		mv.addObject("email", email);
		mv.setViewName("join/findPwd2");
		
		return mv;
	}
	
	/**
	 * @author 권순표
	 * 사용자 이메일로 전송한 인증번호와 사용자가 입력한 인증번호 일치 확인
	 * @param number 사용자 입력 인증번호
	 * @param email 사용자 입력 이메일
	 * @param response 인증번호 일치 여부
	 */
	@PostMapping("pwdCheck")
	public void pwdCheck(@RequestParam("number") String number, @RequestParam("email") String email, HttpServletResponse response) throws IOException {
		
		System.out.println("인증번호를 찾을 이메일 : " + email);
		System.out.println("사용자가 입력한 인증번호 : " + number);
		
		int number2 = Integer.parseInt(number);
		
		int trueNumber = memberService.pwdCheck(email);
		
		if(number2 == trueNumber) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		
	}
	
	
	/**
	 * @author 권순표
	 * 사용자 비밀번호 찾기
	 * @param email 사용자 입력 이메일
	 */
	@PostMapping("findPwd3")
	public ModelAndView findPwd3(@RequestParam("email") String email, ModelAndView mv) {
		
		System.out.println("넘어온 이메일 : " + email);
		
		mv.addObject("email", email);
		mv.setViewName("join/findPwd3");
		
		return mv;
	}
	
	/**
	 * @author 권순표
	 * 사용자 비밀번호 수정
	 * @param response 수정 성공 여부
	 * @param email 사용자 입력 이메일
	 * @param pwd 사용자 입력 패스워드
	 */
	@PostMapping("updatePwd")
	public void updatePwd(HttpServletResponse response, @RequestParam("email") String email, @RequestParam("pwd") String pwd) throws IOException {
		
		System.out.println("비밀번호를 수정할 이메일 : " + email);
		System.out.println("수정될 패스워드 : " + pwd);
		
		/* 비밀번호 암호화 처리 */
		String setPwd = passwordEncoder.encode(pwd);
		System.out.println("암호화된 패스워드 : " + setPwd);
		
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pwd", setPwd);
		
		boolean updatePwd = memberService.updatePwd(map);
		
		if(updatePwd) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	/**
	 * @author 권순표
	 * 사용자 로그아웃
	 * @param status 현재 세션
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	
	/**
	 * 잔디 닉네임 중복 체크
	 * 
	 * @param nickName
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("jandiNickDupCheck")
	public @ResponseBody String jandiNickDupCheck(@RequestParam String nickName) {
		
		String result = "false";
		if(memberService.selectJandiNickDupCheck(nickName) > 0) {
			result = "true";
		}
		
		return result; 
	}
	
}
