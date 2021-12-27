package com.soomjd.soomjan.classRoom.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassPurchaseDTO;
import com.soomjd.soomjan.classRoom.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;
import com.soomjd.soomjan.classRoom.model.dto.PaymentDTO;
import com.soomjd.soomjan.classRoom.model.dto.ReviewDTO;
import com.soomjd.soomjan.classRoom.model.service.ClassRoomService;
import com.soomjd.soomjan.common.fileWrapper.FileWrapper;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;


/**
 * 클래스 룸의 컨트롤러
 * 
 * @author 임예람
 *
 */
@Controller
@RequestMapping("/*/class/*")
@SessionAttributes({ "currentCount", "classCode", "classDTO", "jandi", "selectCriteria", "currentMemberList", "jjimClassMemberList"})
public class ClassRoomController{

	private final ClassRoomService classRoomService;

	@Autowired
	public ClassRoomController(ClassRoomService classRoomService, HttpSession session) {
		this.classRoomService = classRoomService;
	}

	/**
	 * 클래스룸의 메인페이지인 클래스룸 주소 요청
	 * 
	 * @param model
	 * @param classCode	클래스룸을 보여 줄 클래스 코드
	 * @param session
	 * @param searchCondition
	 * @param searchValue
	 * @param currentPage
	 * 
	 * @author 임예람, 양효진
	 */
	@GetMapping("classRoom")
	public void classRoom(Model model, @RequestParam int classCode, HttpSession session, @RequestParam(required = false) String searchCondition,
			@RequestParam(required = false) String searchValue, @RequestParam(defaultValue = "1") int currentPage) {

		// 파라미터로 받은 클래스 코드로 클래스 정보 조회후, SessionAttributes에 저장
		model.addAttribute("classCode", classCode);
		model.addAttribute("classDTO", classRoomService.selectClassByClassCode(classCode));
		
		// 잔디페이지 들어올 때 저장해 놓은 잔디 정보를 해당 컨트롤러에도 사용 할 수 있게  SessionAttributes에 저장
		model.addAttribute("jandi", session.getAttribute("jandi"));
		
		System.out.println("classCode : " + classCode);
		System.out.println("jandi : " + (JandiDTO) session.getAttribute("jandi"));
		
		// 해당 클래스를 듣고 있는 새싹의 리스트 조회, 해당 리스트의 사이즈로 총 멤버의 수 저장
		List<Map<String, String>> currentMemberList = classRoomService.selectCurrentMemberList(classCode);
		model.addAttribute("currentMemberList", currentMemberList);
		model.addAttribute("currentCount", currentMemberList.size());
		
		/* 해당 클래스의 리뷰 페이징 처리 */
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("classCode", classCode);
		
		// 리뷰의 총 개수 구하기
		int totalCount = classRoomService.selectReviewListByClassCodeTotalCount(searchMap);
		model.addAttribute("reviewCount", totalCount);
		
		// 5개씩 끊어서 보여주기위해 설정
		int limit = 5;
		int buttonAmount = 5;
		
		// 파라미터로 넘어온 현재 페이지 번호, 검색 조건, 검색 값 담기
		SelectCriteria selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue);
		System.out.println("selectCriteria : " + selectCriteria);
		
		// 해당 정보를 계속 사용할 수 있게 저장
		model.addAttribute("selectCriteria", selectCriteria);
		
		//서치 맵에 selectCriteria 객체를 담아 리뷰 리스트 조회해 오기
		searchMap.put("selectCriteria", selectCriteria);
		List<ReviewDTO> reviewList = classRoomService.selectReviewListByClassCode(searchMap);
		model.addAttribute("reviewList", reviewList);
		
		/* 해당 클래스의 평균 별점 구하기 */
		// 위에서 구해온 리뷰리스트의 사이즈가 0이면 0을 반환하고 아니면 해당 리뷰들의 평균값을 조회하기
		double classStar = 0;
		
		if(reviewList.size() > 0) {
			classStar = classRoomService.selectAvgReviewStar(classCode);
		}
		model.addAttribute("classStar", classStar);
		
