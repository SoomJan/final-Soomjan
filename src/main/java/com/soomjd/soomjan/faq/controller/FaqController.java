package com.soomjd.soomjan.faq.controller;


import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
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
	public String notice(Model model, @RequestParam(defaultValue = "1") int currentPage) {
	      
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
	
	@GetMapping("/test")
	public String test(Model model) {
		
		List <ClassDTO> class2 = faqService.mainClass();
		
		Collections.shuffle(class2);
		
		System.out.println(class2);
		
		model.addAttribute("class2", class2);
		
		return "test/main";
	}
	
	@GetMapping("/gametest")
	public String gametest(Model model) {
		
		Random random = new Random();
		int a = 10;
		int b = 10;
		
		int arr[][] = new int[a][b];
		
		int mine = 10;
		int mineCount = 0;
		
		
		for(int i = 0; i < a; i++ ) {
			for(int j = 0; j < b; j++) {
				arr[i][j] = 0;
				}
			}
		
		for(int k = 0; k<mine; k++) {
			
			int A = random.nextInt(a);
			int B = random.nextInt(b);
			arr[A][B] = -1;
//			if(A>0 && B>0) {
//				arr[A-1][B-1] = +1;
//				arr[A-1][B] = +1;
//				arr[A-1][B+1] = +1;
//				arr[A][B-1] = +1;
//				arr[A][B] = +1;
//				arr[A][B+1] = +1;
//				arr[A+1][B-1] = +1;
//				arr[A+1][B] = +1;
//				arr[A+1][B+1] = +1;
//			}
		}
		
		model.addAttribute("arr", arr);
		
		return "test/game";
	}
	
	}
