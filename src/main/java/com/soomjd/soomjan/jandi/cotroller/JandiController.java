package com.soomjd.soomjan.jandi.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.jandi.model.service.JandiService;

@Controller
@RequestMapping("/jandi/*")
@SessionAttributes("jandi")
public class JandiController {
	
	private final JandiService jandiService;
	
	@Autowired
	public JandiController(JandiService jandiService) {
		this.jandiService = jandiService;
	}
	
	@GetMapping("/jandiProfile")
	public String jandiProfile(Model model){
		String email = "ram@gmail.com";
		JandiDTO jandi = jandiService.selectJandi(email);
		
		model.addAttribute("jandi", jandi.getEmail());
		
		System.out.println("환영합니다. " + jandi.getEmail() + "잔디님!");
		
		return "jandi/mentorProfile";
	}
	
	@GetMapping("/jandiCalc")
	public String jandiCalc(){
		return "jandi/mentorCalc";
	}
	
	// 매핑 주소와 동일한 jsp파일이 있는 경우 해당 jsp를 띄워준다.
	@GetMapping("/createAd")
	public void createAd(){
		
	}
	
	@GetMapping("/myAd")
	public String myAd(){
		return "jandi/myAd";
	}
	
	@GetMapping("/class/chat")
	public String classChat(){
		
		return "jandi/class/classChat";
	}

}