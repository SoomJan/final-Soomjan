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
	public void login(HttpServletResponse response, @RequestParam("email") String email, @RequestParam("password") String password, Model model) throws IOException {
		
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
	    	
	    	response.getWriter().write("true");
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
	
	@GetMapping("joinJandi")
	public String joinJandi() {
		
		return "jandi/join/joinJandi";
	}
	
	@PostMapping("registJandi")
	public String registJandi(@ModelAttribute JandiDTO jandi, Model model, RedirectAttributes rttr)
			throws MemberRegistException {
		
		MemberDTO member = (MemberDTO)model.getAttribute("loginMember");
		String email = member.getEmail();
		jandi.setEmail(email);

		System.out.println(jandi);
		
		if(memberService.registJandi(jandi) && memberService.modifyIsJandi(jandi.getEmail())) {
			member.setIsJandi('Y');
			
			model.addAttribute("isjandi", "Y");
			model.addAttribute("loginMember", member);
			
			rttr.addFlashAttribute("jandiRegistMessage", "잔디 가입을 축하합니다.");
		}else {
			rttr.addFlashAttribute("jandiRegistMessage", "잔디 가입에 실패했습니다. ");
		}

		return "redirect:/";
	}

	
}
