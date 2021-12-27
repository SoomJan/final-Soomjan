package com.soomjd.soomjan.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soomjd.soomjan.member.model.service.MemberService;

@Controller
@RequestMapping("/member/sendMail/*")
public class SendMailController {

	private final JavaMailSender mailSender;
	private final MemberService memberService;

	@Autowired
	public SendMailController(JavaMailSender mailSender, MemberService memberService) {
		this.mailSender = mailSender;
		this.memberService = memberService;
	}

	/**
	 * @author 권순표
	 * 사용자 이메일로 인증번호 전송
	 * @param email 사용자가 입력한 이메일
	 * @param response 전송 성공 여부
	 */
	@PostMapping("join")
	public void sendMail(@RequestParam("email") String email, HttpServletResponse response) {

		String authNum = SendMailController.authNum();
		String subject = "숨은 잔디 인증 번호입니다.";
		String content = "인증 번호 ["+ authNum +"]";
		String from = "tnsvy2004@gmail.com";
		String to = email;

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);

			boolean mailCheckInsert = memberService.mailCheckInsert(authNum);
			if(mailCheckInsert) {
				/* 이메일 전송 */
				mailSender.send(mail);

				response.getWriter().write("true");
			} else {
				response.getWriter().write("false");
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author 권순표
	 * 사용자 이메일로 인증번호 전송
	 * @param email 사용자 입력 이메일
	 * @param response 인증번호 전송 성공 여부
	 */
	@PostMapping("findPwd")
	public void sendMail2(@RequestParam("email") String email, HttpServletResponse response) {

		String authNum = SendMailController.authNum();
		String subject = "숨은 잔디 인증 번호입니다.";
		String content = "인증 번호 ["+ authNum +"]";
		String from = "tnsvy2004@gmail.com";
		String to = email;

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("number", authNum);

			boolean mailCheckUpdate = memberService.mailCheckUpdate(map);
			if(mailCheckUpdate) {
				/* 이메일 전송 */
				mailSender.send(mail);

				response.getWriter().write("true");
			} else {
				response.getWriter().write("false");
			}

		} catch(Exception e) {
			e.printStackTrace();
		}



	}

	// 난수발생 function
	public static String authNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=4;i++){
			int num=(int)(Math.random()*9+1);
			buffer.append(num);
		}
		return buffer.toString();
	}

}
