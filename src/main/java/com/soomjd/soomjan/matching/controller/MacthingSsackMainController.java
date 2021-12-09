package com.soomjd.soomjan.matching.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.common.exception.RegistFailedException;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
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
	public String ManteeMain() {
		
		
		return "matching/matchingManteeMain";
	}
	
	@GetMapping("/manteeMain/{memberEmail:.+}")
	public String ManteeMain(Model model, @PathVariable("memberEmail") String memberEmail){
		
		System.out.println(memberEmail);
		
		Map<String, Object> map = new HashMap<>();
		map.put("email", memberEmail);
		
		List<EstimateDTO> estimateList = matchingService.selectEstimate(map);
		model.addAttribute("estimateList",estimateList);
		return "matching/matchingManteeMain";
	}

	
	@GetMapping("/manteeWrite")
	public String manteeWrite(CategoryDTO category, Model model){
		
		
		List<CategoryDTO> categoryList = matchingService.selectCategory(category);
		System.out.println(categoryList);
		model.addAttribute("categoryList",categoryList);
		
		return "matching/ManteeEstimateWrite";
		
	}
	
	
	
	@PostMapping("/estimateSend")
	public ModelAndView estimateSend(@ModelAttribute EstimateDTO estimate,
			ModelAndView mv) throws RegistFailedException{
		
		System.out.println(estimate);
		boolean result = matchingService.registEstimate(estimate);
		
		if(result) {
			mv.setViewName("redirect:/matching/manteeMain");
		} else {
			
			throw new RegistFailedException("견적서 등록에 실패하였습니다.");
		}
		
		return mv;
	}
	

	@GetMapping("/detailEstimate")
	public String detailEstimate() {
		
		return "matching/ManteeEstimateDetail";
	}
	

	
}
