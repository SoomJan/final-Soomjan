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
        <ul>
          <li><a href="#">JAVA</a></li>


        </ul>
      </div>
        <!-- <a href="#"><button class="tagBtn color-1 ">JAVA</button></a>
        <a href="#"><button class="tagBtn color-1 ">MVC</button></a>
        <a href="#"><button class="tagBtn color-1 ">SPRING</button></a>
        <a href="#"><button class="tagBtn color-1 ">프론트앤드</button></a>
        <a href="#"><button class="tagBtn color-1 ">백앤드</button></a>
        <a href="#"><button class="tagBtn color-1 ">ORACLE</button></a> -->
    </div>
  </body>

</html>
