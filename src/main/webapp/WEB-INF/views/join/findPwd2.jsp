<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>

    <title>비밀번호 찾기</title>

   <link href="${ pageContext.servletContext.contextPath }/resources/css/findPwd.css?" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"
    />
  </head>

  <body>
    <jsp:include page="../common/nav.jsp" />

    <main class="fullJoin">
       
        <div class="head">
            <div id="timage"><img src="${ pageContext.servletContext.contextPath }/resources/images/join.png" style="width: 70px; height: 70px; "></div>
            <div class="thumbnail" id="ttext">비밀번호 찾기 </div>
        </div>
 
        <br><br><br><br><br><br>
        <form method="post" id="submitForm">
        <div class="content">
            <div class="title" style="width: 15%;">인증번호</div>
            <input type="text" name="proof" id="num1">
            <button type="button" id="proof" onclick="return sendMail()">인증번호 전송</button>
            <input type="hidden" name="email" id="email" value="${ email }">
        </div>

        <br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
        <div style="position: relative; left: 38%; bottom: 120px;" class="emailbtn">
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
              url: "${ pageContext.servletContext.contextPath }/member/sendMail/findPwd",
              type: "post",
              data: {email : email},
              success: function(data) {
                if(data == "true") {
                  showModal("인증번호가 전송되었습니다.");
                } else {
                  showModal("인증번호 전송에 실패하였습니다.");
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

            let email = "${ email }";
            let number = $("#num1").val();

            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/member/pwdCheck",
              type: "post",
              data: {number : number, email : email},
              success: function(data) {
                if(data == "true") {
                    $("#nextModal").fadeIn();
                    $(".btn").click(function () {
                      $("#submitForm")
                      .attr("action", "${ pageContext.servletContext.contextPath }/member/findPwd3").submit();
                    });
                } else {
                  showModal("인증번호가 일치하지 않습니다.");
                }
              },
              error: function(error) {
                console.log(error);
              }
            });
          }

           /* 모달창 띄워주는 함수 */
        function showModal(str) {
            $("#modalTitle").html(str);
            $("#Modal").fadeIn();
              $(".btn").click(function () {
                $("#Modal").fadeOut();
              });
          };

          /* 마우스 커서 이벤트 */
          $(function() {

            $(".emailbtn > button").hover(
              function () {
                $(this).css("color", "black").css("cursor", "pointer");
              },
              function () {
                $(this).css("color", "white").css("cursor", "default");
              }
            );

            $("#proof").hover(
              function () {
                $(this).css("color", "black").css("cursor", "pointer");
              },
              function () {
                $(this).css("color", "white").css("cursor", "default");
              }
            );

          }); 
        </script>

        </script>
      
    </main>

    <jsp:include page="../common/footer.jsp" />
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
