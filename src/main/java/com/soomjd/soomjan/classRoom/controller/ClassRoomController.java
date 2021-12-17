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
import com.soomjd.soomjan.classRoom.model.service.ClassRoomService;
import com.soomjd.soomjan.common.fileWrapper.FileWrapper;
import com.soomjd.soomjan.common.paging.Pagenation;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;


@Controller
@RequestMapping("/*/class/*")
@SessionAttributes({ "currentCount", "classCode", "classDTO", "jandi", "selectCriteria", "currentMemberList"})
public class ClassRoomController{

	private final ClassRoomService classRoomService;

	@Autowired
	public ClassRoomController(ClassRoomService classRoomService) {
		this.classRoomService = classRoomService;
	}

	@GetMapping("classLecture")
	public void classLecture(Model model) {

		int classCode = (int) model.getAttribute("classCode");
		System.out.println(classCode);

		model.addAttribute("mokchaList", classRoomService.selectMokchaList(classCode));
		model.addAttribute("mokchaFileList", classRoomService.selectMokchaFileList(classCode));

	}

	@GetMapping("classLearningBoard")
	public void classLearningBoard(Model model, @RequestParam(defaultValue = "1") int currentPage) {

		int classCode = (int) model.getAttribute("classCode");
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("classCode", classCode);
		System.out.println("searchMap : " + searchMap);
		
		int totalCount = classRoomService.selectLearningBoardTotalCount(searchMap);
		System.out.println("totalCount : " + totalCount);
		
		int limit = 10;
		int buttonAmount = 5;
		
		SelectCriteria selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		
		Map<String, Object> learningMap = new HashMap<>();
		learningMap.put("selectCriteria", selectCriteria);
		learningMap.put("classCode", classCode);
		System.out.println("learningMap : " + learningMap);
		
		List<LearningPostDTO> learningList = classRoomService.selectLearningBoardList(learningMap);
		System.out.println("learningList : " + learningList);
		
		model.addAttribute("learningList", learningList);
		model.addAttribute("selectCriteria", selectCriteria);
		model.addAttribute("learningPostList", classRoomService.selectLearningPostList(classCode));

	}

	@GetMapping("classLearningPost")
	public void classLearningPost(Model model, @RequestParam int postCode) {

		System.out.println("postCode : " + postCode);

		model.addAttribute("learnigPost", classRoomService.selectPostByPostCode(postCode));
		model.addAttribute("learnigFileList", classRoomService.selectLearningFileList(postCode));

	}

	@GetMapping("jandiClassChat")
	public String jandiClassChat(Model model) {

		int classCode = (int) model.getAttribute("classCode");
		String email = ((ClassDTO) model.getAttribute("classDTO")).getEmail();
		System.out.println(email);
		
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		List<Map<String, Object>> chatRoomList = classRoomService.selectChatRoomList(chatRoomMap);
		System.out.println(chatRoomList);
		
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("reportStateList", classRoomService.selectAllReportStatement());

		return "jandi/class/classChat";
	}
	
	@GetMapping("mypageClassChat")
	public String mypageClassChat(Model model, HttpSession session) {
		
		int classCode = (int) model.getAttribute("classCode");
		String email = ((MemberDTO) session.getAttribute("loginMember")).getEmail();
		System.out.println(email);
		
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		int chatCode = classRoomService.selectClassChatBySSACKEmail(chatRoomMap);
		System.out.println("chatCode : " + chatCode);
		
		model.addAttribute("chatCode", chatCode);
		model.addAttribute("reportStateList", classRoomService.selectAllReportStatement());
		
		return "mypage/class/classChat";
	}

