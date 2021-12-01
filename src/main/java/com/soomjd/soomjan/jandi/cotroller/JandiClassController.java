package com.soomjd.soomjan.jandi.cotroller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soomjd.soomjan.classes.model.dto.ClassDTO;
import com.soomjd.soomjan.jandi.model.service.JandiClassService;


@Controller
@RequestMapping("jandi/class/*")
@SessionAttributes({"currentCount", "classCode", "classDTO"})
public class JandiClassController {
	
	private final JandiClassService jandiClassService;
	
	@Autowired
	public JandiClassController(JandiClassService jandiClassService) {
		this.jandiClassService = jandiClassService;
	}
	
	@GetMapping("classRoom/{classCode}")
	public String classRoom(Model model, @PathVariable int classCode) {
		
		model.addAttribute("classCode", classCode);
		System.out.println("classCode : " + classCode);
		
		model.addAttribute("classDTO", jandiClassService.selectClassByClassCode(classCode));
		model.addAttribute("currentCount", jandiClassService.selectCurrentCount(classCode));
		
		return "jandi/class/classRoom";
	}
	
	@GetMapping("classLecture")
	public String classLecture(Model model) {
		
		int classCode = (int) model.getAttribute("classCode");
		System.out.println(classCode);
		
		model.addAttribute("mokchaList", jandiClassService.selectMokchaList(classCode));
		
		return "jandi/class/classLecture";
	}
	
	@GetMapping("classLearningBoard")
	public String classLearningBoard(Model model) {
		
		int classCode = (int) model.getAttribute("classCode");
		model.addAttribute("learningPostList", jandiClassService.selectLearningPostList(classCode));
		
		return "jandi/class/classLearningBoard";
	}
	
	@GetMapping("classLearningPost/{postCode}")
	public String classLearningPost(Model model, @PathVariable int postCode) {
		
		return "jandi/class/classLearningPost";
	}
	
	@GetMapping("classChat")
	public String classChat(Model model) {
		
		int classCode = (int) model.getAttribute("classCode");
		String email = ((ClassDTO)model.getAttribute("classDTO")).getEmail();
		System.out.println(email);
		
		HashMap<String, Object> chatRoomMap = new HashMap<String, Object>();
		chatRoomMap.put("classCode", classCode);
		chatRoomMap.put("email", email);
		
		model.addAttribute("chatRoomList", jandiClassService.selectChatRoomList(chatRoomMap));
		
		return "jandi/class/classChat";
	}
	

}