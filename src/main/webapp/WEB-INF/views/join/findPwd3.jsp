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
        <form>
        <div class="content">
            <div class="title">새로운 비밀번호</div>
            <input type="password" name="password" id="password" placeholder="최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상">
            <div class="pwdCheck">
            </div>
            <input type="checkbox" id="pwdBoolean" style="display: none" />
        </div>

        <br><br>

        <div class="content">
            <div class="title">비밀번호 확인</div>
            <input type="password" name="password2" id="password2">
            <div class="pwdCheck2"></div>
            <input type="checkbox" id="pwdBoolean2" style="display: none" />
        </div>
      </form>


       
        <br><br><br><br><br><br><br><br>
        <div style="position: relative; left: 38%; bottom: 100px;" class="emailbtn">
            <button onclick="return goLogin()">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button>
        </div>
        

        <script>
        /* 비밀번호 형식 체크 */
        $(function () {
          $("#password").keyup(function () {
            let filter =
              /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

            if (!filter.test($(this).val())) {
              $(".pwdCheck")
                .html("올바르지 않은 비밀번호 형식입니다.")
                .css("color", "red");
              $(this).focus().css("background", "lightpink");
              $("#pwdBoolean").prop("checked", false);
            } else {
              $(".pwdCheck")
                .html("올바른 비밀번호 형식입니다.")
                .css("color", "blue");
              $(this).focus().css("background", "palegreen");
              $("#pwdBoolean").prop("checked", true);
            }
          });
        });

        /* 비밀번호 확인 체크 */
        $(function () {
          $("#password2").keyup(function () {
            if ($("#password").val() != $("#password2").val()) {
              $(".pwdCheck2")
                .html("비밀번호가 일치하지 않습니다.")
                .css("color", "red");
              $(this).focus().css("background", "lightpink");
              $("#pwdBoolean2").prop("checked", false);
            } else {
              $(".pwdCheck2")
                .html("비밀번호가 일치합니다.")
                .css("color", "blue");
              $(this).focus().css("background", "palegreen");
              $("#pwdBoolean2").prop("checked", true);
            }
          });
        });


          /* 비밀번호 수정 */
          function goLogin() {

            let pwd = $("#pwdBoolean").prop("checked");
            let pwd2 = $("#pwdBoolean2").prop("checked");
            let password = $("#password").val();
            let email = "${ email }";

            if(!pwd || !pwd2) {
              showModal("비밀번호를 다시 확인해주세요.")
              return false;
            } else {
              
              $.ajax({
                url: "${ pageContext.servletContext.contextPath }/member/updatePwd",
                type: "post",
                data: {email : email, pwd : password},
                success: function(data) {
                  if(data == "true") {
                    $("#nextModal").fadeIn();
                    $(".btn").click(function(){
                      location.href="${ pageContext.servletContext.contextPath }/member/login";
                    });
                  } else {
                    showModal("비밀번호 수정에 실패하셨습니다.")
                  }
                },
                error: function(error) {
                  console.log(error);
                }
              });
            }
            return false;
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
          $(".emailbtn > button").hover(
              function () {
                $(this).css("color", "black").css("cursor", "pointer");
              },
              function () {
                $(this).css("color", "white").css("cursor", "default");
              }
            );  

        </script>
    </main>
    <jsp:include page="../common/footer.jsp" />
  </body>
</html>

<!-- 모달창 모아두는 곳 -->

<div class="ui mini modal" id="nextModal">
  <div class="contents">
    <p class="titles">비밀번호 수정이 완료되었습니다.</p>
    <div class="re-modal-btn">
      <button id="goLogin" class="ui button btn">로그인 페이지로</button>
    </div>
  </div>
</div>

<div class="ui mini modal" id="Modal">
  <div class="contents">
    <p class="titles" id="modalTitle"></p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>