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
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/login.css?"
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

  <body>
    <!-- <div class="background"></div> -->
    <jsp:include page="../common/nav.jsp" />

    <main class="login">
      <table id="login-table">
        <tr>
          <td style="text-align: center;">
              <img
              src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png"
              style="width: 40%"
            />
          </td>
          <td class="logintd">
            <h1 style="text-align: left;">로그인</h1>
            <form
              action="${ pageContext.servletContext.contextPath }/member/login"
              method="post"
            >
              <div class="login-box">
                <input type="text" name="email" placeholder="이메일" />
                <input type="password" name="password" placeholder="비밀번호" />
				<br><br>
                <div class="loginbtnGroup">
                <input type="submit" value="로그인" style="background-color: #91C788;" />
                <input type="button" value="회원가입" onclick="location.href='${ pageContext.servletContext.contextPath }/member/terms'" style="background-color: lightgray;" />
                </div>
                <!--  <button>로그인</button> -->
                <br />
                <div>
                  <a href="${ pageContext.servletContext.contextPath }/member/findEmail">이메일찾기</a>
                  &nbsp;&nbsp;&nbsp;
<%--                   <a href="${ pageContext.servletContext.contextPath }/member/terms">회원가입</a>
                  &nbsp;&nbsp;&nbsp; --%>
                  <a href="${ pageContext.servletContext.contextPath }/member/findPwd">비밀번호찾기</a>
                </div>
              </div>
            </form>
          </td>
        </tr>
      </table>
    </main>

    <jsp:include page="../common/footer.jsp" />

    <script src="css/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
