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

/**
 * @author 임예람
 * 
 * 주소 요청에 따른 권한 필터
 *
 */
@WebFilter(urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter{

	//권한을 줄 url 리스트
	Map<String, List<String>> permitURIList;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		permitURIList = new HashMap<String, List<String>>();
		
		// 로그인 안한 사용자도 볼 수 있는 권한
		List<String> allPermitList = new ArrayList<String>();
		allPermitList.add("main");
		allPermitList.add("findJandi");
		allPermitList.add("findclass");
		allPermitList.add("member");
		allPermitList.add("faq");
		allPermitList.add("css");
		allPermitList.add("resources");
		allPermitList.add("matching");
		
		// 로그인한 사용자만 볼 수 있는 권한
		List<String> memberPermitList = new ArrayList<String>();
		memberPermitList.add("mypage");
		memberPermitList.add("matching");
		memberPermitList.add("findClassMember");
		
		// 잔디로 가입한 사용자만 볼 수 있는 권한
		List<String> jandiPermitList = new ArrayList<String>();
		jandiPermitList.add("jandi");
		
		// 매니저로 로그인한 사용자만 볼 수 있는 권한
		List<String> managerPermitList = new ArrayList<String>();
		managerPermitList.add("manager");
		
		// 권한 리스트에 모두 추가
		permitURIList.put("allPermitList", allPermitList);
		permitURIList.put("memberPermitList", memberPermitList);
		permitURIList.put("jandiPermitList", jandiPermitList);
		permitURIList.put("managerPermitList", managerPermitList);
		
	}

	/**
	 * 주소 요청시 필터
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		
		// request 요청 uri 받아오기 
		String uri = httpRequest.getRequestURI();
		System.out.println("uri : " + uri);
		
		// uri에서 컨텍스트 루트 제외해서 저장
		String intent = uri.replace(httpRequest.getContextPath(), "");
		
		// 메인과 매니저 로그인의 경우는 제외
		if("/".equals(intent) || "/soomjan/manager/login".equals(uri)) {
			chain.doFilter(request, response);
			System.out.println("intent : " + intent);
			
		}else {
			
			// intetn에서 첫번째 intent만 가져오기
			String firstIntent = intent.substring(1, intent.indexOf("/", 1));
			System.out.println("firstIntent : " + firstIntent);
			
			HttpSession requestSession = httpRequest.getSession();
			
			// 로그인 세션
			MemberDTO member = (MemberDTO) requestSession.getAttribute("loginMember");
			ManagerDTO manager = (ManagerDTO) requestSession.getAttribute("loginManager");
			
			// 해당 첫번째 인텐트가 권한uri리스트에 있는지 체크
			boolean isMemberPermit = permitURIList.get("memberPermitList").contains(firstIntent);
			boolean isJandiPermit = permitURIList.get("jandiPermitList").contains(firstIntent);
			boolean isManagerPermit = permitURIList.get("managerPermitList").contains(firstIntent);
			boolean isAllPermit = permitURIList.get("allPermitList").contains(firstIntent);
			
			if(member != null) {	// 로그인한 사용자가 있는 경우
				
				if(member.getIsJandi() == 'Y') { // 새싹이면서 잔디인 경우
					
					// 로그인 안한 권한, 로그인한 권한, 잔디 권한 
					if(isAllPermit || isMemberPermit || isJandiPermit ) { 
						chain.doFilter(request, response);
					}else {
						((HttpServletResponse) response).sendError(403);
					}
						
				}else {	// 잔디가 아닌 새싹인 경우
					
					// 로그인 안한 권한, 로그인한 권한
					if(isAllPermit || isMemberPermit) {
						chain.doFilter(request, response);
						
					// 잔디 가입자가 아닌 로그인한 회원이 요청하면 잔디 필수를 보내준다.
					}else if(isJandiPermit) {
						System.out.println("잔디 필수");
						request.setAttribute("authMessage", "잔디 신청이 필요한 서비스입니다. 잔디 신청을 하시겠습니까?");
						request.getRequestDispatcher("/").forward(httpRequest, response);
					}else {
						((HttpServletResponse) response).sendError(403);
					}
				}
				
			}else if(manager != null) { //매니저 로그인을 한 경우
				// 매니저 권한, 로그인 안한 권한, 로그인 한 권한
				if(isManagerPermit || isAllPermit || isMemberPermit) {
					chain.doFilter(request, response);
				}else {
					((HttpServletResponse) response).sendError(403);
				}
				
			}else {	//로그인 한 사용자가 없는 경우
				
				// 로그인 안한 권한만 주고 나머지는 로그인 페이지로 이동
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
