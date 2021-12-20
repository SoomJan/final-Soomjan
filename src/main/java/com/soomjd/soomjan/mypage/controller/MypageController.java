package com.soomjd.soomjan.mypage.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.BuyDTO;
import com.soomjd.soomjan.mypage.model.dto.JjimDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;
import com.soomjd.soomjan.mypage.model.dto.ReviewDTO;
import com.soomjd.soomjan.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
@SessionAttributes({ "loginMember", "selectCriteria" })
public class MypageController {

	private final MypageService mypageService;
	private final BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MypageController(MypageService mypageService, BCryptPasswordEncoder passwordEncoder) {
		this.mypageService = mypageService;
		this.passwordEncoder = passwordEncoder;
	}

	@GetMapping("main")
	public ModelAndView mypageMain(ModelAndView mv, HttpSession session, Model model) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());

		/* 수정된 회원의 정보 다시 조회해서 세션 수정하기 */
		MemberDTO newMember = mypageService.selectNewMember(map);
		System.out.println("업데이트된 회원 정보 : " + newMember);
		model.addAttribute("loginMember", newMember);

		/* 회원의 경고 내역 가져오기 */
		List<ReportMemberDTO> reportMember = new ArrayList<>();
		reportMember = mypageService.selectReportMember(map);
		for (ReportMemberDTO rm : reportMember) {
			System.out.println(rm);
		}

		mv.addObject("reportMember", reportMember);
		mv.setViewName("mypage/mypagemain");

		return mv;
	}

	@GetMapping("modify")
	public ModelAndView modifyForm(ModelAndView mv, HttpSession session) {

		mv.setViewName("mypage/modify");

		return mv;
	}

	@PostMapping("modify")
	public void modifyInfo(HttpServletResponse response, @RequestParam("nickName") String nickName,
			@RequestParam("phone") String phone, HttpSession session) throws IOException {

		System.out.println("수정될 닉네임 : " + nickName);
		System.out.println("수정될 핸드폰번호 : " + phone);

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		Map<String, String> map = new HashMap<>();
		map.put("nickName", nickName);
		map.put("phone", phone);
		map.put("email", member.getEmail());

		Boolean modifyInfo = mypageService.modifyInfo(map);

		if (modifyInfo) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}

	@GetMapping("modifyPwd")
	public ModelAndView modifyPwdForm(ModelAndView mv) {

		mv.setViewName("mypage/modifypwd");

		return mv;
	}

	@PostMapping("modifyPwd")
	public void modifyPwd(HttpServletResponse response, @RequestParam("originPwd") String originPwd,
			@RequestParam("newPwd") String newPwd, HttpSession session) throws IOException {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());

		System.out.println("변경 될 비밀번호 : " + originPwd);
		System.out.println("변경 할 비밀번호 : " + newPwd);

		if (!passwordEncoder.matches(originPwd, mypageService.selectEncPassword(map))) {
			response.getWriter().write("false");
		} else {

			/* 비밀번호 암호화 처리 */
			String setPwd = passwordEncoder.encode(newPwd);
			map.put("setPwd", setPwd);

			boolean modifyPwd = mypageService.modifyPwd(map);

			if (modifyPwd) {
				response.getWriter().write("true");
			} else {
				response.getWriter().write("fail");
			}
		}
	}

	@PostMapping("exit")
	public void memberExit(HttpServletResponse response, @RequestParam("pwd") String pwd, HttpSession session,
			SessionStatus status) throws IOException {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());

		System.out.println("탈퇴할 이메일의 비밀번호 : " + pwd);

		if (!passwordEncoder.matches(pwd, mypageService.selectEncPassword(map))) {
			response.getWriter().write("false");
		} else {

			boolean memberExit = mypageService.memberExit(map);

			if (memberExit) {
				response.getWriter().write("true");
				status.setComplete();
			} else {
				response.getWriter().write("fail");
			}
		}
	}

	// 수강중인
	@GetMapping("taking")
	public ModelAndView takingForm(ModelAndView mv, HttpSession session,
			@RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		searchMap.put("email", member.getEmail());
		System.out.println("searchMap : " + searchMap);

		int totalCount = mypageService.selectTakingTotalCount(searchMap);
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

		List<PurchaseClassDTO> pClass = mypageService.selectTakingClass(searchMap);
		
		List<PurchaseClassDTO> endClassList = new ArrayList<>();
		List<PurchaseClassDTO> takingClassList = new ArrayList<>();
		
		/* 종료일이 지난 클래스들 수강상태 변경하기 */
		for(PurchaseClassDTO pc : pClass) {
			
			Date now = new java.util.Date();
			
			System.out.println(pc.getEndDate());
			System.out.println(now);
			
			if(pc.getEndDate().before(now)) {
				
				endClassList.add(pc);
			} else {
				
				takingClassList.add(pc);
			}
		}
		
		for(PurchaseClassDTO ec : endClassList) {
			System.out.println("기간이 지난 클래스 --------");
			System.out.println(ec);
		}
		
		if(!endClassList.isEmpty()) {
			int endClass = mypageService.endClass(endClassList);
			
			if(endClass == endClassList.size()) {
				System.out.println("총 " + endClass + "의 클래스가 수강 완료로 전환되었습니다.");
			} else {
				System.out.println(endClass + "개의 클래스 수강 완료 전환이 실패하였습니다.");
			}
		} 
		

		mv.addObject("classList", takingClassList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.setViewName("mypage/taking");

		return mv;
		
	}

	// 찜한
	@GetMapping("jjim")
	public ModelAndView jjimForm(ModelAndView mv, HttpSession session,
			@RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchValue,
			@RequestParam(defaultValue = "1") int currentPage) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		searchMap.put("email", member.getEmail());
		System.out.println("searchMap : " + searchMap);

		int totalCount = mypageService.selectJjimTotalCount(searchMap);
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

		List<JjimDTO> jjimList = mypageService.selectJjimClass(searchMap);

		mv.addObject("jjimList", jjimList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.setViewName("mypage/jjim");

		return mv;
	}

	@PostMapping("jjimCancel")
	public void jjimCancel(HttpServletResponse response, @RequestParam("classNo") String classNo, HttpSession session)
			throws IOException {

		System.out.println(classNo);
		List<String> classNoList = new ArrayList<>();
		String[] classNo2 = classNo.split(",");
		for (String c : classNo2) {
			System.out.println(c);

			classNoList.add(c);
		}

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		Map<String, Object> map = new HashMap<>();
		map.put("email", member.getEmail());
		map.put("classNoList", classNoList);

		int jjimCancel = mypageService.jjimCancel(map);
		System.out.println("삭제된 행 갯수 : " + jjimCancel);

		if (jjimCancel == classNoList.size()) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}

	// 구매내역
	@GetMapping("buy")
	public ModelAndView buyForm(ModelAndView mv, HttpSession session
			, @RequestParam(required = false) String searchCondition
			, @RequestParam(required = false) String searchValue
			, @RequestParam(defaultValue = "1") int currentPage
			, @RequestParam(required = false) String sort) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		System.out.println("넘어온 정렬값 : " + sort);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		searchMap.put("email", member.getEmail());
		searchMap.put("sort", sort);
		System.out.println("searchMap : " + searchMap);

		int totalCount = mypageService.selectBuyTotalCount(searchMap);
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

		List<BuyDTO> buyList = mypageService.selectBuyList(searchMap);

		mv.addObject("buyList", buyList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.addObject("sort", sort);
		mv.setViewName("mypage/buy");

		return mv;
	}

	// 수강완료
	@GetMapping("finish")
	public String finishForm(Model model, HttpSession session, @RequestParam(required = false) String searchCondition,
			@RequestParam(required = false) String searchValue, @RequestParam(defaultValue = "1") int currentPage) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		System.out.println("finishList");
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		searchMap.put("email", member.getEmail());
		System.out.println("searchMap : " + searchMap);

		int totalCount = mypageService.selectFinishTotalCount(searchMap);
		System.out.println("tatalCount : " + totalCount);

		int limit = 5;
		int buttonAmount = 5;

		SelectCriteria selectCriteria = null;

		if (searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition,
					searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		}

		Map<String, Object> criteriaMap = new HashMap<String, Object>();
		criteriaMap.put("selectCriteria", selectCriteria);
		criteriaMap.put("email", member.getEmail());

		System.out.println("selectCriteria : " + selectCriteria);

		List<PurchaseClassDTO> finishList = mypageService.finishClass(criteriaMap);
		System.out.println("finishList : " + finishList);

		model.addAttribute("finishList", finishList);
		model.addAttribute("selectCriteria", selectCriteria);
		System.out.println("selectCriteria : " + selectCriteria);

		return "mypage/finish";
	}

	// 수강후기 작성
	@PostMapping("finishReview")
	public String finishReview(HttpServletRequest request, HttpSession session, Model model) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		String categoryName = request.getParameter("t-categoryName");
		String contents = request.getParameter("contents");

		int classCode = Integer.parseInt(request.getParameter("classCode"));
		int reviewStar = Integer.parseInt(request.getParameter("reviewStar"));

		System.out.println("후기를 작성할 클래스 코드 : " + request.getParameter("classCode"));
		System.out.println("후기를 작성할 후기 별점 : " + request.getParameter("reviewStar"));

		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("email", member.getEmail());

		reviewMap.put("classCode", classCode);
		reviewMap.put("reviewStar", reviewStar);

		reviewMap.put("categoryName", categoryName);
		reviewMap.put("contents", contents);

		System.out.println("reviewMap : " + reviewMap);

		int reviewContent = mypageService.insertReviewContent(reviewMap);
		System.out.println("reviewContent : " + reviewContent);

		model.addAttribute("reviewContent", reviewContent);

		return "redirect:/mypage/review";
	}

	// 수강후기
	@GetMapping("review")
	public String reviewForm(Model model, HttpSession session, @RequestParam(defaultValue = "1") int currentPage) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("email", member.getEmail());

		System.out.println("searchMap : " + searchMap);

		int totalCount = mypageService.selectReviewTotalCount(searchMap);
		System.out.println("totalCount : " + totalCount);

		int limit = 5;
		int buttonAmount = 5;

		SelectCriteria selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);

		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("selectCriteria", selectCriteria);
		reviewMap.put("email", member.getEmail());
		System.out.println("reviewMap : " + reviewMap);
		
		List<Map<String, Object>> reviewList = mypageService.selectReviewList(reviewMap);
		System.out.println("reviewList : " + reviewList);
		 
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("selectCriteria", selectCriteria);
		 
		 

		return "mypage/review";
	}
	
	@PostMapping("deleteReview")
	public String deleteReview(HttpServletRequest request, HttpSession session) {
		
		int rvCode = Integer.parseInt(request.getParameter("rvCode"));
		
		System.out.println("rvCode : " + rvCode);
		
		if(mypageService.deleteReview(rvCode) > 0) {
			
		}
		
		return "redirect:/mypage/review";
	}

}
