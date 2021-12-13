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
     <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
   <link href="${ pageContext.servletContext.contextPath }/resources/css/findPwd.css?" rel="stylesheet" />
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

  <body>
    <!-- <div class="background"></div> -->
    <jsp:include page="../common/nav.jsp" />

    <main class="fullJoin">
       
        <div class="head">
            <div class="thumbnail" id="timage"><img src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png" style="width: 60px; height: 60px; "></div>
            <div class="thumbnail" id="ttext">비밀번호 찾기 </div>
        </div>
 
        <br><br><br><br><br><br>
        <form method="post" id="submitForm">
        <div class="content">
            <div class="title">인증번호</div>
            <input type="text" name="proof" id="num1">
            <input type="text" id="num2" style="display: none;">
            <button type="button" id="proof" onclick="return sendMail()">인증번호 보내기</button>
            <input type="hidden" name="email" id="email" value="${ email }">
        </div>

        <br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
        <div style="align-items: center; width: fit-content; margin: auto;">
            <button type="button" onclick="return confirm()">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button>
        </div>
      </form>

        <script>
          
          /* 인증번호 보내는 함수 */
          function sendMail() {

            let email = "${ email }";

            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/sendMail",
              type: "post",
              data: {email : email},
              success: function(data) {
                if(!data) {
                  showModal("이메일 전송 실패");
                } else {
                  showModal("이메일 전송 완료");
                  $("#num2").val(data);
                }
              },
              error: function(error) {
                console.log(error);
              }
            });
            return false;
          }

          /* 인증번호 확인 */
          function confirm() {

            let num1 = $("#num1").val();
            let num2 = $("#num2").val();

            if(num1 == num2) {
              $("#nextModal").fadeIn();
                    $(".btn").click(function () {
                      $("#submitForm")
                      .attr("action", "${ pageContext.servletContext.contextPath }/member/findPwd3").submit();
                    });
            } else {
              showModal("인증번호가 일치하지 않습니다.");
            }
          }

           /* 모달창 띄워주는 함수 */
        function showModal(str) {
            $("#modalTitle").html(str);
            $("#Modal").fadeIn();
              $(".btn").click(function () {
                $("#Modal").fadeOut();
              });
          };

        </script>
      
    </main>

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

<div class="ui mini modal" id="nextModal">
  <div class="contents">
    <p class="titles" id="modalTitle">인증 번호가 일치합니다.</p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>
