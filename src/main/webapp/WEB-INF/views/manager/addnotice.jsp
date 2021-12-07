<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/modifycategory.css"
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
        <h1>공지사항 작성</h1>
        <br /><br />
        <form class="notice-wrapper" action="${ pageContext.servletContext.contextPath }/manager/addnotice" method="post">
          <div>
            제목 : <input type="text" name="title" /><br />내용 :<br />

            <textarea rows="30" cols="80" name="contents">작성하기</textarea>
          </div>
          <button type="submit">제출하기</button>
        </form>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
