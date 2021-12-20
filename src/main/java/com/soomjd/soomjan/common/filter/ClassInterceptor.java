package com.soomjd.soomjan.common.filter;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public class ClassInterceptor implements HandlerInterceptor{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		String requestUri = request.getRequestURI();
		String intent = requestUri.replace(request.getContextPath(), "");
		intent = intent.substring(1, intent.indexOf("/", 1));
		
		System.out.println("interceptor intent: " + intent);
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		boolean result = false;
		
		if(intent.equals("jandi")) {
			ClassDTO classDTO = (ClassDTO) session.getAttribute("classDTO");
			
			result = classDTO.getEmail().equals(member.getEmail());
			
		}else if(intent.equals("mypage")) {
			List<Map<String, String>> currentMemberList = (List<Map<String, String>>) session.getAttribute("currentMemberList");
			for(Map<String, String> memberMap : currentMemberList) {
				result = memberMap.get("EMAIL").equals(member.getEmail());
				
				break;
			}
		}
		System.out.println("인터셉터 결과 : " + result);
		if(!result) {
			modelAndView.setViewName("main/main");
		}
		
	}

	
}
