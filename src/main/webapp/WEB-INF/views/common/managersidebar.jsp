<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>

    <title>매니저 슬라이더바</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managersidebar.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" />

  </head>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
      
    	   <c:if test="${ !empty sessionScope.loginManager.mngNickName}">
              <h1>${ sessionScope.loginManager.mngNickName }님 </h1>
          </c:if>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <h3>계정 관리</h3>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/mentilist">새싹 조회</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/mentolist">잔디 조회</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/manproduce">관리자 계정 관리</a></li>
        </ul>
        <ul>
          <h3>신고 관리</h3>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/reportedmentee">신고된 회원</a></li>
          <%-- <li><a href="${ pageContext.servletContext.contextPath }/manager/reportedmentor">신고된 잔디</a></li> --%>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/reportedboard">신고된 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/blackmember">블랙리스트 회원</a></li>
        </ul>
        <ul>
          <h3>클래스 관리</h3>
          <li>
            <a
              href="${ pageContext.servletContext.contextPath }/manager/modifycategory"
              >카테고리 수정
            </a>
          </li>
          <li>
            <a href="${ pageContext.servletContext.contextPath }/manager/classadvertisment">현재 광고중인 클래스</a>
          </li>
        </ul>
        <ul>
          <h3>정산 관리</h3>
          <li>
            <a href="${ pageContext.servletContext.contextPath }/manager/classcal" >클래스 미정산 내역</a>
          </li>
          <li>
            <a href="${ pageContext.servletContext.contextPath }/manager/finishcal" >클래스 정산 내역</a>
          </li>
          <li>
            <a href="${ pageContext.servletContext.contextPath }/manager/advertcal" >광고 결제 내역</a>
          </li>
        </ul>
        <ul>
          <h3>공지사항</h3>
          <li>
            <a
              href="${ pageContext.servletContext.contextPath }/manager/notice"
              >공지사항 조회</a
            >
          </li>
        </ul>
      </div>
    </div>
  </body>
</html>
