<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
   
    <title>Signin Template for Bootstrap</title>

  </head>

  <link
    rel="stylesheet"
    type="text/css"
    href="semantic/dist/semantic.min.css"
  />
  <script src="semantic/dist/semantic.min.js"></script>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>클래스</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain">전체 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/findclass/findTopClassMain">인기 클래스</a></li>
        </ul>
        <!--  <ul>
          <h3>설정</h3>
          <hr class="border-1px-black" />
          <li><a href="#">정보수정</a></li>
          <li><a href="#">비밀번호 변경</a></li>
          <li><a href="#">회원탈퇴</a></li>
        </ul> -->
      </div>
    </div>
  </body>

  <script src="css/ie10-viewport-bug-workaround.js"></script>
</html>