		// 해당 목차 리스트 조회
		model.addAttribute("mokchaList", classRoomService.selectMokchaTitleList(classCode));
		// 해당 클래스를 찜한 회원의 리스트 조회 후 SessionAttributes에 저장
		model.addAttribute("jjimClassMemberList", classRoomService.selectJJimClassMemberList(classCode));
		// 신고에 사용하기 위한 신고 문구 조회하기
		model.addAttribute("reportStateList", classRoomService.selectAllReportStatement());
	}

	/**
	 * 클래스 룸 클래스 목차(강의 영상) 주소 요청
	 * 
	 * @param model
	 * @param currentPage
	 * 
	 * @author 임예람
	 */
	@GetMapping("classLecture")
	public void classLecture(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		
		// sessionAtributes의 클래스 코드 가져오기
		int classCode = (int) model.getAttribute("classCode");
		System.out.println(classCode);
		
		/* 목차 페이징 처리 */
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("classCode", classCode);
		
		System.out.println("searchMap : " + searchMap);
		
		int totalCount = classRoomService.selectClassLectureTotalCount(searchMap);
		model.addAttribute("totalCount", totalCount);
		
		System.out.println("totalCount : " + totalCount);
		
		int limit = 5;
		int buttonAmount = 5;
		
		SelectCriteria selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		model.addAttribute("selectCriteria", selectCriteria);
		
		searchMap.put("selectCriteria", selectCriteria);
		model.addAttribute("mokchaList", classRoomService.selectMokchaList(searchMap));
		
		// 목차 리스트별 목차 파일 가져오기
		model.addAttribute("mokchaFileList", classRoomService.selectMokchaFileList(classCode));
		// 신고에 사용하기 위한 신고 문구 조회하기
		model.addAttribute("reportStateList", classRoomService.selectAllReportStatement());

	}

	/**
	 * 클래스 룸 학습방 주소 요청
	 * 
	 * @param model
	 * @param currentPage
	 * 
	 * @author 임예람, 양효진
	 */
	@GetMapping("classLearningBoard")
	public void classLearningBoard(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		// sessionAtributes의 클래스 코드 가져오기
		int classCode = (int) model.getAttribute("classCode");
		
		/* 학습방 게시물 목록 페이징 처리 */
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("classCode", classCode);
		
		// 전체 게시물 개수
		int totalCount = classRoomService.selectLearningBoardTotalCount(searchMap);
		System.out.println("totalCount : " + totalCount);
		
		int limit = 5;
		int buttonAmount = 5;
		
		// 조건 값 저장
		SelectCriteria selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		searchMap.put("selectCriteria", selectCriteria);
		model.addAttribute("selectCriteria", selectCriteria);
		
		// 게시물 리스트 조회
		model.addAttribute("learningPostList", classRoomService.selectLearningPostList(searchMap));
		
	}

	
	/**
	 * 클레스룸 학습방 게시물 주소 요청
	 * @param model
	 * @param postCode
	 * 
	 * @author 임예람
	 */
	@GetMapping("classLearningPost")
	public void classLearningPost(Model model, @RequestParam int postCode) {

		// 파라미터로 전달 받은 postCode로 게시물 조회
		model.addAttribute("learnigPost", classRoomService.selectPostByPostCode(postCode));
		// 해당 게시물의 파일 리스트 조회
		model.addAttribute("learnigFileList", classRoomService.selectLearningFileList(postCode));

	}

	
	/**
	 * 잔디의 채팅 페이지 주소 요청
	 * @param model
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("jandiClassChat")
	public String jandiClassChat(Model model) {
		
		// 클래스 작성자 이메일과 클래스 코드 가져오기
		int classCode = (int) model.getAttribute("classCode");
		String email = ((ClassDTO) model.getAttribute("classDTO")).getEmail();

		// 클래스 코드와 이메일로 채팅방 목록 조회하기 위한 맵 생성
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		// 해당 클래스의 채팅방 목록 조회하기
		List<Map<String, Object>> chatRoomList = classRoomService.selectChatRoomList(chatRoomMap);
		System.out.println(chatRoomList);
		
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("reportStateList", classRoomService.selectAllReportStatement());

		return "jandi/class/classChat";
	}
	
	/**
	 * 마이페이지의 수강중인 클래스의 채팅방 주소 요청
	 * @param model
	 * @param session
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("mypageClassChat")
	public String mypageClassChat(Model model, HttpSession session) {
		
		// 해당 클래스 코드와 로그인한 사용자 이메일 가져와서 맵에 저장하기
		int classCode = (int) model.getAttribute("classCode");
		String email = ((MemberDTO) session.getAttribute("loginMember")).getEmail();
		
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		// 저장한 맵을 사용해서 채팅 코드 가져오기
		HashMap<String, Object> chatCodeMap = classRoomService.selectClassChatBySSACKEmail(chatRoomMap);
		System.out.println("chatCode : " + chatCodeMap.get("CHAT_CODE"));
		
		model.addAttribute("chatCode", chatCodeMap.get("CHAT_CODE"));
		model.addAttribute("reportStateList", classRoomService.selectAllReportStatement());
		
		return "mypage/class/classChat";
	}

	/**
	 * 클래스 룸 생성하기
	 * @param classMap
	 * @param session
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("createClass")
	public String createClass(@RequestParam Map<String, Object> classMap, HttpSession session) {
		// 잔디의 이메일 가져오기
		JandiDTO jandi = (JandiDTO) session.getAttribute("jandi");
		// 파라미터 값 확인
		System.out.println(jandi.getEmail() + ":  " + classMap);
		// 파라미터로 값 형변환 후 저장
		int categoryCode = Integer.parseInt(classMap.get("categoryCode").toString());
		int maxCount = Integer.parseInt(classMap.get("maxCount").toString());
		int price = Integer.parseInt(classMap.get("price").toString());
		
		//클래스DTO로 저장
		ClassDTO classDTO = new ClassDTO(categoryCode, maxCount, price, classMap.get("title").toString(),
				jandi.getEmail());

		int classCode = 0;
		// 클래스  인서트가 성공하면 클래스 코드에 생성한 클래스 코드를 저장
		if (classRoomService.registClass(classDTO) > 0) {
			classCode = classRoomService.selectClassCode(jandi.getEmail());
			// 세션의 classList객체를 다시 조회하여 저장
			session.setAttribute("classList", classRoomService.selectClassCodeList(jandi.getEmail()));
		}
		
		// 클래스 코드가 0이상이면 잘 생성된 것이기 때문에 해당 클래스룸으로 보내주고, 아니면 다시 잔디페이지 메인으로 보낸다.
		return classCode > 0 ? "redirect:/jandi/class/classRoom?classCode=" + classCode
				: "redirect:/jandi/jandiProfile";
	}

	/**
	 * 클레스 삭제 
	 * @param model
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("deleteClass")
	public String deleteClass(Model model) {
		// 클래스 코드 가져오기
		int classCode = (int) model.getAttribute("classCode");
		// 클래스 삭제
		if (classRoomService.deleteClass(classCode) > 0) {
			System.out.println("클래스 삭제 성공");
		}
		return "redirect:/jandi/jandiProfile";
	}

	/**
	 * 클래스룸 수정하기
	 * @param model
	 * @param rttr
	 * @param contents 클래스 내용
	 * @param tag 클래스 태그
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("modifyClass")
	public String modifyClass(Model model, RedirectAttributes rttr, @RequestParam String contents,
			@RequestParam String tag) {

		//파라미터 값 확인
		System.out.println("contents : " + contents);
		System.out.println("tag : " + tag);

		//클래스 코드 가져오기
		int classCode = (int) model.getAttribute("classCode");

		//클래스DTO에 저장
		ClassDTO classDTO = new ClassDTO();
		classDTO.setClassCode(classCode);
		classDTO.setContents(contents);
		classDTO.setTag(tag);

		// 인서트 성공, 실패에 따라 modifyMessage 저장
		if (classRoomService.modifyClass(classDTO) > 0) {
			rttr.addFlashAttribute("modifyMessage", "수정에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("modifyMessage", "수정에 실패했습니다.");
		}
		
		// 해당 페이지로 리다이렉트
		return "redirect:/jandi/class/classRoom?classCode=" + classCode;
	}

	
	/**
	 * 목차 생성하기
	 * @param request
	 * @param model
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("registLecture")
	public String registLecture(HttpServletRequest request, Model model, RedirectAttributes rttr) {

		// 클래스 코드 가져오고, 파라미터 값 확인
		int classCode = (int) model.getAttribute("classCode");
		System.out.println(request.getParameter("mockchaName"));
		System.out.println(request.getParameter("contents"));

		// 목차 DTO에 저장 
		MokchaDTO mokcha = new MokchaDTO();
		mokcha.setMokchaName(request.getParameter("mockchaName"));
		mokcha.setContents(request.getParameter("contents"));
		mokcha.setClassCode(classCode);

		// 목차 인서트 성공 여부에 따라 flashAttribute에 메세지 저장
		if (classRoomService.registLecture(mokcha) > 0) {
			rttr.addFlashAttribute("modifyMessage", "목차를 추가했습니다.");
		} else {
			rttr.addFlashAttribute("modifyMessage", "목차 추가에 실패했습니다.");
		}
		// 해당 페이지로 리다이렉트
		return "redirect:/jandi/class/classLecture";
	}

	/**
	 * 목차 파일 업로드
	 * @param file
	 * @param mokchaCode
	 * @param session
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("uploadMokchaFile")
	public String uploadMokchaFile(@RequestParam MultipartFile file, @RequestParam int mokchaCode, HttpSession session,
			RedirectAttributes rttr) {

		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();

		// 파일 , 파라미터 확인
		System.out.println("file : " + file.getSize());
		System.out.println("file : " + file.getName());
		System.out.println("mokchaCode : " + mokchaCode);

		// 파일 경로 설정
		String root = session.getServletContext().getRealPath("resources");
		String dir = "/lectureFiles/videos";
		String filePath = root + dir;

		// 파일명 변경처리
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;

		/* 파일 저장에 성공하면 데이터베이스에 업로드 후, 리다이렉트어트리뷰트 메세지 저장
		   실패 하면 실패 메세지 저장 */
		if (fileWrapper.uploadSingleFile(file, savedName, filePath)) {

			// DB에 저장할 파일 DTO
			ClassFileDTO classFile = new ClassFileDTO();
			classFile.setEmail(((JandiDTO) session.getAttribute("jandi")).getEmail());
			classFile.setFilePath(dir + "/" + savedName);
			classFile.setOrgFilePath(originFileName);
			classFile.setMokchaCode(mokchaCode);
			
			if (classRoomService.registLectureFile(classFile) > 0) {
				rttr.addFlashAttribute("uploadMessage", "업로드를 완료했습니다.");
			}
			System.out.println("성공!");
		} else {
			rttr.addFlashAttribute("uploadMessage", "업로드에 실패했습니다.");
		}

		return "redirect:/jandi/class/classLecture";
	}

	/**
	 * 학습방 게시물 생성
	 * @param model
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("registLearningPost")
	public String registLearningPost(Model model) {
		
		//DTO에 인서트할 정보 담기
		LearningPostDTO learningPost = new LearningPostDTO();
		learningPost.setEmail(((JandiDTO) model.getAttribute("jandi")).getEmail());
		learningPost.setClassCode((int) model.getAttribute("classCode"));

		System.out.println("learning: " + learningPost);

		int postCode = 0;
		
		// 인서트가 성공적으로 수행되면 해당 postCode를 조회 
		if (classRoomService.registLearnigPost(learningPost)) {
			postCode = classRoomService.selectNewPostCode(learningPost);
		}
		
		// 조회된 postCode로 리다이렉트
		return "redirect:/jandi/class/classLearningPost?postCode=" + postCode;
	}

	/**
	 * 학습방 게시물 수정하기
	 * @param model
	 * @param rttr
	 * @param contents
	 * @param title
	 * @param postCode
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("modifyLearnigPost")
	public String modifyLearnigPost(Model model, RedirectAttributes rttr, @RequestParam String contents,
			@RequestParam String title, @RequestParam int postCode) {

		// 파라미터 값 확인
		System.out.println("contents : " + contents);
		System.out.println("title : " + title);
		System.out.println("postCode : " + postCode);

		// 전달 받은 파라미터 DTO에 저장
		LearningPostDTO learningPost = new LearningPostDTO();
		learningPost.setTitle(title);
		learningPost.setContents(contents);
		learningPost.setPostCode(postCode);

		// 변경 성공 여부에 따라 리다이렉트 메세지 저장
		if (classRoomService.modifyLearnigPost(learningPost) > 0) {
			rttr.addFlashAttribute("modifyMessage", "수정에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("modifyMessage", "수정에 실패했습니다.");
		}

		// 해당 포스트로 리다이렉트
		return "redirect:/jandi/class/classLearningPost?postCode=" + postCode;

	}

	
	/**
	 * 학습방 게시물에 파일 저장하기
	 * @param file
	 * @param postCode
	 * @param session
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("uploadLearningFile")
	public String uploadLearningFile(@RequestParam MultipartFile file, @RequestParam int postCode
			, HttpSession session, RedirectAttributes rttr) {

		// 해당 잔디인지 아닌지 구분하기 위해 선언
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		ClassDTO classDTO = (ClassDTO) session.getAttribute("classDTO");

		System.out.println("member : " + member.getEmail() + ", class : " + classDTO.getEmail());

		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();

		// 파일 , 파라미터 확인
		System.out.println("file : " + file.getOriginalFilename());
		System.out.println("postCode : " + postCode);

		// 파일 경로 설정
		String root = session.getServletContext().getRealPath("resources");
		String dir = "/learningFiles";
		String filePath = root + dir;

		// 파일명 변경처리
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
		
		//파일 저장에 성공하면 데이터베이스에 인서트 후 리다이렉트 메세지 설정
		if(fileWrapper.uploadSingleFile(file, savedName, filePath)) {
			// DB에 저장할 파일 DTO 
			ClassFileDTO classFile = new ClassFileDTO();
			classFile.setEmail(member.getEmail()); classFile.setFilePath(dir + "/" +
			savedName); classFile.setOrgFilePath(originFileName);
			classFile.setPostCode(postCode);
			
			if(classRoomService.registLearningFile(classFile) > 0) {
				rttr.addFlashAttribute("uploadMessage", "업로드를 완료했습니다."); 
			}else {
				rttr.addFlashAttribute("uploadMessage", "업로드에 실패했습니다."); 
			}
			
		} else { 
			rttr.addFlashAttribute("uploadMessage", "업로드에 실패했습니다."); 
		}
		 
		// 로그인한 사용자가 해당 클래스의 작성자인지에 따라 리다이렉트
		return (member.getEmail().equals(classDTO.getEmail()))
				? "redirect:/jandi/class/classLearningPost?postCode=" + postCode
				: "redirect:/mypage/class/classLearningPost?postCode=" + postCode;
	}

	/**
	 * 파일 다운로드
	 * @param request
	 * @param response
	 * 
	 * @author 임예람
	 */
	@GetMapping("*/download")
	public void download(HttpServletRequest request, HttpServletResponse response) {

		// 서버에 있는 파일을 파라미터 값으로 받아와서 파일객체로 저장
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = request.getParameter("filePath");
		String originFileName = request.getParameter("fileName");
		
		File file = new File(root + filePath);
		
		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();
		 
		try {
			// 파일을 UTF-8로 변환 (한국어 깨짐 방지)
			originFileName = new String(originFileName.getBytes("UTF-8"), "iso-8859-1");
			response.setHeader("Content-type", "application/octet-stream; charset=UTF-8");
			response.setHeader("Content-Disposition", "filename=" + originFileName);

			// 파일 다운로드 성공 체크
			if (fileWrapper.downloadSingleFile(file, response.getOutputStream())) {
				System.out.println("다운로드 성공");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 클래스 룸 썸네일 파일 업로드
	 * @param file
	 * @param classCode
	 * @param session
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("uploadClassFile")
	public String uploadClassFile(@RequestParam MultipartFile file, @RequestParam int classCode, HttpSession session,
			RedirectAttributes rttr) {

		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();

		// 파일 , 파라미터 확인
		System.out.println("file : " + file.getOriginalFilename());
		System.out.println("classCode : " + classCode);

		// 파일 경로 설정
		String root = session.getServletContext().getRealPath("resources");
		String dir = "/uploadFiles/classImage/";
		String filePath = root + dir;

		// 파일명 변경처리
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;

		// 파일 저장 성공시 데이터베이스에 저장 후 리다이렉트 메세지 설정
		if (fileWrapper.uploadSingleFile(file, savedName, filePath)) {

			// DB에 저장할 파일 DTO
			ClassDTO classDTO = new ClassDTO();
			classDTO.setFilePath(savedName);
			classDTO.setOrgFilePath(originFileName);
			classDTO.setClassCode(classCode);

			if (classRoomService.modifyClassFile(classDTO) > 0) {
				rttr.addFlashAttribute("uploadMessage", "썸네일 이미지를 변경했습니다.");
			}
			System.out.println("성공!");
		} else {
			rttr.addFlashAttribute("uploadMessage", "썸네일 이미지 변경에 실패했습니다.");
		}

		return "redirect:/jandi/class/classRoom?classCode=" + classCode;
	}

	/**
	 * 목차 삭제
	 * @param mokchaCode
	 * @param session
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("deleteMokcha")
	public String deleteMokcha(@RequestParam int mokchaCode, HttpSession session) {
		// 해당 목차 코드의 목차 내용과 목차 파일을 삭제 상태로 변경
		if (classRoomService.modifyLectureIsDeleted(mokchaCode)
				&& classRoomService.modifyLectureFileIsDeleted(mokchaCode)) {
			
			// 해당 목차 파일 리스트 조회하기
			List<ClassFileDTO> mokchaFileList = classRoomService.selectMokchaFileListByMokchaCode(mokchaCode);
			
			/* 해당 파일 삭제 하기 */
			String root = session.getServletContext().getRealPath("resources");
			for (ClassFileDTO classFile : mokchaFileList) {
				new File(root + classFile.getFilePath()).delete();
			}
		}
		return "redirect:/jandi/class/classLecture";
	}

	/**
	 * 학습방 게시물 삭제
	 * @param postCode
	 * @param session
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("deleteLearnigPost")
	public String deleteLearnigPost(@RequestParam int postCode, HttpSession session) {
		// 해당 게시물 코드의 게시물 내용과 게시물 파일을 삭제 상태로 변경
		if (classRoomService.modifyLearnigPostIsDeleted(postCode)
				&& classRoomService.modifyLearningFileIsDeleted(postCode)) {
			
			// 해당 게시물 파일 목록 가져오기
			List<ClassFileDTO> learningFileList = classRoomService.selectLearningFileListByPostCode(postCode);

			// 해당 게시물 파일 전부 삭제
			String root = session.getServletContext().getRealPath("resources");
			for (ClassFileDTO classFile : learningFileList) {
				new File(root + classFile.getFilePath()).delete();
			}
		}
		return "redirect:/jandi/class/classLearningBoard";
	}
	
	/**
	 * 채팅방에 이미지 업로드
	 * @param multipartRequest
	 * @param request
	 * @param response
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("chatFileUpload")
	public @ResponseBody Map<String, String> chatFileUpload(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response ) {

		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();
		
		MultipartFile file = multipartRequest.getFile("sendFile");
		
		// 파일 , 파라미터 확인
		System.out.println("file : " + file.getOriginalFilename());

		// 파일 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String dir = "/uploadFiles/chatFile/";
		String filePath = root + dir;

		// 파일명 변경처리
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;

		Map<String, String> chatFileMap = null;
		
		// 파일 저장
		if (fileWrapper.uploadSingleFile(file, savedName, filePath)) {

			chatFileMap = new HashMap<String, String>();

			chatFileMap.put("savedName", savedName);
			chatFileMap.put("ext", ext);
			chatFileMap.put("originFileName", originFileName);
			
			System.out.println("성공!");
		} else {
			
		}
		
		return chatFileMap;
		
	}
	
	/**
	 * 클래스 신청 - 카카오 페이 결제
	 * @param email
	 * @param request
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("purchaseClass")
	@ResponseBody
	public String purchaseClass(@RequestParam String email, HttpServletRequest request) {
		// 파라미터 값 확인
		System.out.println(email);
		System.out.println(request.getContextPath());
		
		// 결제할 클래스 정보 가져오기
		ClassDTO classDTO = (ClassDTO) request.getSession().getAttribute("classDTO");
		
		String returnMessage = "결제에 실패했습니다.";
		try {
			// 카카오 URL갔다가 돌어올  url설정 
			String localPath = "http://localhost:8585" + request.getContextPath();
			// 카카오 url 연결
			URL kakaoUrl = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection urlConnection = (HttpURLConnection)kakaoUrl.openConnection();
			
			/* 연결된 url 설정하기 */
			urlConnection.setRequestMethod("POST");
			// 인증토큰, content-type 설정
			urlConnection.setRequestProperty("Authorization", "KakaoAK b4ca33fb39dc934a8fe5ce28a439ef6e");
			urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			urlConnection.setDoOutput(true);
			
			// 요청 보낼 파라미터값 설정
			String cid = "cid=TC0ONETIME";
			String classCode = "&partner_order_id=" + classDTO.getClassCode();
			String ssackEmail = "&partner_user_id=" + email;
			String className = "&item_name=" + classDTO.getTitle();
			String amount = "&total_amount=" + classDTO.getPrice();
			String parameters = cid + classCode + ssackEmail + className + amount + "&quantity=1&tax_free_amount=0"
					+ "&approval_url=" + localPath + "/member/class/purchaseClass/success"
					+ "&fail_url=" + localPath + "/member/class/purchaseClass/fail"
					+ "&cancel_url=" + localPath + "/member/class/purchaseClass/cancel";
			
			//해당 url 요청을 byte 스트림으로 변환 후 요청
			DataOutputStream dos = new DataOutputStream(urlConnection.getOutputStream());
			dos.write(parameters.getBytes("UTF-8"));
			dos.flush();
			dos.close();
			
			// 해당 응답 코드 받기
			int result = urlConnection.getResponseCode();
			
			/* 응답 코드가 200이면 성공으로 url의 inputStream을 저장, 아니면 errorStream을 저장 */
			InputStream is = null;
			if(result == 200) {
				is = urlConnection.getInputStream(); 
			}else {
				is = urlConnection.getErrorStream();
			}
			
			// 받은 inputStream을 UTF-8로 인코딩해서 버퍼로 읽기
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			
			// 버퍼의 내용 저장
			returnMessage = br.readLine();
			System.out.println(returnMessage);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return returnMessage;
	}
	
	/**
	 * 카카오 페이 성공시 요청
	 * @param session
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("purchaseClass/success")
	public String purchaseClassSucceess(HttpSession session, RedirectAttributes rttr) {
		
		//로그인한 사용자와 결제 클래스 정보 가져오기
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		ClassDTO classDTO = (ClassDTO) session.getAttribute("classDTO");
		System.out.println("***********" + classDTO);
		
		// 결제DTO에 담기
		PaymentDTO payment = new PaymentDTO();
		payment.setPayType("class");
		payment.setOwner(member.getName());
		payment.setAccount(member.getPhone());
		payment.setBank("카카오페이");
		payment.setPay(classDTO.getPrice());
		
		// 클래스 구매내역DTO에 담기
		ClassPurchaseDTO classPurchase = new ClassPurchaseDTO();
		classPurchase.setClassCode(classDTO.getClassCode());
		classPurchase.setEmail(member.getEmail());
		// 결제 DTO
		classPurchase.setPayment(payment);
		
		String purchaseMessage = "N";
		/* 클래스구매내역 DTO로 클래스 구매내역과 결제내역 인서트 */
		if(classRoomService.registPurchaseClass(classPurchase)) {
			
			/* 클래스 결제를 하면 채팅방도 동시에 생성되는 로직이기 때문에 해당 클래스를 재 결제하는 경우,
			 * 기존에 채팅방이 있는데 중복 되는 경우가 발생하기 떄문에 채팅방이 있는지 검사한다.
			 * 만약 채팅방이 있다면 재결제하는 것이므로 채팅방을 생성하지 않고 조회된 결과가 없으면 채팅방을 생성한다. */
			
			// 조회할 값을 맵에 저장
			HashMap<String, Object> chatRoomMap = new HashMap<>();
			chatRoomMap.put("email", member.getEmail());
			chatRoomMap.put("jandiEmail", classDTO.getEmail());
			chatRoomMap.put("classCode", classDTO.getClassCode());
			System.out.println(chatRoomMap);
			
			// 해당 클래스에 로그인한 사용자의 채팅방이 있는지 조회
			HashMap<String, Object> chatCodeMap = classRoomService.selectClassChatBySSACKEmail(chatRoomMap);
			
			if(chatCodeMap != null) {
				// 채팅방이 있으면 
				purchaseMessage = "Y";
			}else {
				// 채팅 방이 없으면 인서트
				if(classRoomService.registChatRoom(chatRoomMap)) {
					purchaseMessage = "Y";
				}else {
					purchaseMessage = "N";
				}
			}
		}else { // 클래스구매내역 DTO로 클래스 구매내역과 결제내역 인서트 실패시
			purchaseMessage = "N";
		}
		
		rttr.addFlashAttribute("purchaseMessage", purchaseMessage);
		return "redirect:/findclass/class/classRoom?classCode=" + session.getAttribute("classCode");
	}
	
	/**
	 * 카카오 결제 실패시 요청
	 * @param session
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping("purchaseClass/fail")
	public String purchaseClassFail(HttpSession session, RedirectAttributes rttr) {
		rttr.addFlashAttribute("purchaseMessage", "N");
		return "redirect:/findclass/class/classRoom?classCode=" + session.getAttribute("classCode");
	}
	
	/**
	 * 카카오 결제 취소시 요청
	 * @param session
	 * @param rttr
	 * @return
	 */
	@GetMapping("purchaseClass/cancel")
	public String purchaseClassCancel(HttpSession session, RedirectAttributes rttr) {
		rttr.addFlashAttribute("purchaseMessage", "C");
		return "redirect:/findclass/class/classRoom?classCode=" + session.getAttribute("classCode");
	}
	
	/**
	 * 회원 신고 하기
	 * @param multipartRequest
	 * @param request
	 * @param rttr
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping("reportMember")
	public String reportMember(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, RedirectAttributes rttr) {

		// 파라미터 저장
		MultipartFile file = multipartRequest.getFile("repImage");
		ReportMemberDTO reportMember = new ReportMemberDTO();
		reportMember.setContents(request.getParameter("repContents"));
		reportMember.setRepTypeCode(Integer.parseInt(request.getParameter("repTypeCode")));
		reportMember.setRepEmail(request.getParameter("repEmail"));
		reportMember.setEmail(((MemberDTO)request.getSession().getAttribute("loginMember")).getEmail());
		
		String result = "";
		
		if(!file.isEmpty()){
			// 파일 저장 객체(따로 뺌)
			FileWrapper fileWrapper = new FileWrapper();
			
			// 파일 , 파라미터 확인
			System.out.println("file : " + file.getOriginalFilename());
			
			// 파일 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			String dir = "/uploadFiles/reportFiles/";
			String filePath = root + dir;
			
			// 파일명 변경처리
			String originFileName = file.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
			
			// 파일 저장에에 성공하면 데이터베이스에 인서트
			if (fileWrapper.uploadSingleFile(file, savedName, filePath)) {
				
				System.out.println("파일 업로드 성공!");
				
				reportMember.setImgPath(savedName);
				reportMember.setOrgImgPath(originFileName);
				
				if(classRoomService.registReportMember(reportMember)) { 
					result="신고 접수가 완료되었습니다. 감사합니다.";	}
				else { 
					result="신고에 실패했습니다."; }
				
			} else {
				return "신고에 실패했습니다.";
			}
		}else {
			if(classRoomService.registReportMember(reportMember)) { 
				result="신고 접수가 완료되었습니다. 감사합니다.";	}
			else { 
				result="신고에 실패했습니다."; }
		}
		
		String requestUri = request.getRequestURI();
		String intent = requestUri.replace(request.getContextPath(), "");
		intent = intent.substring(1, intent.indexOf("/", 1));
		
		rttr.addFlashAttribute("reportSuccessMessage", result );
		
		return "redirect:/" + intent + "/class/"+ intent +"ClassChat";
		
	}
	
	/**
	 * @param model
	 * @param classCode
	 * @param session
	 * @return
	 */
	@GetMapping("viewsUp")
	public String viewsUp(Model model, @RequestParam String classCode, HttpSession session) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		System.out.println("받아온 클래스 코드 : " + classCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("classCode", classCode);
		
		if(member != null) {
			System.out.println("현재 로그인 상태인 이메일 : " + member.getEmail());
			map.put("email", member.getEmail());
		}
		
		boolean viewsUp = classRoomService.viewsUp(map);
		
		if(viewsUp) {
			System.out.println(classCode + "번 클래스의 조회수가 업데이트 되었습니다.");
			return "redirect:/findclass/class/classRoom?classCode=" + classCode;
		} else {
			System.out.println(classCode + "번 클래스를 운영하는 잔디의 계정으로는 조회수가 올라가지 않습니다.");
			return "redirect:/findclass/class/classRoom?classCode=" + classCode;
		}
		
	}
	
	/**
	 * 클래스 신고 메소드
	 * 
	 * @param repContents
	 * @param repTypeCode
	 * @param session
	 * @return
	 * 
	 * @author 임예람
	 */
	@PostMapping(value="reportClass",  produces = "application/text; charset=utf8")
	@ResponseBody
	public String reportClass(@RequestParam String repContents, @RequestParam int repTypeCode, HttpSession session) {

		// 신고 클래스  DB에 저장할 값들을 맵에 저장
		Map<String, Object> reportClassMap = new HashMap<String, Object>();
		reportClassMap.put("repContents", repContents);
		reportClassMap.put("repTypeCode", repTypeCode);
		reportClassMap.put("repClass", ((ClassDTO)session.getAttribute("classDTO")).getClassCode());
		reportClassMap.put("email", ((MemberDTO)session.getAttribute("loginMember")).getEmail());
		
		String result = "";
		
		if(classRoomService.registReportClass(reportClassMap)) {
			result = "신고 접수가 완료되었습니다. 감사합니다.";
		}else {
			result = "신고 접수에 실패했습니다.";
		}
		
		return result;
	}
	
	/**
	 * 클래스 찜하기
	 * 
	 * @param session
	 * @param status
	 * @param model
	 * @return
	 * 
	 * @author 임예람
	 */
	@GetMapping(value="jjimClass",  produces = "application/text; charset=utf8")
	@ResponseBody
	public String jjimClass(HttpSession session, @RequestParam String status, Model model) {
		// 찜할 클래스 코드와 로그인한 사용자의 이메일 가져오기
		int classCode = (int) session.getAttribute("classCode");
		String email = ((MemberDTO) session.getAttribute("loginMember")).getEmail();
		
		// 맵에 저장
		Map<String, Object> jjimMap = new HashMap<String, Object>();
		jjimMap.put("classCode", classCode);
		jjimMap.put("email", email);
		
		String result = "";
		
		/* jsp에서 클래스를 이미 찜한 경우라면 Y를 넘겨주고, 찜하지 않은 경우라면 N을 넘겨준다.
		 * 따라서 status가 Y면 찜을 해제하고 상태값을 N으로 바꿔주고,
		 * status가 N이면 찜을 하고 상태값을 Y로 바꿔준다.*/
		switch(status) {
		case "Y" : 
			if(classRoomService.removeLikedClass(jjimMap)) {
				result = "N";
			}else {
				result= "Y";
			}
			break;
		case "N" : 
			if(classRoomService.registLikedClass(jjimMap)) {
				result = "Y";
			}else {
				result= "N";
			}
			break;
		}
		model.addAttribute("jjimClassMemberList", classRoomService.selectJJimClassMemberList(classCode));
		return result;
	}
	
}
