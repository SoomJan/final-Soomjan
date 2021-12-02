package com.soomjd.soomjan.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.service.ManagerService;

@Controller
@RequestMapping("/manager/*")
@SessionAttributes("loginManager")
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
	
	@GetMapping("/mentilist")
	public String mentilist() {
		
		return "manager/mentilist";
	}
	
	@GetMapping("/mentolist")
	public String mentolist() {
		
		return "manager/mentolist";
	}
	
	@GetMapping("/manproduce")
	public String manproduce() {
		
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
	
	
	
}
