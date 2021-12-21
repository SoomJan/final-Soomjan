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

    <title>관리자 로그인</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <%--
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    --%>
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/login/managerlogin.css?"
      rel="stylesheet"
    />
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />

    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>
  <style>
    .body {
      line-height: 1.4285em;
    }
  </style>

  <body>
    <!-- <div class="background"></div> -->
    <jsp:include page="../common/nav.jsp" />

    <main class="container-fluid">
      <div class="login">
        <h1>관리자 로그인</h1>
        <form
          class="login-box"
          action="${ pageContext.servletContext.contextPath }/manager/login"
          method="post"
        >
          <input type="email" name="mngId" placeholder="ID" />
          <input type="password" name="password" placeholder="password" />
          <button type="submit">로그인 하기</button><br />
        </form>
      </div>
    </main>

    <jsp:include page="../common/footer.jsp" />

    <script src="css/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
