package com.soomjd.soomjan.matching.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.matching.model.dto.EstimateDTO;
import com.soomjd.soomjan.matching.model.service.MatchingService;

@Controller
@RequestMapping("/matching/*")
@SessionAttributes("loginMember")
public class MacthingSsackMainController {
	
	private MatchingService matchingService;

	@Autowired
	public MacthingSsackMainController(MatchingService matchingService) {
		this.matchingService = matchingService;
	}

	@GetMapping("/manteeMain")
	public String ManteeMain(){
		return "matching/matchingManteeMain";
	}

	
	@GetMapping("/manteeWrite")
	public String manteeWrite(){
		return "matching/ManteeEstimateWrite";
	}
	
	@PostMapping("/estimateSend")
	public String estimateSend(@ModelAttribute EstimateDTO estimate,
			HttpServletRequest request){
		
		
		
		return "redirect:/";
	}
	
	

	
}
