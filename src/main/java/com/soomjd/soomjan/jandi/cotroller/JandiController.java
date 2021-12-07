package com.soomjd.soomjan.jandi.cotroller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.soomjd.soomjan.jandi.model.dto.CreateAdDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiIntroDTO;
import com.soomjd.soomjan.jandi.model.service.JandiService;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/jandi/*")
@SessionAttributes({"jandi", "loginMember", "classList", "categoryList"})
public class JandiController {
	
	private final JandiService jandiService;
	
	@Autowired
	public JandiController(JandiService jandiService) {
		this.jandiService = jandiService;
	}
	
	@GetMapping("/jandiProfile")
	public String jandiProfile(Model model, HttpSession session){
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
			
		
		model.addAttribute("jandi", jandi);
		
		model.addAttribute("classList", jandiService.selectClassCodeList(jandi));
		model.addAttribute("categoryList", jandiService.selectCategoryList());
		
		System.out.println("환영합니다. " + jandi.getEmail() + "잔디님!");

		System.out.println(jandi);
	
		
		return "jandi/mentorProfile";
	}

	
	@PostMapping("/jandiProfile1")
	@ResponseBody
	public String profileFileUpload(@RequestParam(name="profileImage", required=false) MultipartFile profileImage,HttpSession session, HttpServletRequest request, Model model) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath=root+"/uploadFiles";
		
		System.out.println(filePath);
		
		
		
		File mkdir= new File(filePath);
		if(!mkdir.exists()) {
			mkdir.mkdirs();
		}
		
		
		String originFileName="";
		String ext="";
		String savedName ="";
		
		
		System.out.println(profileImage);
		
		if(profileImage.getSize()>0) {
			
			originFileName = profileImage.getOriginalFilename();
			ext=originFileName.substring(originFileName.lastIndexOf("."));
			savedName = UUID.randomUUID().toString().replace("-", "")+ext;
			
			System.out.println(originFileName);
			System.out.println(ext);
			System.out.println(savedName);
			
			Map<String,String> key = new HashMap<>();
			key.put("savedName", savedName);
			key.put("email", member.getEmail());
			
			File originFile = new File(filePath+"/"+jandi.getprofile_path());
			
			jandiService.updateProfileImage(key) ;
			
			originFile.delete();
			try {
				profileImage.transferTo(new File(filePath+"/"+savedName));

				model.addAttribute("address",savedName);
				
				
				
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return savedName;
	}
	
	
	@PostMapping("/jandiIntro")
	public String profileIntroUpdate(@ModelAttribute JandiIntroDTO intro, HttpServletRequest request,HttpSession session) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		System.out.println(member);
		System.out.println(intro);
		
		Map<String,Object> key=new HashMap<>();
		key.put("member", member);
		key.put("intro",intro);
		
		jandiService.updateIntro(key);
		
		return "redirect:jandiProfile";
		
	}
	
	
	
	@GetMapping("/jandiCalc")
	public String jandiCalc(){
		
		
		
		
		
		
		return "jandi/mentorCalc";
	}
	
	// 매핑 주소와 동일한 jsp파일이 있는 경우 해당 jsp를 띄워준다.
	@GetMapping("/createAd")
	public String createAd(HttpSession session, Model model){
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		List<String> classesSelect= jandiService.selectClassesList(member.getEmail());
		
		System.out.println(member);
		System.out.println("jandi : "+jandi);
		System.out.println(classesSelect);
		System.out.println("아아아 테스");
		
		
		
		model.addAttribute("jandi",jandi);
		model.addAttribute("classesSelect",classesSelect);
		
		
		return "jandi/createAd";
	}
	
	@PostMapping("/createAd")
	public String createAd(@ModelAttribute CreateAdDTO ads
							,HttpServletRequest request
							,HttpSession session
							,@RequestParam(name="adPoster", required= false) MultipartFile adPoster){
		
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		
		/*이미지 이외의 데이터 삽입 */
		
		int classCode= jandiService.selectClassesCode(ads.getMyClass());
		
		/*이미지 삽입*/
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath=root+"/uploadFiles";
		
		System.out.println(filePath);
		
		
		
		File mkdir= new File(filePath);
		if(!mkdir.exists()) {
			mkdir.mkdirs();
		}
		
		
		String originFileName="";
		String ext="";
		String savedName ="";
		
		
		System.out.println(adPoster);
		
		if(adPoster.getSize()>0) {
			
			originFileName = adPoster.getOriginalFilename();
			ext=originFileName.substring(originFileName.lastIndexOf("."));
			savedName = UUID.randomUUID().toString().replace("-", "")+ext;
			
			System.out.println(originFileName);
			System.out.println(ext);
			System.out.println(savedName);
			
			Map<String,Object> key = new HashMap<>();
			key.put("savedName", savedName);
			key.put("classCode", classCode);
			
			
			
			jandiService.insertAd(key) ;
			
			try {
				
				adPoster.transferTo(new File(filePath+"/"+savedName));
				
				
			} catch (IllegalStateException | IOException e) {
				
				e.printStackTrace();
				
				new File(filePath + "/" + savedName + ext).delete();
			}
		
		}
		
		

		
		
		
		
		
		
		
		return "jandi/createAd";
	}
	
	
	
	@GetMapping("/myAd")
	public String myAd(){
		return "jandi/myAd";
	}
	

}
