package com.soomjd.soomjan.findJandi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;

import com.soomjd.soomjan.findJandi.model.service.FindJandiService;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

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
	private FindJandiService findJandiService = null;
	
	// 매개변수
	// 매개변수 있는 생성자를 이용해서 의존성 주입
	@Autowired
	public FindJandiController(FindJandiService findJandiService) {
		this.findJandiService = findJandiService;
	}
	
	// 멘토보기를 클릭했을 때 호출되는 메소드
	@GetMapping("/findAllJandiMain")
	public void findAllJandiMain(Model model,@RequestParam(defaultValue = "1") int currentPage
			, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue) {
		
		// 검색값을 저장할 map 객체 선언
		Map<String, Object> searchMap = new HashMap<>();
		// 파라미터로 가져온 searchValue를 map에 저장
		searchMap.put("searchValue", searchValue);
		searchMap.put("searchCondition",searchCondition);
		// 한페이지당 뜨는 프로필 제한 갯수를 정하고, 페이징 버튼 갯수 정하기
		int limit = 9;
		int buttonAmount = 5;
		
		// 전체 잔디 수 조회
		int totalCount = findJandiService.SelectFindJandiTotalCount(searchMap);
		System.out.println("searchMap : " + searchMap);
		
		// 검색에대한 정보를 담은 객체에 null 값으로 초기화
		SelectCriteria selectCriteria = null;
		selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition,
				searchValue);
		
		System.out.println("selectCriteria : " + selectCriteria);
		// 파라미터로 가져온 selectCriteria를 map에 저장
		searchMap.put("selectCriteria", selectCriteria);
		// selectCriteria값을 db에서 리스트형태로 가지고 오겠다
		List<JandiDTO> jandiList = findJandiService.selectfindJandi(selectCriteria);
		
		System.out.println("jandiList : " + jandiList);
		// 속성값에 HashMap형태로(key,value) jandiList와 selectCriteria를 넣어준다
		model.addAttribute("jandiList", jandiList);
		model.addAttribute("selectCriteria",selectCriteria);
	}
	

	
	/**
	 * 인기잔디를 불러오는 메소드
	 * @param model
	 * 
	 * @author 오수빈
	 */
	@GetMapping("/findTopJandiMain")
	public void findTopJandiMain(Model model) {
		// 인기잔디리스트 조회
		List<JandiDTO> jandiTopList = findJandiService.selectTopFindJandiList();
		
		System.out.println("jandiTopList : " + jandiTopList);
		
		model.addAttribute("jandiTopList", jandiTopList);
 		
	}
	
	/**
	 * 잔디프로필 요청
	 * @param email
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("/jandiProfile/{email:.+}")
	public ModelAndView jandiProfile(@PathVariable String email){
		
		ModelAndView mv = new ModelAndView();
 		System.out.println(email);
		
 		// 잔디 상세내용 조회
		mv.addObject("jandiInfo", findJandiService.selectJandiInfo(email));
		// 해당 잔디의 클래스 조회
		mv.addObject("thumbNailClassList", findJandiService.selectThumbnailClassList(email));
		// 잔디 프로파일 조회
		mv.setViewName("/findJandi/jandiProfile");
		return mv;
	}

}
