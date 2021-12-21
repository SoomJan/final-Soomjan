<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>

    <title>관리자 로그인</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/login/managerlogin.css?"
      rel="stylesheet"
    />

  </head>
  <style>
    .body {
      line-height: 1.4285em;
    }
  </style>

  <body>
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
  </body>
</html>
