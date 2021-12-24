package com.soomjd.soomjan.findJandi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.findJandi.model.service.FindJandiService;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/findJandi/*")
public class FindJandiController {
	/*
	 * controller의 역할
	 * 1. JSP페이지에서 전달한 값의 정제
	 * 2. 서비스를 요청
	 * 3. 값의 결과에 따라서 보여줄 페이지를 정의
	 * */
	
	// controller에서 Service를 요청하려면 
	// controller에서는 service에 대한 정보를 가지고 있어야한다.
	// has-a 관계이다.
	
	// findJandiService를 요청하기 위한 변수
	private final FindJandiService findJandiService;
	
	// 매개변수
	// 매개변수 있는 생성자를 이용해서 의존성 주입
	@Autowired
	public FindJandiController(FindJandiService findJandiService) {
		this.findJandiService = findJandiService;
	}
	
	// 멘토보기를 클릭했을 때 호출되는 메소드
	@GetMapping("/findAllJandiMain")
	public void findAllJandiMain(Model model) {
		
		// 잔디 목록 조회하기
		List<JandiDTO> jandiList = findJandiService.selectfindJandi();
		System.out.println("jandiList : " + jandiList);
		
		model.addAttribute("jandiList", jandiList);
	}
	
	@GetMapping("/findTopJandiMain")
	public void findTopJandiMain(Model model) {
		
		List<JandiDTO> jandiTopList = findJandiService.selectTopFindJandiList();
		
 		
	}
	
	@GetMapping("/jandiProfile/{email:.+}")
	public ModelAndView jandiProfile(@PathVariable String email){
		
		ModelAndView mv = new ModelAndView();
 		System.out.println(email);
		
		mv.addObject("jandiInfo", findJandiService.selectJandiInfo(email));
		mv.addObject("thumbNailClassList", findJandiService.selectThumbnailClassList(email));
		
		mv.setViewName("/findJandi/jandiProfile");
		return mv;
	}

	
	@GetMapping("/detailJandi")
	public void detailJandi() {}
	
	@GetMapping("/readmentor")
	public void readmentor() {}
	
	@GetMapping("/jandiProfile")
	public void jandiProfile() {}
}
