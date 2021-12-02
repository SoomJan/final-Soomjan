package com.soomjd.soomjan.jandi.cotroller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.jandi.model.service.JandiService;

@Controller
@RequestMapping("/jandi/*")
@SessionAttributes("jandi")
public class JandiController {
	
	private final JandiService jandiService;
	
	@Autowired
	public JandiController(JandiService jandiService) {
		this.jandiService = jandiService;
	}
	
	@GetMapping("/jandiProfile")
	public String jandiProfile(Model model){
		String email = "ram@gmail.com";
		JandiDTO jandi = jandiService.selectJandi(email);
		
		model.addAttribute("jandi", jandi.getEmail());
		
		System.out.println("환영합니다. " + jandi.getEmail() + "잔디님!");
		
		return "jandi/mentorProfile";
	}
	
	@PostMapping("/jandiProfile1")
	public String profileFileUpload(@RequestParam MultipartFile profileImage, HttpServletRequest request, Model model) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		System.out.println("root : "+root);
		
		String filePath= root+"\\uploadFiles";
		
		File mkdir = new File(filePath);
		if(!mkdir.exists()) {
			mkdir.mkdirs();
		}
		
		
		String originFileName = profileImage.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "")+ext;
		
		try {
			profileImage.transferTo(new File(filePath+"\\"+savedName));
			model.addAttribute("message","파일업로드성공");
			
			
		} catch (IllegalStateException | IOException e) {
			new File(filePath+"\\"+savedName).delete();
			model.addAttribute("message","파일업로드 실패");
			
			e.printStackTrace();
		}
		
		return "mentorProfile";
		
	}
	
	
	
	@GetMapping("/jandiCalc")
	public String jandiCalc(){
		return "jandi/mentorCalc";
	}
	
	// 매핑 주소와 동일한 jsp파일이 있는 경우 해당 jsp를 띄워준다.
	@GetMapping("/createAd")
	public void createAd(){
		
	}
	
	@GetMapping("/myAd")
	public String myAd(){
		return "jandi/myAd";
	}
	
	@GetMapping("/class/chat")
	public String classChat(){
		
		return "jandi/class/classChat";
	}

}
