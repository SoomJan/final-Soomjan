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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.exception.MemberRegistException;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ReportClassDTO;
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

	/**
	 * @author 권순표
	 * 마이페이지 메인 화면 조회
	 */
	@GetMapping("main")
	public ModelAndView mypageMain(ModelAndView mv, HttpSession session, Model model) {

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());

		/* 수정된 회원의 정보 다시 조회해서 세션 수정하기 */
		MemberDTO newMember = mypageService.selectNewMember(map);
		System.out.println("업데이트된 회원 정보 : " + newMember);
		model.addAttribute("loginMember", newMember);

		/* 회원의 경고 횟수 조회 */
		int memberTotalCount = mypageService.selectMemberTotalCount(map);
		System.out.println("memberTotalCount : " + memberTotalCount);
		
		/* 회원의 경고 내역 가져오기 */
		List<ReportMemberDTO> reportMember = new ArrayList<>();
		reportMember = mypageService.selectReportMember(map);
		for (ReportMemberDTO rm : reportMember) {
			System.out.println(rm);
		}
		
		/* 잔디회원의 클래스 경고 횟수 조회 */
		int classTotalCount = mypageService.selectClassTotalCount(map);
		System.out.println("classTotalCount : " + classTotalCount);
		
		/* 잔디회원의 클래스 경고 내역 가져오기 */
		 List<ReportClassDTO> reportClass = new ArrayList<>(); 
		 reportClass = mypageService.selectReportClass(map);
		 for (ReportClassDTO rc : reportClass) {
			 System.out.println(rc);
		 }
		 
		mv.addObject("reportMember", reportMember);
		mv.addObject("memberTotalCount", memberTotalCount);
		mv.addObject("reportClass", reportClass);
		mv.addObject("classTotalCount", classTotalCount);
		mv.setViewName("mypage/mypagemain");

		return mv;
	}

	/**
	 * @author 권순표
	 * 회원 정보 수정 페이지 조회
	 */
	@GetMapping("modify")
	public ModelAndView modifyForm(ModelAndView mv, HttpSession session) {

		mv.setViewName("mypage/modify");

		return mv;
	}

	/**
	 * @author 권순표
	 * 회원 정보 수정
	 * @param response 수정 성공 여부
	 * @param nickName 사용자 입력 닉네임
	 * @param phone 사용자 입력 핸드폰 번호
	 */
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

	/**
	 * @author 권순표
	 * 비밀번호 수정 페이지 조회
	 */
	@GetMapping("modifyPwd")
	public ModelAndView modifyPwdForm(ModelAndView mv) {

		mv.setViewName("mypage/modifypwd");

		return mv;
	}

	/**
	 * @author 권순표 
	 * 사용자 비밀번호 수정
	 * @param response 수정 성공 여부
	 * @param originPwd 사용자가 입력한 원래 비밀번호
	 * @param newPwd 사용자가 입력한 수정될 비밀번호
	 */
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

	/**
	 * @author 권순표
	 * 회원 탈퇴
	 * @param response 탈퇴 성공 여부
	 * @param pwd 사용자가 입력한 비밀번호
	 */
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

	
	/**
	 * @author 권순표
	 * 현재 수강중인 클래스 조회
	 */
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

		/* 전체 갯수 조회 */
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

		/* 수강했던 클래스 전체 조회 */
		List<PurchaseClassDTO> pClass = mypageService.selectTakingClass(searchMap);
		
		/* 수강기간이 끝난 클래스와 수강중인 클래스 분류하기 */
		List<PurchaseClassDTO> endClassList = new ArrayList<>();
		List<PurchaseClassDTO> takingClassList = new ArrayList<>();
		
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
		
		/* 기간이 지난 클래스는 수강 완료 상태로 바꿔주기 */
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

	
	/**
	 * @author 권순표
	 * 찜한 클래스 조회
	 */
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

		/* 전체 갯수 조회 */
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

		/* 찜한 리스트 조회 */
		List<JjimDTO> jjimList = mypageService.selectJjimClass(searchMap);

		mv.addObject("jjimList", jjimList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.setViewName("mypage/jjim");

		return mv;
	}

	/**
	 * @author 권순표
	 * 찜한 클래스 취소
	 * @param response 취소 성공 여부
	 * @param classNo 사용자가 체크한 클래스 번호
	 */
	@PostMapping("jjimCancel")
	public void jjimCancel(HttpServletResponse response, @RequestParam("classNo") String classNo, HttpSession session)
			throws IOException {

		System.out.println("삭제할 클래스 번호 모음" + classNo);
		
		List<String> classNoList = new ArrayList<>();
		/* 데이터 정제 */
		String[] classNo2 = classNo.split(",");
		for (String c : classNo2) {
			System.out.println(c);

			classNoList.add(c);
		}

		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		Map<String, Object> map = new HashMap<>();
		map.put("email", member.getEmail());
		map.put("classNoList", classNoList);

		/* 찜한 클래스 삭제 */
		int jjimCancel = mypageService.jjimCancel(map);
		System.out.println("삭제된 행 갯수 : " + jjimCancel);

		if (jjimCancel == classNoList.size()) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}

	/**
	 * @author 권순표
	 * 구매 내역 조회
	 * @param sort 사용자가 선택한 정렬 조건
	 */
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

		/* 전체 갯수 조회 */
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

		/* 구매 내역 조회 */
		List<BuyDTO> buyList = mypageService.selectBuyList(searchMap);

		mv.addObject("buyList", buyList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.addObject("sort", sort);
		mv.setViewName("mypage/buy");

		return mv;
	}

	/**
	 * 수강 완료 페이지 조회
	 * @author 효진
	 */
	@GetMapping("finish")
	public String finishForm(Model model, HttpSession session, @RequestParam(required = false) String searchCondition,
			@RequestParam(required = false) String searchValue, @RequestParam(defaultValue = "1") int currentPage) {

		// session에서 로그인된 정보 불러오기
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		// searchMap에 검색정보와 로그인한 email 담기
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		searchMap.put("email", member.getEmail());
		System.out.println("searchMap : " + searchMap);

		// 수강완료 클래스 전체 수 조회하기
		int totalCount = mypageService.selectFinishTotalCount(searchMap);
		System.out.println("tatalCount : " + totalCount);

		// 한 페이지 당 5개씩 조회하기
		int limit = 5;
		int buttonAmount = 5;

		SelectCriteria selectCriteria = null;

		if (searchCondition != null && !"".equals(searchCondition)) {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition,
					searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		}

		// criteriaMap에 selectCriteria와 로그인 된 email 담기
		Map<String, Object> criteriaMap = new HashMap<String, Object>();
		criteriaMap.put("selectCriteria", selectCriteria);
		criteriaMap.put("email", member.getEmail());

		// criteriaMap을 이용하여 수강완료 클래스 조회하기
		List<PurchaseClassDTO> finishList = mypageService.finishClass(criteriaMap);
		System.out.println("finishList : " + finishList);

		// model 객체에 수강완료리스트와 selectCriteria 담기
		model.addAttribute("finishList", finishList);
		model.addAttribute("selectCriteria", selectCriteria);

		return "mypage/finish";
	}

	/**
	 * 수강완료페이지 - 수강후기 작성
	 * @author 효진
	 */
	@PostMapping("finishReview")
	public String finishReview(HttpServletRequest request, HttpSession session, Model model) {

		// session에서 로그인 된 정보 가져오기
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		// 카테고리이름과 내용 파라미터 값 가져오기
		String categoryName = request.getParameter("t-categoryName");
		String contents = request.getParameter("contents");
		
		// 가져온 파라미터 값 확인하기
		System.out.println(request.getParameter("classCode"));
		System.out.println(request.getParameter("reviewStar"));

		// 파라미터 값 가져오기
		int classCode = Integer.parseInt(request.getParameter("classCode"));
		int reviewStar = Integer.parseInt(request.getParameter("reviewStar"));
		int classPurcCode = Integer.parseInt(request.getParameter("classPurcCode"));

		// 파라미터 값 확인하기
		System.out.println("후기를 작성할 클래스 코드 : " + request.getParameter("classCode"));
		System.out.println("후기를 작성할 후기 별점 : " + request.getParameter("reviewStar"));

		// reviewMap에 로그인 된 email과 가져온 파라미터 값 담기
		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("email", member.getEmail());
		reviewMap.put("classCode", classCode);
		reviewMap.put("reviewStar", reviewStar);
		reviewMap.put("classPurcCode", classPurcCode);
		reviewMap.put("categoryName", categoryName);
		reviewMap.put("contents", contents);

		// reviewMap에 담긴 값 확인하기
		System.out.println("reviewMap : " + reviewMap);

		// reviewMap을 이용하여 작성된 수강 후기 DB에 저장하기
		int reviewContent = mypageService.insertReviewContent(reviewMap);
		System.out.println("reviewContent : " + reviewContent);

		// model 객체에 리뷰 담기
		model.addAttribute("reviewContent", reviewContent);

		return "redirect:/mypage/review";
	}

	/**
	 * 수강후기 페이지 조회
	 * @author 효진
	 */
	@GetMapping("review")
	public String reviewForm(Model model, HttpSession session, @RequestParam(defaultValue = "1") int currentPage) {

		// session에서 로그인 된 정보 가져오기
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		// searchMap에 로그인 된 email 담기
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("email", member.getEmail());
		System.out.println("searchMap : " + searchMap);

		// 수강 후기 갯수 조회하기
		int totalCount = mypageService.selectReviewTotalCount(searchMap);
		System.out.println("totalCount : " + totalCount);

		// 한 페이지에 5개씩 조회하기
		int limit = 5;
		int buttonAmount = 5;

		SelectCriteria selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);

		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("selectCriteria", selectCriteria);
		reviewMap.put("email", member.getEmail());
		System.out.println("reviewMap : " + reviewMap);
		
		// 로그인 된 email과 검색정보를 사용하여 수강 후기 리스트 조회하기
		List<Map<String, Object>> reviewList = mypageService.selectReviewList(reviewMap);
		System.out.println("reviewList : " + reviewList);
		 
		// model 객체에 수강후기 리스트와 selectCriteria 담기
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("selectCriteria", selectCriteria);
		 
		return "mypage/review";
	}
	
	/**
	 * 수강 후기 삭제
	 * @author 효진
	 */
	@PostMapping("deleteReview")
	public String deleteReview(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		
		// rvCode 파라미터 값 가져오기
		int rvCode = Integer.parseInt(request.getParameter("rvCode"));
		
		// 가져온 파라미터 값 확인하기
		System.out.println("rvCode : " + rvCode);
		
		// 삭제 성공여부 확인하기
		if(mypageService.deleteReview(rvCode) > 0) {
			rttr.addFlashAttribute("deleteMessage", "삭제에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("deleteMessage", "삭제에 실패했습니다.");
		}
		
		return "redirect:/mypage/review";
	}
	
	/**
	 * 잔디 가입페이지 요청
	 * @return
	 * @author 임예람
	 */
	@GetMapping("joinJandi")
	public String joinJandi() {
		return "jandi/join/joinJandi";
	}
	
	/**
	 * 잔디 가입하기
	 * 
	 * @param jandi
	 * @param model
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("registJandi")
	public String registJandi(@ModelAttribute JandiDTO jandi, HttpSession session, RedirectAttributes rttr){
		
		// 로그인한 사용자 정보 가져와서 jandiDTO에 저장
		MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
		String email = member.getEmail();
		jandi.setEmail(email);

		System.out.println(jandi);
		
		// 성공 여부에 따라 리다이렉트 메세지 설정 후 리다이렉트 하기
		if(mypageService.registJandi(jandi) && mypageService.modifyIsJandi(jandi.getEmail())) {
			
			// 잔디 테이블의 인서트와 새싹 테이블의 잔디 여부가 변경되면 기존 세션의 값 변경 
			session.setAttribute("isjandi", "Y");
			member.setIsJandi('Y');
			
			session.setAttribute("loginMember", member);
			
			rttr.addFlashAttribute("jandiRegistMessage", "잔디 가입을 축하합니다.");
		}else {
			rttr.addFlashAttribute("jandiRegistMessage", "잔디 가입에 실패했습니다. ");
		}

		return "redirect:/";
	}
}