	@PostMapping("createClass")
	public String createClass(@RequestParam Map<String, Object> classMap, HttpSession session) {
		JandiDTO jandi = (JandiDTO) session.getAttribute("jandi");

		System.out.println(jandi.getEmail() + ":  " + classMap);

		int categoryCode = Integer.parseInt(classMap.get("categoryCode").toString());
		int maxCount = Integer.parseInt(classMap.get("maxCount").toString());
		int price = Integer.parseInt(classMap.get("price").toString());

		ClassDTO classDTO = new ClassDTO(categoryCode, maxCount, price, classMap.get("title").toString(),
				jandi.getEmail());

		int classCode = 0;
		if (classRoomService.registClass(classDTO) > 0) {
			classCode = classRoomService.selectClassCode(jandi.getEmail());
			session.setAttribute("classList", classRoomService.selectClassCodeList(jandi.getEmail()));
		}
		return classCode > 0 ? "redirect:/jandi/class/classRoom?classCode=" + classCode
				: "redirect:/jandi/jandiProfile";
	}

	@GetMapping("deleteClass")
	public String deleteClass(Model model) {
		int classCode = (int) model.getAttribute("classCode");
		if (classRoomService.deleteClass(classCode) > 0) {

		}
		return "redirect:/jandi/jandiProfile";
	}

