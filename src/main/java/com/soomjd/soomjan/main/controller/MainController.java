package com.soomjd.soomjan.main.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.service.ClassRoomService;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.faq.model.service.FaqService;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.main.model.service.MainService;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/*")
public class MainController {

	private final FaqService faqService;
	private final MainService mainService;
	private final ClassRoomService classRoomService;
	
	@Autowired
	public MainController(FaqService faqService, MainService mainService, ClassRoomService classRoomService) {
		this.faqService = faqService;
		this.mainService = mainService;
		this.classRoomService = classRoomService;
	}
	
	@RequestMapping(value= {"/", "main"})
	public String main(Model model) {
		
		// 메인 카로셀 광고
		List <ClassDTO> adClass = mainService.adClass();
		
		// 메인 카테고리
		List <CategoryDTO> category = mainService.category();
		Collections.shuffle(category);
		
		// 랜덤 클래스 조회
		List <ClassDTO> class2 = faqService.mainClass();
		Collections.shuffle(class2);
		
		// 랜덤 잔디 조회
		List <JandiDTO> jandi = mainService.mainJandi();
		Collections.shuffle(jandi);

		//뷰가 가장 많은 강의
		List <ClassDTO> viewClass = mainService.viewClass();
		
		// 가장 최근에 나온 강의
		List <ClassDTO> latestClass= mainService.latestClass();
		
		// 곧 마감될 강의
		List <ClassDTO> almostfinish = mainService.almostfinish();
		
		// 평점이 높은 강의
		List<ClassDTO> highScore = mainService.highScore();
		
		// 가장 최근 공지
		FaqDTO lastestFaq = mainService.lastestFaq();
		
		model.addAttribute("class2", class2);	
		model.addAttribute("jandi", jandi);	
		model.addAttribute("viewClass", viewClass);	
		model.addAttribute("latestClass", latestClass);	
		model.addAttribute("almostfinish", almostfinish);	
		model.addAttribute("highScore", highScore);	
		model.addAttribute("lastestFaq", lastestFaq);	
		model.addAttribute("adClass", adClass);	
		model.addAttribute("category", category);	
		
		System.out.print(adClass);
		
		return "main/main";
	}
	
	@GetMapping("viewsUp")
	public String viewsUp(Model model, @RequestParam String classCode, HttpSession session) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		System.out.println("받아온 클래스 코드 : " + classCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("classCode", classCode);
		
		if(member != null) {
			System.out.println("현재 로그인 상태인 이메일 : " + member.getEmail());
			map.put("email", member.getEmail());
		}
		
		boolean viewsUp = classRoomService.viewsUp(map);
		
		if(viewsUp) {
			System.out.println(classCode + "번 클래스의 조회수가 업데이트 되었습니다.");
			return "redirect:/findclass/class/classRoom?classCode=" + classCode;
		} else {
			System.out.println(classCode + "번 클래스를 운영하는 잔디의 계정으로는 조회수가 올라가지 않습니다.");
			return "redirect:/findclass/class/classRoom?classCode=" + classCode;
		}
		
	}
}
