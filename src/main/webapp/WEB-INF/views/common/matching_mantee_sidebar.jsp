<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/matching/findmentorsidebar.css" rel="stylesheet"/>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>${ sessionScope.loginMember.nickName } 님</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
          <ul>
		<li><a href="${ pageContext.servletContext.contextPath }/matching/manteeMain/${ sessionScope.loginMember.email}">견적서 현황</a></li>
		<c:if
            test="${ sessionScope.loginMember.isJandi eq 'Y'.charAt(0) }" >
		<li><a href="${ pageContext.servletContext.contextPath }/matching/estimateMain">전체 견적서 리스트</a></li>
		<li><a href="${ pageContext.servletContext.contextPath }/matching/chatList">채팅 리스트</a></li>
		</c:if>
        </ul>
      </div>
    </div>
  </body>

  <script src="css/ie10-viewport-bug-workaround.js"></script>
</html>
