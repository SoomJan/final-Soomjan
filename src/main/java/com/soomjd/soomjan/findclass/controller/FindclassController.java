package com.soomjd.soomjan.findclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
import com.soomjd.soomjan.findclass.service.FindclassService;

@Controller
@RequestMapping("/findclass/*")
public class FindclassController {

	private FindclassService findClassService;
	
	@Autowired
	public FindclassController(FindclassService findClassService) {
		this.findClassService = findClassService;
	}
	
	// GETMapping-> 주소를 통해서 페이지를 이동시키기
	// POSTMapping 

	@GetMapping("/findAllClassMain")
	public ModelAndView findAllClassMain(ModelAndView mv, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		System.out.println("파인드 클래스 메인입니다 ㅋㅋ");
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		System.out.println("searchMap : " + searchMap);
		
		int totalCount = findClassService.selectFindClassTotalCount(searchMap);
		System.out.println("totlaCount : " + totalCount);
		
		int limit = 5;
		int buttonAmount = 5;
		
		SelectCriteria selectCriteria = null;

		if (searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition,
					searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		}

		System.out.println("selectCriteria : " + selectCriteria);

		searchMap.put("selectCriteria", selectCriteria);
		
		List<FindClassDTO> findClassList = findClassService.selectfindclass(searchMap);
		System.out.println(findClassList);
		
		mv.addObject("findClassList", findClassList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.setViewName("findclass/findAllClassMain");

		return mv;
		
	}
	
	@GetMapping("/findTopClassMain")
	public void findTopClassMain() {}
	
	@GetMapping("/detailclass")
	public void detailclass() {}
	
	@GetMapping("/detailclassvideo")
	public void detailclassvideo() {}
	
	/*
	 * @GetMapping("/class/classRoomNav") public void classRoomNav() {}
	 * 
	 * @GetMapping("/class/classRoom") public void classRoom() {}
	 * 
	 * @GetMapping("/class/classLecture") public void classLecture() {}
	 */
}
