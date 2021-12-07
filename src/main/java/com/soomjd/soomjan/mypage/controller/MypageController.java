package com.soomjd.soomjan.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
@SessionAttributes("loginMember")
public class MypageController {
	
	private final MypageService mypageService;
	
	@Autowired
	public MypageController(MypageService mypageService) {
		this.mypageService = mypageService;
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
	public ModelAndView modifyPwd(ModelAndView mv) {
		
		mv.setViewName("mypage/modifypwd");
		
		return mv;
		
	}
	

}
