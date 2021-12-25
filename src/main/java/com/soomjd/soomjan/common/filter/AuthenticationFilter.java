package com.soomjd.soomjan.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@WebFilter(urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter{

	Map<String, List<String>> permitURIList;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		permitURIList = new HashMap<String, List<String>>();
		
		List<String> allPermitList = new ArrayList<String>();
		allPermitList.add("main");
		allPermitList.add("findJandi");
		allPermitList.add("findclass");
		allPermitList.add("member");
		allPermitList.add("faq");
		allPermitList.add("css");
		allPermitList.add("resources");
		allPermitList.add("matching");
		
		List<String> memberPermitList = new ArrayList<String>();
		memberPermitList.add("mypage");
		memberPermitList.add("matching");
		memberPermitList.add("findClassMember");
		
		List<String> jandiPermitList = new ArrayList<String>();
		jandiPermitList.add("jandi");
		
		List<String> managerPermitList = new ArrayList<String>();
		managerPermitList.add("manager");
		
		permitURIList.put("allPermitList", allPermitList);
		permitURIList.put("memberPermitList", memberPermitList);
		permitURIList.put("jandiPermitList", jandiPermitList);
		permitURIList.put("managerPermitList", managerPermitList);
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		
		String uri = httpRequest.getRequestURI();
		System.out.println("uri : " + uri);
		
		String intent = uri.replace(httpRequest.getContextPath(), "");
		
		if("/".equals(intent) || "/soomjan/manager/login".equals(uri)) {	// 메인은 제외
			chain.doFilter(request, response);
			System.out.println("intent : " + intent);
			
		}else {
			
			String firstIntent = intent.substring(1, intent.indexOf("/", 1));
			System.out.println("firstIntent : " + firstIntent);
			
			HttpSession requestSession = httpRequest.getSession();
			
			MemberDTO member = (MemberDTO) requestSession.getAttribute("loginMember");
			ManagerDTO manager = (ManagerDTO) requestSession.getAttribute("loginManager");
			
			boolean isMemberPermit = permitURIList.get("memberPermitList").contains(firstIntent);
			boolean isJandiPermit = permitURIList.get("jandiPermitList").contains(firstIntent);
			boolean isManagerPermit = permitURIList.get("managerPermitList").contains(firstIntent);
			boolean isAllPermit = permitURIList.get("allPermitList").contains(firstIntent);
			
			if(member != null) {	// 로그인한 사용자가 있는 경우
				
				if(member.getIsJandi() == 'Y') {	// 새싹이면서 잔디인 경우
					
					if(isAllPermit || isMemberPermit || isJandiPermit ) {
						chain.doFilter(request, response);
					}else {
						((HttpServletResponse) response).sendError(403);
					}
						
				}else {	// 잔디가 아닌 새싹인 경우
					if(isAllPermit || isMemberPermit) {
						chain.doFilter(request, response);
					}else if(isJandiPermit) {
						System.out.println("잔디 필수");
						request.setAttribute("authMessage", "잔디 신청이 필요한 서비스입니다. 잔디 신청을 하시겠습니까?");
						request.getRequestDispatcher("/").forward(httpRequest, response);
					}else {
						((HttpServletResponse) response).sendError(403);
					}
				}
				
			}else if(manager != null) { //매니저 로그인을 한 경우
				if(isManagerPermit || isAllPermit || isMemberPermit) {
					chain.doFilter(request, response);
				}else {
					((HttpServletResponse) response).sendError(403);
				}
				
			}else {	//로그인 한 사용자가 없는 경우
				
				if(isAllPermit) {
					chain.doFilter(request, response);
				}else {
					System.out.println("세션 없음");
					request.setAttribute("authMessage", "로그인이 필요한 서비스입니다.");
					request.getRequestDispatcher("/member/login").forward(httpRequest, response);
				}
			}
		}
	}

	@Override
	public void destroy() {}

}
