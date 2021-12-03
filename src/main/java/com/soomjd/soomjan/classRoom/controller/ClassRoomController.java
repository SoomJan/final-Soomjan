package com.soomjd.soomjan.classRoom.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;
import com.soomjd.soomjan.classRoom.model.service.ClassRoomService;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

@Controller
@RequestMapping("/*/class/*")
@SessionAttributes({"currentCount", "classCode", "classDTO"})
public class ClassRoomController {
	
private final ClassRoomService classRoomService;
	
	@Autowired
	public ClassRoomController(ClassRoomService classRoomService) {
		this.classRoomService = classRoomService;
	}
	
	@GetMapping("classRoom")
	public void classRoom(Model model, @RequestParam int classCode) {
		
		model.addAttribute("classCode", classCode);
		System.out.println("classCode : " + classCode);
		
		model.addAttribute("classDTO", classRoomService.selectClassByClassCode(classCode));
		model.addAttribute("currentCount", classRoomService.selectCurrentCount(classCode));
		model.addAttribute("mokchaList", classRoomService.selectMokchaList(classCode));
		
	}
	
	@GetMapping("classLecture")
	public void classLecture(Model model) {
		
		int classCode = (int) model.getAttribute("classCode");
		System.out.println(classCode);
		
		model.addAttribute("mokchaList", classRoomService.selectMokchaList(classCode));
		
	}
	
	@GetMapping("classLearningBoard")
	public void classLearningBoard(Model model) {
		
		int classCode = (int) model.getAttribute("classCode");
		model.addAttribute("learningPostList", classRoomService.selectLearningPostList(classCode));
		
	}
	
	@GetMapping("classLearningPost")
	public void classLearningPost(Model model, @RequestParam int postCode) {
		
		System.out.println("postCode : " + postCode);
		
		model.addAttribute("learnigPost", classRoomService.selectPostByPostCode(postCode));
		model.addAttribute("learnigFileList", classRoomService.selectLearningFileList(postCode));
		
	}
	
	@GetMapping("classChat")
	public void classChat(Model model) {
		
		int classCode = (int) model.getAttribute("classCode");
		String email = ((ClassDTO)model.getAttribute("classDTO")).getEmail();
		System.out.println(email);
		
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		model.addAttribute("chatRoomList", classRoomService.selectChatRoomList(chatRoomMap));
		
	}
	
	@GetMapping("classChat/{chatCode}")
	public String classChatEnter(Model model, @PathVariable int chatCode) {
		
		int classCode = (int) model.getAttribute("classCode");
		String email = ((ClassDTO)model.getAttribute("classDTO")).getEmail();
		System.out.println(email);
		
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		model.addAttribute("chatRoomList", classRoomService.selectChatRoomList(chatRoomMap));
		
		
		return "jandi/class/chat";
	}
	
	@PostMapping("createClass")
	public String createClass(@RequestParam Map<String, Object> classMap , HttpSession session) {
		JandiDTO jandi = (JandiDTO)session.getAttribute("jandi");
		
		System.out.println(jandi.getEmail() + ":  " + classMap);
		
		int categoryCode = Integer.parseInt(classMap.get("categoryCode").toString());
		int maxCount = Integer.parseInt(classMap.get("maxCount").toString());
		int price = Integer.parseInt(classMap.get("price").toString());
		
		ClassDTO classDTO = new ClassDTO(categoryCode, maxCount, price, classMap.get("title").toString(), jandi.getEmail());
		
		int classCode = 0;
		if(classRoomService.registClass(classDTO) > 0) {
			classCode = classRoomService.selectClassCode(jandi.getEmail());
			session.setAttribute("classList", classRoomService.selectClassCodeList(jandi.getEmail()));
		}
		return classCode > 0 ? "redirect:/jandi/class/classRoom?classCode=" + classCode : "redirect:/jandi/jandiProfile";
	}
	
	@GetMapping("deleteClass")
	public String deleteClass(Model model) {
		int classCode = (int) model.getAttribute("classCode");
		if(classRoomService.deleteClass(classCode) > 0) {
			
		}
		return "redirect:/jandi/jandiProfile";
	}
	
	@PostMapping("modifyClass")
	public String modifyClass(Model model, RedirectAttributes rttr, @RequestParam String contents, @RequestParam String tag) {
		
		System.out.println("contents : " + contents);
		System.out.println("tag : " + tag);
		
		int classCode = (int) model.getAttribute("classCode");
		
		ClassDTO classDTO = new ClassDTO();
		classDTO.setClassCode(classCode);
		classDTO.setContents(contents);
		classDTO.setTag(tag);
		
		if(classRoomService.modifyClass(classDTO) > 0) {
			rttr.addFlashAttribute("modifyMessage", "수정에 성공했습니다.");
		}else {
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
		
		if(classRoomService.registLecture(mokcha) > 0) {
			rttr.addFlashAttribute("modifyMessage", "목차를 추가했습니다.");
		}else {
			rttr.addFlashAttribute("modifyMessage", "목차 추가에 실패했습니다.");
		}
		return "redirect:/jandi/class/classLecture";
	}
	
	@PostMapping("uploadMokchaFile")
	public String uploadMokchaFile(@RequestParam MultipartFile file, Model model, RedirectAttributes rttr, HttpServletRequest request) {
		
		// 파일
		System.out.println("file : " +  file);
		
		String root = "http://125.132.252.115:21//C://soomjd";
		String filePath = root + "//lectureFiles";
		
		File mkdir = new File(filePath);
		if(!mkdir.exists()) { mkdir.mkdirs(); }
		
		// 파일명 변경처리
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
		
		ClassFileDTO classFile = null;
		
		//파일 저장
		try {
			file.transferTo(new File(filePath + "\\" + savedName));
			System.out.println("파일 업로드 성공");
			
			classFile = new ClassFileDTO();
			JandiDTO jandi = (JandiDTO) request.getSession().getAttribute("jandi");
			classFile.setEmail(jandi.getEmail());
			classFile.setFilePath(filePath);
			classFile.setOrgFilePath(originFileName);
			
			if(classRoomService.registLectureFile(classFile) > 0) {
			}else {
			}

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			new File(filePath + "\\" + savedName).delete();
			System.out.println("파일 업로드 실패");
		}
		
		return "";
	}
	
}
