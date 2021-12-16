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
      href="${ pageContext.servletContext.contextPath }/resources/css/login.css"
      rel="stylesheet"
    />
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"
    />
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>

    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>
  
  <script>
  	$(function(){
  		if('${ requestScope.authMessage }' != ''){
  			alert('${ requestScope.authMessage }');
  		}
  	});
  </script>
  
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
            <form>
              <div class="login-box">
                <input type="text" id="email" name="email" placeholder="이메일" />
                <input type="password" id="password" name="password" placeholder="비밀번호" />
				<br><br>
                <div class="loginbtnGroup">
                <input id="submit" value="로그인" style="background-color: #91C788;" />
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

    <script>

      $(function(){

        /* 로그인 버튼 클릭 시 조건 체크 */
        $("#submit").click(function(){

          let email = $("#email").val();
          let password = $("#password").val();

          if(!email) {
            showModal("이메일을 입력해주세요.");
          } else if (!password) {
            showModal("비밀번호를 입력해주세요.");
          } else {

            /* 비밀번호 체크 */
            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/member/login",
              type: "post",
              data: {email : email , password : password},
              success: function(data) {
                if(data == "pwdFalse") {
                  showModal("비밀번호를 잘못 입력하셨습니다.");
                } else if(data == "emailFalse") {
                  showModal("존재하지 않는 이메일입니다.");
                } else {
                  location.href="${ pageContext.servletContext.contextPath }/";
                }
              },
              error: function(error) {
                console.log(error);
              }
            });
          }
          return false;
        });
      });



      



      /* 모달창 띄워주는 함수 */
      function showModal(str) {
            $("#modalTitle").html(str);
            $("#Modal").fadeIn();
              $(".btn").click(function () {
                $("#Modal").fadeOut();
              });
          };




    </script>

    <jsp:include page="../common/footer.jsp" />

    <script src="css/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

<!-- 모달창 모아두는 곳 -->

<div class="ui mini modal" id="Modal">
  <div class="contents">
    <p class="titles" id="modalTitle"></p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>
