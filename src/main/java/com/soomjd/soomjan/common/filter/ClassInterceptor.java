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

/**
 * @author 임예람
 * 
 * 결제한 클래스 권한 인터셉터
 * 
 * servlet-contex.xml에 mapping path로 { /mypage/class/*,  /jandi/class/* }을 줘서
 * 해당 매핑 주소를 요청할 때 실행되는 클래스
 *
 */
public class ClassInterceptor implements HandlerInterceptor{

	/**
	 * controller내의 조회한 결과 값으로 비교해야 하기 때문에
	 * controller를 실핼 한 후 실행하는 postHandle을 사용
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// 요청 uri의 인텐트 저장
		String requestUri = request.getRequestURI();
		String intent = requestUri.replace(request.getContextPath(), "");
		intent = intent.substring(1, intent.indexOf("/", 1));
		
		System.out.println("interceptor intent: " + intent);
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		
		boolean result = false;
		
		// intent가 jandi이면 실행
		if(intent.equals("jandi")) {
			// createClass는 클래스가 생성되기 전에도 실행 될 수 있도록 true
			if(requestUri.equals(request.getContextPath() + "/jandi/class/createClass")) {
				result = true;
			}else { // 해당 클래스가 자신이 쓴 클래스와 동일하면 true
				ClassDTO classDTO = (ClassDTO) session.getAttribute("classDTO");
				result = classDTO.getEmail().equals(member.getEmail());
			}
		}else if(intent.equals("mypage")) { // intent가 mypage면 실행
			// 해당 클래스를 듣고 있는 수강생 목록을 조회하여 검사한다.
			List<Map<String, String>> currentMemberList = (List<Map<String, String>>) session.getAttribute("currentMemberList");

			for(Map<String, String> memberMap : currentMemberList) {
				// 로그인한 사용자가 해당 리스트에 있으면 true로 주고 반복문을 빠져 나간다.
				result = memberMap.get("EMAIL").equals(member.getEmail());
				
				if(result) { break; }
			}
		}
		System.out.println("인터셉터 결과 : " + result);
		
		// result가 true가 아니면 메인페이지로 보낸다.
		if(!result) {
			modelAndView.setViewName("main/main");
		}
		
	}

	
}
