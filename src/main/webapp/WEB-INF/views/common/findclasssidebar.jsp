<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
   
    <title>Signin Template for Bootstrap</title>

  </head>
  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>클래스</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <li><a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain">전체 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/findclass/findTopClassMain">인기 클래스</a></li>
        </ul>
      </div>
    </div>
  </body>

</html>
