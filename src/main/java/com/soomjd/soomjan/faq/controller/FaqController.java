package com.soomjd.soomjan.faq.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.faq.model.service.FaqService;

@Controller
@RequestMapping("/faq/*")
@SessionAttributes("loginMember")
public class FaqController {

	private final FaqService faqService;

	@Autowired
	public FaqController(FaqService faqService) {
		this.faqService = faqService;
	}
	
	
	@GetMapping(value= {"/", "faq"})
	public String faq() {
		return "faq/FAQ";
	}
	
	@GetMapping(value= {"/", "policy"})
	public String policy() {
		return "faq/policy";
	}

	//사용자 공지사항 조회
	@GetMapping("/notice")
	public String notice(Model model, FaqDTO faq, @RequestParam(defaultValue = "1") int currentPage) {
	      
      int totalCount = faqService.selectFaqTotalCount();
      
      int limit = 8;
      int buttonAmount = 5;
      
      SelectCriteria selectCriteria = null;
	
	  selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		
	  List<FaqDTO> faqList = faqService.selectnotice(selectCriteria);
	
	  model.addAttribute("faqList",faqList);
	  model.addAttribute("selectCriteria", selectCriteria);
		
	  return "faq/notice";
	}
	
}
