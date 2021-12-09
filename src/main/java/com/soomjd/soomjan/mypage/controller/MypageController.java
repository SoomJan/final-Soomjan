package com.soomjd.soomjan.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.member.model.dao.MemberMapper;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
@SessionAttributes("loginMember")
public class MypageController {
	
	private final MypageService mypageService;
	private final BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MypageController(MypageService mypageService, BCryptPasswordEncoder passwordEncoder) {
		this.mypageService = mypageService;
		this.passwordEncoder = passwordEncoder;
	}
	
	@GetMapping("main")
	public ModelAndView mypageMain(ModelAndView mv, HttpSession session) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());
		
		MemberDTO newMember = mypageService.selectNewMember(map);
		System.out.println("업데이트된 회원 정보 : " + newMember);
		
		mv.addObject("member", newMember);
		mv.setViewName("mypage/mypagemain");
		
		return mv;
	}
	
	@GetMapping("modify")
	public ModelAndView modifyForm(ModelAndView mv, HttpSession session) {
		
		mv.setViewName("mypage/modify");
		
		return mv;
	}
	
	@PostMapping("modify")
	public void modifyInfo(HttpServletResponse response, @RequestParam("nickName") String nickName, @RequestParam("phone") String phone, HttpSession session) throws IOException {
		
		System.out.println("수정될 닉네임 : " + nickName);
		System.out.println("수정될 핸드폰번호 : " + phone);
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		Map<String, String> map = new HashMap<>();
		map.put("nickName", nickName);
		map.put("phone", phone);
		map.put("email", member.getEmail());
		
		Boolean modifyInfo = mypageService.modifyInfo(map);
		
		if(modifyInfo) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	@GetMapping("modifyPwd")
	public ModelAndView modifyPwdForm(ModelAndView mv) {
		
		mv.setViewName("mypage/modifypwd");
		
		return mv;
	}
	
	@PostMapping("modifyPwd")
	public void modifyPwd(HttpServletResponse response, @RequestParam("originPwd") String originPwd, @RequestParam("newPwd") String newPwd, HttpSession session) throws IOException {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());
		
		System.out.println("변경 될 비밀번호 : " + originPwd);
		System.out.println("변경 할 비밀번호 : " + newPwd);
		
		if(!passwordEncoder.matches(originPwd, mypageService.selectEncPassword(map))) {
			response.getWriter().write("false");
		} else {
			
			/* 비밀번호 암호화 처리 */
			String setPwd = passwordEncoder.encode(newPwd);
			map.put("setPwd", setPwd);
			
			boolean modifyPwd = mypageService.modifyPwd(map);
			
			if(modifyPwd) {
				response.getWriter().write("true");
			} else {
				response.getWriter().write("fail");
			}
		}
	}
	
	/* 효진 테스트 */
	
	// 구매내역
	@GetMapping("buy")
	public String buyForm() {
		
		return "mypage/buy";
	}
	
	// 수강완료
	@GetMapping("finish")
	public String finishForm() {
		
		return "mypage/finish";
	}
	
	// 수강중인
	@GetMapping("taking")
	public String takingForm() {
		
		return "mypage/taking";
	}
	
	// 찜한
	@GetMapping("jjim")
	public String jjimForm() {
		
		return "mypage/jjim";
	}
	
	// 수강후기
	@GetMapping("review")
	public String reviewForm() {
		
		return "mypage/review";
	}
	
	
	

}
