package com.soomjd.soomjan.jandi.cotroller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.jandi.model.dto.CalAdDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.CreateAdDTO;
import com.soomjd.soomjan.jandi.model.dto.FullAdDTO;
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
		List<ClassDTO> classDTO = jandiService.selectClasses(jandi.getEmail());
		
		
			
		model.addAttribute("jandi", jandi);
		
		model.addAttribute("classList", jandiService.selectClassCodeList(jandi));
		model.addAttribute("categoryList", jandiService.selectCategoryList());
		model.addAttribute("classes", classDTO);
		
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
		
		String filePath=root+"/uploadFiles/profile";
		
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
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/jandiCalc")
	public String jandiCalc(HttpSession session,Model model){
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		
		model.addAttribute("account", jandi.getAccount());
		model.addAttribute("accName", jandi.getAcc_name());
		model.addAttribute("bank", jandi.getBank());
		
		
		Date calStartDay = new Date();
		Calendar cal=Calendar.getInstance();
		cal.setTime(calStartDay);
		cal.add(Calendar.DATE, 7);
		Date calEndDay=cal.getTime();



		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
	
		model.addAttribute("calStartDay", sdf.format(calStartDay));
		model.addAttribute("calEndDay",  sdf.format(calEndDay));


		
		Map<String,Object> key1 = new HashMap<>();	
		key1.put("startDay", calStartDay);
		key1.put("endDay",calEndDay);
		key1.put("email", jandi.getEmail());
		
		
		List<CalculateDTO> calList=jandiService.selectcalculateList(key1);
		for(int i=0; i<calList.size();i++) {
			Date date=calList.get(i).getCalDate();
			try {
				calList.get(i).setCalDate(sdf.parse(sdf.format(date))); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		
		int feeSum=0;
		
		for(int i=0;i<calList.size();i++) {
			
			feeSum+=calList.get(i).getFees();
		}
		
		

		
		
		
		List<Map<String,Object>> feeSetList = new ArrayList<>();
		
		for(int i=0;i<calList.size();i++) {
			
			
			Map<String, Object> feeSet = new HashMap<String, Object>();
			feeSet.put("calDate", sdf.format( calList.get(i).getCalDate()));
			feeSet.put("fullFee",calList.get(i).getFees()*10);
			feeSet.put("fees", calList.get(i).getFees());
			feeSet.put("realFeeSet",calList.get(i).getFees()*9);
			
			feeSetList.add(feeSet);
			
		}
		

		
		model.addAttribute("feeSetList", feeSetList);
		model.addAttribute("calList", calList);
		model.addAttribute("fullFeeSum", feeSum*10);
		model.addAttribute("feeSum", feeSum);
		model.addAttribute("realFeeSum", feeSum*9);
		
		
		
		
		
		
		List<CalAdDTO> adList= jandiService.selectcalAdList(key1);
		for(int i=0; i<adList.size();i++) {
			Date date=adList.get(i).getPayDate();
			try {
				adList.get(i).setPayDate(sdf.parse(sdf.format(date))); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		int adPaySum=0;
		for(int i=0;i<adList.size();i++) {
			
			adPaySum+=adList.get(i).getPay();
		}
		
		
		model.addAttribute("adList", adList);
		model.addAttribute("adPaySum", adPaySum );
		
		
		
		return "jandi/mentorCalc";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@GetMapping("/jandiModifyCalc")
	public String jandiCalc1(HttpSession session,Model model, 
							@RequestParam(name="calStartDate", required=true) String calStartDate,  	
							@RequestParam(name="calEndDate", required=true) String calEndDate) {
		
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		
		model.addAttribute("account", jandi.getAccount());
		model.addAttribute("accName", jandi.getAcc_name());
		model.addAttribute("bank", jandi.getBank());
		
		Date startDay=null;
		Date endDay=null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		try {
			startDay = sdf.parse(calStartDate);
			endDay = sdf.parse(calEndDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("calStartDay", sdf.format(startDay));
		model.addAttribute("calEndDay",  sdf.format(endDay));

		
		
		Map<String,Object> key1 = new HashMap<>();	
		key1.put("startDay", startDay);
		key1.put("endDay",endDay);
		key1.put("email", jandi.getEmail());
		
		
		List<CalculateDTO> calList=jandiService.selectcalculateList(key1);
		for(int i=0; i<calList.size();i++) {
			Date date=calList.get(i).getCalDate();
			try {
				calList.get(i).setCalDate(sdf.parse(sdf.format(date))); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		
		int feeSum=0;
		
		for(int i=0;i<calList.size();i++) {
			
			feeSum+=calList.get(i).getFees();
		}
		
		

		
		
		
		List<Map<String,Object>> feeSetList = new ArrayList<>();
		
		for(int i=0;i<calList.size();i++) {
			
			
			Map<String, Object> feeSet = new HashMap<String, Object>();
			feeSet.put("calDate", sdf.format( calList.get(i).getCalDate()));
			feeSet.put("fullFee",calList.get(i).getFees()*10);
			feeSet.put("fees", calList.get(i).getFees());
			feeSet.put("realFeeSet",calList.get(i).getFees()*9);
			
			feeSetList.add(feeSet);
			
		}
		

		
		model.addAttribute("feeSetList", feeSetList);
		model.addAttribute("calList", calList);
		model.addAttribute("fullFeeSum", feeSum*10);
		model.addAttribute("feeSum", feeSum);
		model.addAttribute("realFeeSum", feeSum*9);
		
		
		
		
		
		
		List<CalAdDTO> adList= jandiService.selectcalAdList(key1);
		for(int i=0; i<adList.size();i++) {
			Date date=adList.get(i).getPayDate();
			try {
				adList.get(i).setPayDate(sdf.parse(sdf.format(date))); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		int adPaySum=0;
		for(int i=0;i<adList.size();i++) {
			
			adPaySum+=adList.get(i).getPay();
		}
		
		
		model.addAttribute("adList", adList);
		model.addAttribute("adPaySum", adPaySum );
		
		
		
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
		
		String filePath=root+"/uploadFiles/profile";
		
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
			key.put("originFileName", originFileName);
			key.put("savedName", savedName);
			key.put("classCode", classCode);
			key.put("adContents",ads.getAdContents());
			
			
			
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
	
	///////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/myAd")
	public String myAd(HttpSession session, Model model){
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		List<ClassDTO> classes = jandiService.selectClasses(jandi.getEmail());
		
		List<Integer> classesCodeList  =new ArrayList<Integer>();
		
		for(int i=0; i<classes.size(); i++) {
			
			int classesCode = classes.get(i).getClassCode();
			
			
			
			classesCodeList.add(classesCode);
			
			
		}
		System.out.println("classes : "+classes);
		System.out.println("classesCodeList : "+classesCodeList);
		System.out.println("classesCodeList size : "+classesCodeList.size());
		
		
		FullAdDTO myAd=null;
		
		
		if(classesCodeList.size()==0) {
			model.addAttribute("message", "만들어진 클래스가 없습니다.");
			return "jandi/failedPage";
			
		}else {
			
			String resultValue="N";
			
			for(int i=0;i<classesCodeList.size();i++) {
				FullAdDTO ad= jandiService.selectAd(classesCodeList.get(i));
				
				if(ad!=null) {
					System.out.println(ad);
					
					Date startDate= ad.getStartDate();
					
					Date today= new Date();
					
					if(startDate!=null) {
						long calDate=today.getTime()-startDate.getTime() ;
						
						long calDateDays =7- calDate/(24*60*60*1000);
						
						if(calDateDays>=0 && 7>=calDateDays) {
							myAd = ad;
							resultValue="Y";
							model.addAttribute("calDateDays",calDateDays);
							
							break;
						}	
					}else {
						myAd = ad;
					}
					
				}


			}
			
			model.addAttribute("resultValue", resultValue);
		}
		
		
		if(myAd==null) {
			model.addAttribute("message", "진행중인 광고가 없습니다");
			return "jandi/failedPage";
		}
		
		
		
		ClassDTO adClass=classes.get(myAd.getClassCode());
		
		
		model.addAttribute("imagePath",myAd.getImagePath());
		model.addAttribute("originImagePath", myAd.getOriginImagePath());
		model.addAttribute("adContents",myAd.getAdContents());
		model.addAttribute("className",adClass.getContents());
		
		
		
		
		return "jandi/myAd";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("jandiBuy")
	public String jandiBuy(HttpSession session, Model model) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		JandiDTO jandi = jandiService.selectJandi(member.getEmail());
		List<ClassDTO> classes = jandiService.selectClasses(jandi.getEmail());
		
		List<Integer> classesCodeList  =new ArrayList<Integer>();
		
		for(int i=0; i<classes.size(); i++) {
			
			int classesCode = classes.get(i).getClassCode();
			
			
			
			classesCodeList.add(classesCode);
			
			
		}
		
		FullAdDTO myAd=null;
		
		
		if(classesCodeList.size()==0) {

		}else {
			
			String resultValue="N";

			for(int i=0;i<classesCodeList.size();i++) {
				FullAdDTO ad= jandiService.selectAd(classesCodeList.get(i));
				
				if(ad!=null) {
					System.out.println(ad);
					
					Date startDate= ad.getStartDate();
					
					Date today= new Date();
					
					if(startDate!=null) {
						long calDate=today.getTime()-startDate.getTime() ;
						
						long calDateDays =7- calDate/(24*60*60*1000);
						
						if(calDateDays>=0 && 7>=calDateDays) {
							myAd = ad;
							resultValue="Y";
							model.addAttribute("calDateDays",calDateDays);
							
							break;
						}	
					}else {
						myAd = ad;
					}
					
				}


			}
			model.addAttribute("resultValue", resultValue);
		}
		
		model.addAttribute("myAd", myAd);
		
		model.addAttribute("adCode", myAd.getAdCode());
		
		System.out.println("/////////////////////////////////////////////myAd : "+myAd);
		
		
		ClassDTO myClasses= null;
		for(int i=0; i<classes.size();i++) {
			
			if(myAd.getClassCode()==classes.get(i).getClassCode()) {
				
				myClasses=classes.get(i);
				break;
			}
			
		}
		
		model.addAttribute("myClasses", myClasses);
		
		Date date=new Date();
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal2=Calendar.getInstance();
		
		cal.setTime(date);
		cal2.setTime(date);
		cal.add(Calendar.DATE, 1);
		cal2.add(Calendar.DATE, 8);
		
		String startDate=sdf.format(cal.getTime());
		String endDate=sdf.format(cal2.getTime());
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);		
		
		return "jandi/jandiBuy";
	}
	
	
	
	@RequestMapping(value="jandiPay")
	@ResponseBody
	public String jandiPay() {
		
	    try {
			URL address= new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection serverAddress = (HttpURLConnection) address.openConnection();
			serverAddress.setRequestMethod("POST");
			serverAddress.setRequestProperty("Authorization", "KakaoAK 8c3ee8cfc430145172ddcb8047be3afe");
			serverAddress.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serverAddress.setDoOutput(true);  //input은 자동적으로 연결
			String parameter="cid=TC0ONETIME"
							+"&partner_order_id=partner_order_id"
							+"&partner_user_id=partner_user_id"
							+"&item_name=광고"
							+"&quantity=1"
							+"&total_amount=10"
							+"&tax_free_amount=0"
							+"&approval_url=http://localhost:8585/soomjan/jandi/successPage"
							+"&cancel_url=http://localhost:8585/soomjan/jandi/failedPage"
							+"&fail_url=http://localhost:8585/soomjan/jandi/failedPage";
			OutputStream out = serverAddress.getOutputStream();
			DataOutputStream dataOut= new DataOutputStream(out);
			
			dataOut.writeBytes(parameter);
			dataOut.flush();
			dataOut.close();
			
			int result = serverAddress.getResponseCode();
			
			InputStream input; 
			if(result==200) {
				
				input = serverAddress.getInputStream();
				
				
			}else {
				input = serverAddress.getErrorStream();
			}
			
			InputStreamReader reader = new InputStreamReader(input);
			
			
			BufferedReader bReader = new BufferedReader(reader);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(bReader);
			String next_redirect_pc_url = (String) jsonObject.get("next_redirect_pc_url");
			
			System.out.println("next_redirect_pc_url : " + next_redirect_pc_url);
			return next_redirect_pc_url;
			

			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	    return "jandi/failedPage";
	}
	
	
	@GetMapping("successPage")
	public String successPage(Model model) {
		
		model.addAttribute("message", "결제에 성공하였습니다.");
		
		return "jandi/successPage";
	}
	
	
	@PostMapping("modifyNickName")
	public String modifyNickName(@RequestParam String nickName, RedirectAttributes rttr, Model model) {
		
		String email = ((JandiDTO) model.getAttribute("jandi")).getEmail();
		System.out.println(email);
		
		JandiDTO modifyJandi = new JandiDTO();
		modifyJandi.setEmail(email);
		modifyJandi.setNickName(nickName);
		
		if(jandiService.modifyNickName(modifyJandi)) {
			rttr.addFlashAttribute("nickMessage", "닉네임 변경에 성공했습니다.");
		}else {
			rttr.addFlashAttribute("nickMessage", "닉네임 변경에 실패했습니다.");
		}
		
		return "redirect:/jandi/jandiProfile";
	}

	@PostMapping("nickDupCheck")
	public @ResponseBody String nickDupCheck(@RequestParam String nickName) {
		
		String result = "false";
		if(jandiService.selectNickDupCheck(nickName) > 0) {
			result = "true";
		}
		
		return result; 
	}
}
