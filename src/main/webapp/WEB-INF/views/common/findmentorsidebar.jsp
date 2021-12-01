<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <h1>멘토 보기</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          
          <li><a href="${ pageContext.servletContext.contextPath }/findmentor/findAllMentorMain">전체 멘토</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/findmentor/findTopMentorMain">인기 멘토</a></li>
        </ul>
      </div>
    </div>
  </body>

  <script src="css/ie10-viewport-bug-workaround.js"></script>
</html>
