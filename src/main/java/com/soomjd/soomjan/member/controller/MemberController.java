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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
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

	@GetMapping("terms")
	public String termsForm() {
		
		return "join/userAgreement";
	}

	@GetMapping("regist")
	public String registForm() {

		return "join/join";
	}

	@PostMapping("regist")
	public String registMember(@ModelAttribute MemberDTO member, @RequestParam("proof") String proof, HttpServletRequest request)
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
	public void login(HttpServletResponse response, @RequestParam("email") String email, @RequestParam("password") String password, Model model) throws IOException {
		
		response.setContentType("application/text; charset=UTF8");
		
		System.out.println("로그인할 이메일 : " + email);
	    System.out.println("로그인할 패스워드 : " + password);
	    
	    Map<String, String> map = new HashMap<>();
	    map.put("email", email);
	    map.put("password", password);
	    
	    if(!memberService.selectEmail(map)) {
	    	response.getWriter().write("emailFalse");
	    } else if (!passwordEncoder.matches(password, memberService.selectEncPassword(map))) {
	    	response.getWriter().write("pwdFalse");
	    } else {
	    	
	    	MemberDTO loginMember = memberService.loginMember(map);
	    	model.addAttribute("loginMember", loginMember);
	    	
	    	if(loginMember.getIsJandi() == 'Y') {
	    		model.addAttribute("isjandi", "Y");
	    	}else {
	    		model.addAttribute("isjandi", "N");
	    	}
	    	
	    	if(loginMember.getIsBlack() == 'Y') {
	    		double blackD_day = memberService.selectBlackDDay(loginMember.getEmail());
	    		if(blackD_day > 0) {
	    			System.out.println((int)blackD_day + "일 남음");
	    			response.getWriter().write("누적 경고로 인해 블랙리스트 조치되었습니다. 로그인 가능까지 " + (int)blackD_day + "일 남았습니다." );
	    		}else {
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
	
	@GetMapping("findEmail")
	public String findEmailForm() {
		
		return "join/findEmail";
	}
	
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
	
	
	@GetMapping("findPwd")
	public String findPwdForm() {
		
		return "join/findPwd1";
	}
	
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
	
	@PostMapping("findPwd2")
	public ModelAndView findPwd2(@RequestParam("email") String email, ModelAndView mv) {
		
		System.out.println("넘어온 이메일 : " + email);
		
		mv.addObject("email", email);
		mv.setViewName("join/findPwd2");
		
		return mv;
	}
	
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
	
	
	@PostMapping("findPwd3")
	public ModelAndView findPwd3(@RequestParam("email") String email, ModelAndView mv) {
		
		System.out.println("넘어온 이메일 : " + email);
		
		mv.addObject("email", email);
		mv.setViewName("join/findPwd3");
		
		return mv;
	}
	
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
	
	
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	@PostMapping("jandiNickDupCheck")
	public @ResponseBody String jandiNickDupCheck(@RequestParam String nickName) {
		
		String result = "false";
		if(memberService.selectJandiNickDupCheck(nickName) > 0) {
			result = "true";
		}
		
		return result; 
	}
	
}
