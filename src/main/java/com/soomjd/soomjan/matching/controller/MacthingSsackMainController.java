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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.common.exception.RegistFailedException;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
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

//	@GetMapping("/manteeMain")
//	public String ManteeMain() {
//		
//		
//		return "matching/matchingManteeMain";
//	}
	
	// '매칭'메뉴 누르면 해당 아이디의 manteeMain으로 이동(select)
	@GetMapping("/manteeMain/{memberEmail:.+}")
	public String ManteeMain(Model model, @PathVariable("memberEmail") String memberEmail, @RequestParam(defaultValue = "1") int currentPage){
		
		int totalCount = matchingService.selecetMainTotal();
		
		int limit = 10;
		int buttonAmount = 5;
		
		SelectCriteria selectCriteria = null;
		
		selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		
		Map<String, Object> map = new HashMap<>();
		map.put("email", memberEmail);
		
		System.out.println(selectCriteria);
		
		List<EstimateDTO> estimateList = matchingService.selectEstimate(selectCriteria);
		System.out.println(estimateList);
		model.addAttribute("estimateList",estimateList);
		model.addAttribute("selectCriteria",selectCriteria);
		
		return "matching/matchingManteeMain";
	}

	// 카테고리db에서 정보 찾아오기
	@GetMapping("/manteeWrite")
	public String manteeWrite(CategoryDTO category, Model model) {
		
		
		List<CategoryDTO> categoryList = matchingService.selectCategory(category);
		System.out.println(categoryList);
		model.addAttribute("categoryList",categoryList);
		
		return "matching/ManteeEstimateWrite";
		
	}
	
	
	// 견적서 작성하기 버튼 클릭 (db에 데이터 insert)
	@PostMapping("/estimateSend/{memberEmail:.+}")
	public ModelAndView estimateSend(@ModelAttribute EstimateDTO estimate,
			ModelAndView mv, @PathVariable("memberEmail") String memberEmail) throws RegistFailedException{
		
		System.out.println(estimate);
		boolean result = matchingService.registEstimate(estimate);

		System.out.println(memberEmail);
		String a = memberEmail;
		
		if(result) {
			mv.setViewName("redirect:/matching/manteeMain/" +  a);
		} else {
			
			throw new RegistFailedException("견적서 등록에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 작성된 견적서 보여주기
	@GetMapping("/detailEstimate")
	public String detailEstimate(Model model, @PathVariable("memberEmail") String memberEmail) {
		
		return "matching/ManteeEstimateDetail";
	}
	

	
}
