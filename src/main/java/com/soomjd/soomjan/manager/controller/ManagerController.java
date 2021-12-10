package com.soomjd.soomjan.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.service.ManagerService;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/manager/*")
@SessionAttributes({"loginManager", "ssackList", "jandiList", "managerList", "selectCriteria"})
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
	@GetMapping("mentilist")
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
	        
	        System.out.println("selectCriteria : " + selectCriteria);
	       
	      
	/*      List<MemberDTO> ssackList = managerService.ssackMember(ssack);
	      System.out.println(ssackList);
	      model.addAttribute("ssackList", ssackList);*/
	      
	      return "manager/mentilist";
	   }
	
	// 잔디멤버 조회
	@GetMapping("/mentolist")
	public String mentolist(Model model, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,@RequestParam(defaultValue = "1") int currentPage) {
		
		System.out.println("===== jandiList =====");
	      
	      Map<String, String> searchMap = new HashMap<>();
	      searchMap.put("searchCondition", searchCondition);
	      searchMap.put("searchValue", searchValue);
	      System.out.println("searchMap : " + searchMap);
	      
	      int totalCount = managerService.selectTotalCount2(searchMap);
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
		      
		      
		        List<JandiDTO> jandiList = managerService.jandiMember(selectCriteria);
		        System.out.println("jandiList : " + jandiList);
		        
		        model.addAttribute("jandiList", jandiList);
		        model.addAttribute("selectCriteria", selectCriteria);
		        
		        System.out.println("selectCriteria : " + selectCriteria);
		
		
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
	
	/* 관리자 계정 생성 */
	@PostMapping("msregist")
	public String msRegistMember(@ModelAttribute ManagerDTO manager, HttpServletRequest request) throws MemberRegistException {
		
		System.out.println("manager : " + manager);
		
		manager.setPassword(passwordEncoder.encode(manager.getPassword()));
		
		if(!managerService.msregistMember(manager)) {
			
			throw new MemberRegistException("관리자 계정 생성에 실패하셨습니다.");
		} else {
			
			return "redirect:/manager/manproduce";
		}
	}
	
	/* 관리자 계정 비활성화 */
	@PostMapping("inactiveManager")
	public void inactiveManager(@ModelAttribute ManagerDTO manager, HttpServletRequest request, @RequestParam("checkbox[]") ArrayList<Integer> checkbox ) throws MemberRegistException {
		
		System.out.println("manager : " + manager);
		System.out.println("checkbox : " + checkbox);
		

		int result = managerService.inactiveManager(checkbox);
		System.out.println("result : " + result);
			
	}
	
	
	/* 이메일 중복 체크 */
	@PostMapping("/emailCheck")
	public void emailCheck(HttpServletResponse response, @RequestParam("email") String email) throws IOException {
		
		System.out.println("email : " + email);
		
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		
		boolean isDup = managerService.emailCheck(map);
		System.out.println("isDup : " + isDup);
		
		if(isDup) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	/* 닉네임 중복 체크 */
	@PostMapping("/nickNameCheck")
	public void nickNameCheck(HttpServletResponse response, @RequestParam("nickName") String nickName) throws IOException {
		
		System.out.println("nickName : " + nickName );
		
		Map<String, String> map = new HashMap<>();
		map.put("nickName", nickName);
		
		boolean isDup = managerService.nickNameCheck(map);
		System.out.println("isDup : " + isDup);
		
		if(isDup) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
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
		
		model.addAttribute("categoryList",categoryList);
		
		
		return "manager/modifycategory";
	}
	
	// 클래스 카테고리 추가
	@PostMapping("/modifycategory")
	public String modifycategory(@ModelAttribute CategoryDTO category, Model model) throws MemberRegistException {
		
		List<CategoryDTO> categoryList = managerService.selectCategory(category);
		
		System.out.println(category.getCategoryName());
		
		category.setCategoryCode(categoryList.size() + 1);
		
		/* 성공 실패의 처리 */
		if (!managerService.modifycategory(category)) {

			throw new MemberRegistException("회원가입에 실패하셨습니다.");
		} else {
			
			model.addAttribute("categoryList",categoryList);


			return "redirect:/manager/modifycategory";
		}
	}
	
	// 카테고리 번호로 카테고리 이름 가져오기
	@PostMapping(value="checkCategoryCode", produces ="application/text; charset=utf8")
	public void checkCategoryCode(HttpServletResponse response, @RequestParam("categoryCode") int categoryCode) throws IOException {
		
		CategoryDTO category = new CategoryDTO();
		category.setCategoryCode(categoryCode);
		
		CategoryDTO checkcategory = new CategoryDTO();
		checkcategory = managerService.checkCategory(category);
		
		if(checkcategory != null){
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(checkcategory.getCategoryName());
		} else {
			response.getWriter().write("false");
		}
	}
	
	// 카테고리 이름 변경
	@PostMapping("changeCategory")
	public String changeCategoryName(@ModelAttribute CategoryDTO category, Model model) {
		
		boolean changeCategory = managerService.changeCategoryName(category);
		
		System.out.print(changeCategory);
		
		List<CategoryDTO> categoryList = managerService.selectCategory(category);

		model.addAttribute("categoryList",categoryList);

		return "redirect:/manager/modifycategory";
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
	// ================================ 공지 사항 =================================================
	
	// 공지사항 조회
	@GetMapping("notice")
	public String notice(Model model, FaqDTO faq, @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String, String> searchMap = new HashMap<>();
	      searchMap.put("searchCondition", searchCondition);
	      searchMap.put("searchValue", searchValue);
	      System.out.println("searchMap : " + searchMap);
	      
	      int totalCount = managerService.selectFaqTotalCount(searchMap);
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
 
	      
		List<FaqDTO> faqList = managerService.selectnotice(selectCriteria);
		
		model.addAttribute("faqList",faqList);
		model.addAttribute("selectCriteria", selectCriteria);
		
		return "manager/notice";
	}
	
	// 공지사항 작성
	@GetMapping("addnotice")
	public String addnotice() {
			
		return "manager/addnotice";
	}
		
	// 공지사항 받아서 데이터 베이스 삽입
	@PostMapping("addnotice")
	public String addnotice(@ModelAttribute FaqDTO faq, Model model) throws MemberRegistException {
		
		
		if (!managerService.addnotice(faq)) {

			throw new MemberRegistException("등록에 실패하였습니다.");
		} else {
			
//			model.addAttribute("categoryList",categoryList);


			return "redirect:/manager/notice";
		}
	}
	
	// 관리자 측면 공지사항 세부내용 조회
	@GetMapping("/noticeDetail/{postCode}")
	public String noticeDetail(Model model, @PathVariable("postCode") int postCode) {
		

		FaqDTO noticeDetail = new FaqDTO();
		noticeDetail.setPostCode(postCode);
		
		FaqDTO faq = managerService.noticeDetail(noticeDetail);
		
		model.addAttribute("faq", faq);
		
		return "manager/noticeDetail";
	}
	
	// 관리자가 공지사항 내용 수정
	@PostMapping("/modifyContents")
	public String modifyContents(@ModelAttribute FaqDTO faq, Model model) throws MemberRegistException {
		
		if(managerService.modifyContents(faq)) {
		
			FaqDTO noticeDetail = managerService.noticeDetail(faq);
			
			model.addAttribute("noticeDetail", noticeDetail);
			
			return "redirect:/manager/notice";
		} else {
			throw new MemberRegistException("수정에 실패하였습니다.");
		}
	}
	
}
