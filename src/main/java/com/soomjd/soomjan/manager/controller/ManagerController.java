package com.soomjd.soomjan.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.service.ManagerService;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/manager/*")
@SessionAttributes({"loginManager", "ssackList", "jandiList", "managerList"})
public class ManagerController {
	
	private final ManagerService managerService;
	private final BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public ManagerController(ManagerService managerService, BCryptPasswordEncoder passwordEncoder) {
		this.managerService = managerService;
		this.passwordEncoder = passwordEncoder;
	}
	

	
	// 매니저 로그인 페이지 이동
	@GetMapping("login")
	public String loginFrom() {
		
		return "manager/login";
	}
	
	// 매니저 로그인 실행
	@PostMapping("login")
	public String login(@ModelAttribute ManagerDTO manager, Model model, HttpServletRequest request) throws LoginFailedException {
		
		System.out.println("ID: " + request.getParameter("mngId"));
		System.out.println("PWD: " + request.getParameter("password"));

		
		model.addAttribute("loginManager", managerService.loginManager(manager));
		
		return "redirect:/";
		
	}
	
	// 매니저 로그아웃 실행
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 매니저 메인 페이지로 이동
	@GetMapping("/managermain")
	public String managerMain(ManagerDTO manager, Model model) {
		
		List<ManagerDTO> managerList = managerService.allManager(manager);
		System.out.println(managerList);
		model.addAttribute("managerList", managerList);
		
		return "manager/managermain";
	}
	
	// 새싹멤버 조회
	@GetMapping("/mentilist")
	   public String mentilist(Model model, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,@RequestParam(defaultValue = "1") int currentPage) {
	      
	      System.out.println("===== ssackList =====");
	      
	      Map<String, String> searchMap = new HashMap<>();
	      searchMap.put("searchCondition", searchCondition);
	      searchMap.put("searchValue", searchValue);
	      System.out.println("searchMap : " + searchMap);
	      
	      int totalCount = managerService.selectTotalCount(searchMap);
	      System.out.println("totalCount : " + totalCount);
	      
	      int limit = 10;
	      int buttonAmount = 5;
	      
	      SelectCriteria selectCriteria = null;
	      
	      if(searchCondition != null && !"".equals(searchCondition)) {
	         selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue);
	      } else {
	         selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
	      }
	      
	      System.out.println("selectCriteria : " + selectCriteria);
	      
	      
	        List<MemberDTO> ssackList = managerService.ssackMember(selectCriteria);
	        System.out.println("ssackList : " + ssackList);
	        
	        model.addAttribute("ssackList", ssackList);
	        model.addAttribute("selectCriteria", selectCriteria);
	       
	      
	/*      List<MemberDTO> ssackList = managerService.ssackMember(ssack);
	      System.out.println(ssackList);
	      model.addAttribute("ssackList", ssackList);*/
	      
	      return "manager/mentilist";
	   }
	
	// 잔디멤버 조회
	@GetMapping("/mentolist")
	public String mentolist(JandiDTO jandi, Model model) {
		
		List<JandiDTO> jandiList = managerService.jandiMember(jandi);
		System.out.println(jandiList);
		model.addAttribute("jandiList", jandiList);
		
		
		return "manager/mentolist";
	}
	
	// 관리자 조회
	@GetMapping("/manproduce")
	public String manproduce(ManagerDTO manager, Model model) {
		
		List<ManagerDTO> managerList = managerService.managerMember(manager);
		System.out.println(managerList);
		model.addAttribute("managerList", managerList);
		
		return "manager/manproduce";
	}
	
	@GetMapping("/reportedmentee")
	public String reportedmentee() {
		
		return "manager/reportedmentee";
	}
	
	@GetMapping("/reportedboard")
	public String reportedboard() {
		
		return "manager/reportedboard";
	}
	
	
	@GetMapping("/reportedmentor")
	public String reportedmentor(ManagerDTO manager, Model model) {
		
		List<ManagerDTO> managerList = managerService.allManager(manager);
		System.out.println(managerList);
		model.addAttribute("managerList", managerList);
		
		return "manager/reportedmentor";
	}
	
	// 클래스 카테고리 조회
	@GetMapping("/modifycategory")
	public String modifycategory(Model model, CategoryDTO category) {
		
		List<CategoryDTO> categoryList = managerService.selectCategory(category);
		System.out.println(categoryList);
		System.out.println(categoryList.size());
		System.out.println(categoryList.get(0));
		System.out.println(categoryList.get(0).getCategoryCode());
		System.out.println(categoryList.get(1));
		System.out.println(categoryList.get(1).getCategoryCode());
//		System.out.println(categoryList.get(categoryList.size()).getCategoryCode() + 1);

		
		model.addAttribute("categoryList",categoryList);
		
		
		return "manager/modifycategory";
	}
	
	// 클래스 카테고리 추가
	@PostMapping("/modifycategory")
	public String modifycategory(@ModelAttribute CategoryDTO category, Model model) throws MemberRegistException {
		
		List<CategoryDTO> categoryList = managerService.selectCategory(category);
		
		System.out.println(category.getCategoryName());
		System.out.println(category);
		System.out.println(categoryList.size());
		
		category.setCategoryCode(categoryList.size() + 1);
//		category.setCategoryCode(categoryList.get(categoryList.size()).getCategoryCode()-1);
		
//		System.out.println(categoryList.get(categoryList.size()).getCategoryCode() + 1);
		
		
		/* 성공 실패의 처리 */
		if (!managerService.modifycategory(category)) {

			throw new MemberRegistException("회원가입에 실패하셨습니다.");
		} else {
			
			model.addAttribute("categoryList",categoryList);


			return "redirect:/manager/modifycategory";
		}
	}
	
	
	// 클래스 광고 요청
	@GetMapping("/applyclassadvertisment")
	public String applyclassadvertisment() {
			
		return "manager/applyclassadvertisment";
	}
	
	// 현재 광고 중
	@GetMapping("/classadvertisment")
	public String classadvertisment() {
				
		return "manager/classadvertisment";
	}
	
	// 클래스 결제 내역
	@GetMapping("/classcal")
	public String classcal() {
					
		return "manager/classcal";
	}
	
	// 현재 광고 중
	@GetMapping("/advertcal")
	public String advertcal() {
				
		return "manager/advertcal";
	}
}
