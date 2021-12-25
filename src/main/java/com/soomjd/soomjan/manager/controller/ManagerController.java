package com.soomjd.soomjan.manager.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.Pagenationwithdate;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.dto.ReportClassDTO;
import com.soomjd.soomjan.manager.model.service.ManagerService;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

@Controller
@RequestMapping("/manager/*")
@SessionAttributes({"loginManager", "ssackList", "jandiList", "managerList", "selectCriteria", "reportMemberList", "reportClassList"})
public class ManagerController {
	
	private final ManagerService managerService;
	private final BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public ManagerController(ManagerService managerService, BCryptPasswordEncoder passwordEncoder) {
		this.managerService = managerService;
		this.passwordEncoder = passwordEncoder;
	}
	

	/**
	 * 매니저 로그인 페이지 이동
	 */
	@GetMapping("login")
	public String loginFrom() {
		
		return "manager/login";
	}
	

	/**
	 * 매니저 로그인 실행
	 */
	@PostMapping("login")
	public String login(@ModelAttribute ManagerDTO manager, Model model, HttpServletRequest request) throws LoginFailedException {
		
		System.out.println("ID: " + request.getParameter("mngId"));
		System.out.println("PWD: " + request.getParameter("password"));

		
		model.addAttribute("loginManager", managerService.loginManager(manager));
		
		return "redirect:/manager/mentilist";
		
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
	
	/**
	 *  새싹멤버 조회
	 * @author 효진
	 */
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
	
	/**
	 * 잔디멤버 조회
	 * @author 효진
	 */
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
	
	@GetMapping(value = "jandiDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String jandiDetail(@RequestParam("email") String email) {
	
		System.out.println(email);
		JandiDTO jandiMember = managerService.selectJandiMember(email);
		System.out.println("jandiMember : " + jandiMember);
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("email", jandiMember.getEmail());
		jsonObject.put("repCategory", jandiMember.getTitle());
		jsonObject.put("repContents", jandiMember.getNickName());
		jsonObject.put("imgPath", jandiMember.getEnroll_date());
		jsonObject.put("repNickName", jandiMember.getprofile_path()); 
		
		System.out.println("확인용 : \n" +jsonObject);
		
		
		return jsonObject.toJSONString();
	}
	
	/**
	 * 관리자 멤버 조회
	 * @author 효진
	 */
	@GetMapping("/manproduce")
	public String manproduce(ManagerDTO manager, Model model) {
		
		List<ManagerDTO> managerList = managerService.managerMember(manager);
		System.out.println(managerList);
		model.addAttribute("managerList", managerList);
		
		return "manager/manproduce";
	}
	
	/**
	 * 관리자 계정 생성
	 * @author 효진
	 */
	@PostMapping("msregist")
	public String msRegistMember(@ModelAttribute ManagerDTO manager) throws MemberRegistException {
		
		System.out.println("manager : " + manager);
		
		manager.setPassword(passwordEncoder.encode(manager.getPassword()));
		
		if(!managerService.msregistMember(manager)) {
			
			throw new MemberRegistException("관리자 계정 생성에 실패하셨습니다.");
		} else {
			
			return "redirect:/manager/manproduce";
		}
	}
	
	/**
	 * 관리자 계정 비활성화
	 * @author 효진
	 */
	@PostMapping("inactiveManager")
	public void inactiveManager(@ModelAttribute ManagerDTO manager, @RequestParam("checkbox[]") ArrayList<Integer> checkbox ) throws MemberRegistException {
		// 1. jsp -> 1 값을 전 달 -> "1" -> Integer.parser
		// 1. @RequestParam -> request.getParameter()
		// 1. @ModelAttribute -> 여러값을 가져다 사용수 있따.
		System.out.println("manager : " + manager);
		System.out.println("checkbox : " + checkbox);
		

		int result = managerService.inactiveManager(checkbox);
		System.out.println("result : " + result);
			
	}
	
	/**
	 * 관리자 계정 생성(이메일 중복 체크)
	 * @author 효진
	 */
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
	
	/**
	 * 관리자 계정 생성(닉네임 중복 체크)
	 * @author 효진
	 */
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
	
	/* =============================== 신고관리 =================================== */
	
	/**
	 * 신고된 회원 조회
	 * @author 효진
	 */
	@GetMapping("/reportedmentee")
	public String reportedmentee(Model model, @RequestParam(required = false) String searchCondition, 
			@RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		 Map<String, String> searchMap = new HashMap<>();
	     searchMap.put("searchCondition", searchCondition);
	     searchMap.put("searchValue", searchValue);
	     System.out.println("searchMap : " + searchMap);
	      
	     int totalCount = managerService.selectReportSsackTotalCount(searchMap);
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
      
      
	     List<ReportMemberDTO> reportMemberList = managerService.selectReportMember(selectCriteria);
	     System.out.println("reportMemberList : " + reportMemberList);
	        
	     model.addAttribute("reportMemberList", reportMemberList);
	     model.addAttribute("selectCriteria", selectCriteria);
	        
	     System.out.println("selectCriteria : " + selectCriteria); 
		
		return "manager/reportedmentee";
	}
	
	/**
	 * 신고된 클래스 조회
	 * @author 효진
	 */
	@GetMapping("/reportedboard")
	public String reportedboard(Model model, @RequestParam(required = false) String searchCondition, 
			@RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String, String> searchMap = new HashMap<>();
	     searchMap.put("searchCondition", searchCondition);
	     searchMap.put("searchValue", searchValue);
	     System.out.println("searchMap : " + searchMap);
	      
	     int totalCount = managerService.selectReportClassTotalCount(searchMap);
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
     
     
	     List<ReportClassDTO> reportClassList = managerService.selectReportClass(selectCriteria);
	     System.out.println("reportClassList : " + reportClassList);
	        
	     model.addAttribute("reportClassList", reportClassList);
	     model.addAttribute("selectCriteria", selectCriteria);
	        
	     System.out.println("selectCriteria : " + selectCriteria); 
				
		return "manager/reportedboard";
	}
	
	/**
	 * 신고된 회원 상세보기
	 * @author 효진
	 */
	@GetMapping(value = "repDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String repMemberDetail(@RequestParam("repCode") int repCode) {
		System.out.println(repCode);
		ReportMemberDTO repMember = managerService.selectRepMember(repCode);
		System.out.println("repMemberList : " + repMember);
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("repEmail", repMember.getRepEmail());
		jsonObject.put("repCategory", repMember.getReportStatementDTO().getRepType());
		jsonObject.put("repContents", repMember.getContents());
		jsonObject.put("imgPath", repMember.getImgPath());
		jsonObject.put("repNickName", repMember.getNickName());
		
		System.out.println("확인용 : \n" +jsonObject);
		
		return jsonObject.toJSONString();
	}
	
	
	/**
	 * 신고회원상세내용(신고처리)
	 * @author 효진
	 */
	@PostMapping("confirm")
	public String reportConFirmMember(@ModelAttribute ReportMemberDTO repMember) {
		
		System.out.println("repMember : " + repMember);
	
		int result = managerService.modifyConfirmMember(repMember);
		
		if(result > 0 ) {
			System.out.println("신고처리성공");
			MemberDTO member = managerService.selectRepMember(repMember);
			System.out.println("member : " + member);
			
			if(member.getIsBlack() != 'Y') {
				// 1번 바 -> 1, 2번 -> 2, 3-> 3
				if(member.getWarning() < 3) {
					
					int result2 = managerService.updateMemberWarning(member);
					
				}
				if(member.getWarning() == 2) {
					
					int result3 = managerService.updateMemberBlack(member);
				}
			}
			
		} else {
			System.out.println("신고처리실패");
		}
		
		return "redirect:/manager/reportedmentee";
	}
	
	
	
	/**
	 * 신고회원상세내용(반려처리)
	 * @author 효진
	 */
	@PostMapping("sendBack")
	public String reportSendbackMember(@ModelAttribute ReportMemberDTO repMember) {
		
		System.out.println("repMember : " + repMember);
		
		int result = managerService.modifySendbackMember(repMember);
		
		if(result > 0 ) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		return "redirect:/manager/reportedmentee";
	}
	
	/**
	 * 신고된 클래스 상세보기
	 * @author 효진
	 */
	@GetMapping(value = "repClassDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ReportClassDTO repClassDetail(@RequestParam("repCode") int repCode) {
		System.out.println(repCode);
		ReportClassDTO repClass = managerService.selectRepClass(repCode);
		System.out.println("repClass : " + repClass);
		
		return repClass;
	}
	
	/**
	 * 신고클래스 상세내용(신고처리)
	 */
	@PostMapping("classConfirm")
	public String reportConfirmClass(@ModelAttribute ReportClassDTO repClass) {
		
		System.out.println("repClass : " + repClass);
		
		int result = managerService.modifyConfirmClass(repClass);
		
		if(result > 0 ) {
			System.out.println("신고처리성공");
			Map<String, Object> claMap = managerService.selectReportClass(repClass);
			System.out.println("claMap : " + claMap);
			
			if((String)claMap.get("IS_BLACK") != "Y") {
				// 1번 바 -> 1, 2번 -> 2, 3-> 3
				if(Integer.parseInt(claMap.get("WARNING").toString()) < 3) {
					
					 int result2 = managerService.updateClassWarning(claMap);
					
				}
				if(Integer.parseInt(claMap.get("WARNING").toString()) == 2) {
					
					int result3 = managerService.updateClassBlack(claMap);
				}
			}
		} else {
			System.out.println("신고처리실패");
		}
		
		
		return "redirect:/manager/reportedboard";
	}
	
	/**
	 * 신고클래스 상세내용(반려처리)
	 */
	@PostMapping("classSendBack")
	public String reportSendBackClass(@ModelAttribute ReportClassDTO repClass) {
		
		System.out.println("repCLass : " + repClass);
		
		int result = managerService.modifySendbackClass(repClass);
		
		if(result > 0 ) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		return "redirect:/manager/reportedboard";
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
	
	// 모든 결제내역 조회
	@GetMapping("/classcal")
	public String classcal(Model model,
			@RequestParam(required = false) String searchCondition, 
			@RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate) throws ParseException {
		
		
		 Map<String, String> searchMap = new HashMap<>();
	      searchMap.put("searchCondition", searchCondition);
	      searchMap.put("searchValue", searchValue);
	      searchMap.put("startDate", startDate);
	      searchMap.put("endDate", endDate);
	      
	    int totalCount = managerService.PurchaseClassTotalCount(searchMap);
	    
	    System.out.println("totalCount : " + totalCount);
	      
	    int limit = 10;
	    int buttonAmount = 5;
	      
	    SelectCriteriawithdate selectCriteriawithdate = null;
		
	    if((startDate != null && !"".equals(startDate)) && (searchCondition != null && !"".equals(searchCondition))) {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue, startDate, endDate);
	    } else if(startDate != null && !"".equals(startDate)) {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, null, null, startDate, endDate);
	    } else if(searchCondition != null && !"".equals(searchCondition)) {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue, null, null);
	    } else {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		  }
	    
