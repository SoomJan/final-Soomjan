<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    /> -->
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="resources/css/semantic/semantic.css"
    />
    <script src="resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script type="text/javascript" src="css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>신고 상세정보</h1>
        <br /><br />
        <div class="introduce">
          <h2>신고 내용</h2>
          <h4>잔디가 아니라 잡초였네?</h4>
          <a href="#">신고된 페이지로 이동</a> <br />

          <h2>신고된 아이디</h2>
          <h4>gsp@gmail.com</h4>

          <h2>누적 경고 횟수</h2>
          <h4>1</h4>

          <h2>신고 날짜</h2>
          <h4>2021-11-18 16:29:30</h4>

          <h2>신고 처리 여부</h2>
          <h4>처리 중...</h4>

          <form class="report">
            <button type="submit" method="post" onclick="">신고 수리</button
            ><br />
            <button type="submit" method="post" onclick="">신고 삭제</button>
          </form>
        </div>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
