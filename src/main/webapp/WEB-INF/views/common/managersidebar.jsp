<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managersidebar.css"
      rel="stylesheet"
    />

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />

    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link
      rel="stylesheet"
      type="text/css"
      href="semantic/dist/semantic.min.css"
    />
    <script src="semantic/dist/semantic.min.js"></script>
  </head>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>환잔디 님</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <h3>계정 관리</h3>
          <li><a href="#">멘티 조회</a></li>
          <li><a href="#">멘토 조회</a></li>
          <li><a href="#">관리자 계정 관리</a></li>
        </ul>
        <ul>
          <h3>신고 관리</h3>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/reportedmentee">신고된 멘티</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/reportedmentor">신고된 멘토</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/manager/reportedboard">신고된 게시판</a></li>
        </ul>
        <ul>
          <h3>클래스 관리</h3>
          <li><a href="#">카테고리 수정 </a></li>
          <li><a href="#">클래스 광고 요청</a></li>
          <li><a href="#">현재 광고중인 클래스</a></li>
        </ul>
        <ul>
          <h3>정산 관리</h3>
          <li><a href="#">클래스 결제 내역</a></li>
          <li><a href="#">광고 결제 내역</a></li>
        </ul>
      </div>
    </div>
  </body>

  <script src="css/ie10-viewport-bug-workaround.js"></script>
</html>