	    System.out.println("selectCriteria : " + selectCriteriawithdate);
	    
		List<PurchaseClassDTO> reviewContent = managerService.selectPurchaseClass(selectCriteriawithdate);
		
		// 전체 List 조회용 
		List<PurchaseClassDTO> allContent = managerService.allContent();
		
		List<PurchaseClassDTO> yContent = new ArrayList<>();
		List<PurchaseClassDTO> nContent = new ArrayList<>();
		
		for(int i = 0; i < allContent.size(); i++) {

			String status1 = Integer.toString(allContent.get(i).getStatus());
			
			if(status1.equals("89")) {
				yContent.add(allContent.get(i));
			} else {
				nContent.add(allContent.get(i));
			}
		}
		
		System.out.println("yContent : " + yContent);
		System.out.println("nContent : " + nContent);
		
		System.out.println("reviewContent : " + reviewContent);
		
		model.addAttribute("allContent", allContent);  // 모든 조회
		model.addAttribute("yContent", yContent);  // 된 정산 조회
		model.addAttribute("nContent", nContent);  // 안된 정산 조회
		
		model.addAttribute("reviewContent", reviewContent);
		model.addAttribute("selectCriteria", selectCriteriawithdate);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "manager/classcal";

	}
	
	// 모달창에서 calculate_tbl 데이터 넣기 (= 정산)
	@PostMapping("/classcal")
	public String classcal(Model model, @ModelAttribute CalculateDTO calculate) throws MemberRegistException {
		
		System.out.print("classCode : " + calculate);
		
		
		
		if(managerService.classcal(calculate)) {
			
			System.out.print("인서트 성공~~");
		}else {
			throw new MemberRegistException("수정에 실패하였습니다.");
		}
		
		return "redirect:/manager/classcal";
	}
	
	// 정산된 결제 내역 보기
	@GetMapping("/finishcal")
	public String finishcal(Model model,
			@RequestParam(required = false) String searchCondition, 
			@RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate) {
		
		Map<String, String> searchMap = new HashMap<>();
	      searchMap.put("searchCondition", searchCondition);
	      searchMap.put("searchValue", searchValue);
	      searchMap.put("startDate", startDate);
	      searchMap.put("endDate", endDate);
	      System.out.println("searchMap : " + searchMap);
	      
	      
	    int totalCount = managerService.finishClassTotalCount(searchMap);
	    System.out.println("totalCount : " + totalCount);
	      
	    int limit = 10;
	    int buttonAmount = 5;
	      
	    SelectCriteriawithdate selectCriteriawithdate = null;
		
	    if((startDate != null && !"".equals(startDate)) && (searchCondition != null && !"".equals(searchCondition))) {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue, startDate, endDate);
	    } else if(startDate != null && !"".equals(startDate)) {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, null, null, startDate, endDate);
	    } else if(searchCondition != null && !"".equals(searchCondition)) {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue, null, null);
	    } else {
	    	selectCriteriawithdate = Pagenationwithdate.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		  }
	    
	    System.out.println("selectCriteria : " + selectCriteriawithdate);
		
		List<PurchaseClassDTO> reviewContent = managerService.selectfinishClass(selectCriteriawithdate);

		model.addAttribute("reviewContent", reviewContent);
		model.addAttribute("selectCriteria", selectCriteriawithdate);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "manager/finishcal";
	}
	
	
	
}