	@PostMapping("modifyClass")
	public String modifyClass(Model model, RedirectAttributes rttr, @RequestParam String contents,
			@RequestParam String tag) {

		System.out.println("contents : " + contents);
		System.out.println("tag : " + tag);

		int classCode = (int) model.getAttribute("classCode");

		ClassDTO classDTO = new ClassDTO();
		classDTO.setClassCode(classCode);
		classDTO.setContents(contents);
		classDTO.setTag(tag);

		if (classRoomService.modifyClass(classDTO) > 0) {
			rttr.addFlashAttribute("modifyMessage", "수정에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("modifyMessage", "수정에 실패했습니다.");
		}

		return "redirect:/jandi/class/classRoom?classCode=" + classCode;
	}

	@PostMapping("registLecture")
	public String registLecture(HttpServletRequest request, Model model, RedirectAttributes rttr) {

		// 목차내용
		int classCode = (int) model.getAttribute("classCode");
		System.out.println(request.getParameter("mockchaName"));
		System.out.println(request.getParameter("contents"));

		MokchaDTO mokcha = new MokchaDTO();
		mokcha.setMokchaName(request.getParameter("mockchaName"));
		mokcha.setContents(request.getParameter("contents"));
		mokcha.setClassCode(classCode);

		if (classRoomService.registLecture(mokcha) > 0) {
			rttr.addFlashAttribute("modifyMessage", "목차를 추가했습니다.");
		} else {
			rttr.addFlashAttribute("modifyMessage", "목차 추가에 실패했습니다.");
		}
		return "redirect:/jandi/class/classLecture";
	}

	@PostMapping("uploadMokchaFile")
	public String uploadMokchaFile(@RequestParam MultipartFile file, @RequestParam int mokchaCode, HttpSession session,
			RedirectAttributes rttr) {

		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();

		// 파일 , 파라미터 확인
		System.out.println("file : " + file.getOriginalFilename());
		System.out.println("mokchaCode : " + mokchaCode);

		// 파일 경로 설정
		String root = session.getServletContext().getRealPath("resources");
		String dir = "/lectureFiles/videos";
		String filePath = root + dir;

		// 파일명 변경처리
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;

		// 파일 저장
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

	@GetMapping("registLearningPost")
	public String registLearningPost(Model model) {

		LearningPostDTO learningPost = new LearningPostDTO();
		learningPost.setEmail(((JandiDTO) model.getAttribute("jandi")).getEmail());
		learningPost.setClassCode((int) model.getAttribute("classCode"));

		System.out.println("learning: " + learningPost);

		int postCode = 0;

		if (classRoomService.registLearnigPost(learningPost)) {
			postCode = classRoomService.selectNewPostCode(learningPost);
		}

		return "redirect:/jandi/class/classLearningPost?postCode=" + postCode;
	}

	@PostMapping("modifyLearnigPost")
	public String modifyLearnigPost(Model model, RedirectAttributes rttr, @RequestParam String contents,
			@RequestParam String title, @RequestParam int postCode) {

		System.out.println("contents : " + contents);
		System.out.println("title : " + title);
		System.out.println("postCode : " + postCode);

		LearningPostDTO learningPost = new LearningPostDTO();
		learningPost.setTitle(title);
		learningPost.setContents(contents);
		learningPost.setPostCode(postCode);

		if (classRoomService.modifyLearnigPost(learningPost) > 0) {
			rttr.addFlashAttribute("modifyMessage", "수정에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("modifyMessage", "수정에 실패했습니다.");
		}

		return "redirect:/jandi/class/classLearningPost?postCode=" + postCode;

	}

	@PostMapping("uploadLearningFile")
	public String uploadLearningFile(@RequestParam MultipartFile file, @RequestParam int postCode, HttpSession session,
			RedirectAttributes rttr) {

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

		
		//파일 저장 
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
		 

		return (member.getEmail().equals(classDTO.getEmail()))
				? "redirect:/jandi/class/classLearningPost?postCode=" + postCode
				: "redirect:/mypage/class/classLearningPost?postCode=" + postCode;
	}

	@GetMapping("*/download")
	public void download(HttpServletRequest request, HttpServletResponse response) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = request.getParameter("filePath");
		String originFileName = request.getParameter("fileName");
		// 파일 저장 객체(따로 뺌)
		FileWrapper fileWrapper = new FileWrapper();
		File file = new File(root + filePath);
		System.out.println(file.getName());

		try {
			// 파일을 UTF-8로 변환 (한국어 깨짐 방지)
			originFileName = new String(originFileName.getBytes("UTF-8"), "iso-8859-1");
			response.setHeader("Content-type", "application/octet-stream; charset=UTF-8");
			response.setHeader("Content-Disposition", "filename=" + originFileName);

			if (fileWrapper.downloadSingleFile(file, response.getOutputStream())) {
				System.out.println("다운로드 성공");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

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

		// 파일 저장
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

	@PostMapping("deleteMokcha")
	public String deleteMokcha(@RequestParam int mokchaCode, HttpSession session) {

		System.out.println("mokchaCode: " + mokchaCode);

		if (classRoomService.modifyLectureIsDeleted(mokchaCode)
				&& classRoomService.modifyLectureFileIsDeleted(mokchaCode)) {
			List<ClassFileDTO> mokchaFileList = classRoomService.selectMokchaFileListByMokchaCode(mokchaCode);

			String root = session.getServletContext().getRealPath("resources");

			for (ClassFileDTO classFile : mokchaFileList) {
				new File(root + classFile.getFilePath()).delete();
			}
		}
		return "redirect:/jandi/class/classLecture";
	}

	@PostMapping("deleteLearnigPost")
	public String deleteLearnigPost(@RequestParam int postCode, HttpSession session) {

		System.out.println("postCode: " + postCode);

		if (classRoomService.modifyLearnigPostIsDeleted(postCode)
				&& classRoomService.modifyLearningFileIsDeleted(postCode)) {
			List<ClassFileDTO> learningFileList = classRoomService.selectLearningFileListByPostCode(postCode);

			String root = session.getServletContext().getRealPath("resources");

			for (ClassFileDTO classFile : learningFileList) {
				new File(root + classFile.getFilePath()).delete();
			}
		}
		return "redirect:/jandi/class/classLearningBoard";
	}
	
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
	
	@PostMapping("purchaseClass")
	@ResponseBody
	public String purchaseClass(@RequestParam String email, HttpServletRequest request) {
		System.out.println(email);
		System.out.println(request.getContextPath());
		
		ClassDTO classDTO = (ClassDTO) request.getSession().getAttribute("classDTO");
		String returnMessage = "결제에 실패했습니다.";
		
		try {
			String localPath = "http://localhost:8585" + request.getContextPath();
			URL kakaoUrl = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection urlConnection = (HttpURLConnection)kakaoUrl.openConnection();
			
			urlConnection.setRequestMethod("POST");
			urlConnection.setRequestProperty("Authorization", "KakaoAK b4ca33fb39dc934a8fe5ce28a439ef6e");
			urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			urlConnection.setDoOutput(true);
			
			String cid = "cid=TC0ONETIME";
			String classCode = "&partner_order_id=" + classDTO.getClassCode();
			String ssackEmail = "&partner_user_id=" + email;
			String className = "&item_name=" + classDTO.getTitle();
			String amount = "&total_amount=" + classDTO.getPrice();
			String parameters = cid + classCode + ssackEmail + className + amount + "&quantity=1&tax_free_amount=0"
					+ "&approval_url=" + localPath + "/member/class/purchaseClass/success"
					+ "&fail_url=" + localPath + "/member/class/purchaseClass/fail"
					+ "&cancel_url=" + localPath + "/member/class/purchaseClass/cancel";
			
			DataOutputStream dos = new DataOutputStream(urlConnection.getOutputStream());
			dos.write(parameters.getBytes("UTF-8"));
			dos.flush();
			dos.close();
			
			int result = urlConnection.getResponseCode();
			InputStream is = null;
			
			if(result == 200) {
				is = urlConnection.getInputStream(); 
			}else {
				is = urlConnection.getErrorStream();
			}
			
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			
			returnMessage = br.readLine();
			System.out.println(returnMessage);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return returnMessage;
	}
	
	@GetMapping("purchaseClass/success")
	public String purchaseClassSucceess(HttpSession session, RedirectAttributes rttr) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		ClassDTO classDTO = (ClassDTO) session.getAttribute("classDTO");
		System.out.println("***********" + classDTO);
		
		PaymentDTO payment = new PaymentDTO();
		payment.setPayType("class");
		payment.setOwner(member.getName());
		payment.setAccount(member.getPhone());
		payment.setBank("카카오페이");
		payment.setPay(classDTO.getPrice());
		
		ClassPurchaseDTO classPurchase = new ClassPurchaseDTO();
		classPurchase.setClassCode(classDTO.getClassCode());
		classPurchase.setEmail(member.getEmail());
		classPurchase.setPayment(payment);
		
		String purchaseMessage = "N";
		
		if(classRoomService.registPurchaseClass(classPurchase)) {
			
			HashMap<String, Object> chatRoomMap = new HashMap<>();
			chatRoomMap.put("email", member.getEmail());
			chatRoomMap.put("jandiEmail", classDTO.getEmail());
			chatRoomMap.put("classCode", classDTO.getClassCode());
			System.out.println(chatRoomMap);

			if(classRoomService.selectClassChatBySSACKEmail(chatRoomMap) > 0) {
				purchaseMessage = "Y";
			}else {
				if(classRoomService.registChatRoom(chatRoomMap)) {
					purchaseMessage = "Y";
				}else {
					purchaseMessage = "N";
				}
			}
		}else {
			purchaseMessage = "N";
		}
		
		rttr.addFlashAttribute("purchaseMessage", purchaseMessage);
		return "redirect:/findclass/class/classRoom?classCode=" + session.getAttribute("classCode");
	}
	
	@GetMapping("purchaseClass/fail")
	public String purchaseClassFail(HttpSession session, RedirectAttributes rttr) {
		rttr.addFlashAttribute("purchaseMessage", "N");
		return "redirect:/findclass/class/classRoom?classCode=" + session.getAttribute("classCode");
	}
	
	@GetMapping("purchaseClass/cancel")
	public String purchaseClassCancel(HttpSession session, RedirectAttributes rttr) {
		rttr.addFlashAttribute("purchaseMessage", "C");
		return "redirect:/findclass/class/classRoom?classCode=" + session.getAttribute("classCode");
	}
	
	@PostMapping("reportMember")
	public String reportMember(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, RedirectAttributes rttr) {

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
			
			// 파일 저장
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
	
}
