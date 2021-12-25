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
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;

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
			@RequestParam(defaultValue = "1") int currentPage, @RequestParam(required = false) String categoryCode) {

		System.out.println("파인드 클래스 메인입니다 ㅋㅋ");
		System.out.println("보여줄 클래스 카테고리 : " + categoryCode);
	    System.out.println("검색할 검색값 : " + searchValue);
	    System.out.println("정렬 조건 : " + searchCondition);

		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);

		if(categoryCode != null && categoryCode != "") { 
			searchMap.put("categoryCode", categoryCode);
		}

		System.out.println("searchMap : " + searchMap);

		/* 전체 클래스 갯수 조회 */
		int totalCount = findClassService.selectFindClassTotalCount(searchMap);
		System.out.println("totlaCount : " + totalCount);

		int limit = 9;
		int buttonAmount = 5;

		SelectCriteria selectCriteria = null;

		if (searchCondition != null && !"".equals(searchCondition) || searchValue != null && !"".equals(searchValue)) {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition,
					searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		}

		System.out.println("selectCriteria : " + selectCriteria);

		searchMap.put("selectCriteria", selectCriteria);

		/* 조건에 맞춰 클래스 리스트 조회 */
		List<FindClassDTO> findClassList = findClassService.selectfindclass(searchMap);
		System.out.println(findClassList);

		/* 사이드바에 뜨워줄 카테고리 조회 */
		List<CategoryDTO> categoryList = findClassService.selectCategory();
		System.out.println(categoryList);

		/* 코드가 복잡해지지만 조회 화면에 카테고리 이름을 띄워주고 싶어요 */
		String categoryName = "";

		if(categoryCode != null && categoryCode != "") {

			int code = Integer.parseInt(categoryCode);

			for(CategoryDTO category : categoryList) {

				if(category.getCategoryCode() == code) {

					categoryName = category.getCategoryName();
				}
			}
		}

		mv.addObject("categoryName", categoryName);
		mv.addObject("categoryCode", categoryCode);
		mv.addObject("categoryList", categoryList);
		mv.addObject("findClassList", findClassList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.setViewName("findclass/findAllClassMain");

		return mv;

	}

	@GetMapping("/findTopClassMain")
	public ModelAndView findTopClassMain(ModelAndView mv, @RequestParam(required = false) String categoryCode) {
		
		System.out.println("인기 클래스 메인입니다 ㅋㅋ");
		System.out.println("보여줄 클래스 카테고리 : " + categoryCode);
		
		Map<String, Object> map = new HashMap<>();
		
	    if(categoryCode != null && categoryCode != "") {
	    	map.put("categoryCode", categoryCode);
	    }
	    
	    /* 조건에 맞춰 클래스 리스트 조회 */
	    List<FindClassDTO> topClassList = findClassService.selectTopClass(map);
	    System.out.println(topClassList);
	    
	    /* 사이드바에 뜨워줄 카테고리 조회 */
		List<CategoryDTO> categoryList = findClassService.selectCategory();
		System.out.println(categoryList);

		/* 코드가 복잡해지지만 조회 화면에 카테고리 이름을 띄워주고 싶어요 */
		String categoryName = "";

		if(categoryCode != null && categoryCode != "") {

			int code = Integer.parseInt(categoryCode);

			for(CategoryDTO category : categoryList) {

				if(category.getCategoryCode() == code) {

					categoryName = category.getCategoryName();
				}
			}
		}
		
		mv.addObject("categoryCode", categoryCode);
		mv.addObject("categoryName", categoryName);
		mv.addObject("categoryList", categoryList);
		mv.addObject("topClassList", topClassList);
		mv.setViewName("findclass/findTopClassMain");
		
		return mv;
		
	}

}
