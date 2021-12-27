<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>숨은잔디 회원가입</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/join.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"
    />
  </head>
  <style>
    .body {
      margin: 0 auto 100px;
    }
  </style>

  <body>
    <jsp:include page="../common/nav.jsp" />

    <main class="fullJoin">
      <div class="head">
        <div id="timage">
          <img
            src="${ pageContext.servletContext.contextPath }/resources/images/join.png"
            style="width: 70px; height: 70px;" 
          />
        </div>
        <div class="thumbnail" id="ttext">회원가입</div>
      </div>

      <br /><br />

      <form method="post" id="submitForm">
        <div class="content">
          <div class="title">이름</div>
          <input
            type="text"
            placeholder="이름을 입력하세요"
            name="name"
            id="name"
          />
          <div class="nameCheck" style="margin-top: 1%;"></div>
          <input type="checkbox" id="nameBoolean" style="display: none" />
        </div>

        <br /><br />

        <div class="content">
            <div class="title">이메일</div>
            <input type="text" placeholder="이메일을 입력하세요" name="email" id="email">
            <button type="button" class="onButton" onclick="return duplicationCheck()">중복확인</button>
            <button type="button" class="onButton" id="proofButton" onclick="return sendMail()" style="display: none;">이메일 인증</button>
            <div class="emailCheck" style="margin-top: 1%;"></div>
            <input type="checkbox" id="emailBoolean" style="display: none;">
            <input type="checkbox" id="emailBoolean2" style="display: none;">
            <input type="checkbox" id="emailBoolean3" style="display: none;">
        </div>

        <br /><br />

        <div class="content">
          <div class="title">인증번호</div>
          <input type="text" name="proof" id="proof" placeholder="인증 번호를 입력하세요">
          <div class="proofCheck" style="margin-top: 1%;"></div>
          <input type="checkbox" id="proofBoolean" style="display: none" />
        </div>

        <br /><br />

        <div class="content">
          <div class="title">비밀번호</div>
          <input type="password" name="password" id="password" placeholder="최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상" />
          <div class="pwdCheck" style="margin-top: 1%;">
          </div>
          <input type="checkbox" id="pwdBoolean" style="display: none" />
        </div>
        <br />

        <div class="content">
          <div class="title">비밀번호 확인</div>
          <input type="password" name="password2" id="password2" />
          <div class="pwdCheck2" style="margin-top: 1%;"></div>
          <input type="checkbox" id="pwdBoolean2" style="display: none" />
        </div>

        <br/><br />

        <div class="content">
          <div class="title">닉네임</div>
          <input type="text" placeholder="닉네임을 입력하세요" name="nickName" id="nickName"/>
          <button type="button" class="onButton" onclick="return duplicationCheck2()">중복확인</button>
          <input type="checkbox" id="nickBoolean" style="display: none" />
        </div>

        <br /><br />

        <div class="content">
          <div class="title">핸드폰번호</div>
          <input
            type="text"
            placeholder="-없이 입력해주세요"
            name="phone"
            id="phone"
          />
          <div class="phoneCheck" style="margin-top: 1%;"></div>
          <input type="checkbox" id="phoneBoolean" style="display: none" />
        </div>

        <br /><br /><br />
        <div style="align-items: center; width: fit-content; margin: auto">
          <button class="onButton" id="confirm">확인</button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <button class="onButton" type="reset">취소</button>
        </div>
      </form>

      <script>

        /* 이름 형식 체크 */
        $(function () {
          $("#name").keyup(function () {
            let filter = /^[가-힣]+$/;

            if (!filter.test($(this).val())) {
              $(".nameCheck")
                .html("올바르지 않은 이름 형식입니다.")
                .css("color", "red");
              $(this).focus().css("background", "lightpink");
              $("#nameBoolean").prop("checked", false);
            } else {
              $(".nameCheck")
                .html("올바른 이름 형식입니다.")
                .css("color", "blue");
              $(this).focus().css("background", "palegreen");
              $("#nameBoolean").prop("checked", true);
            }
          });
        });

        /* 이메일 중복 체크 */
        function duplicationCheck() {
          let email = $("#email").val();

          if (!email) {
            showModal("이메일을 입력해주세요.");
          } else {
            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/member/idDupCheck",
              type: "post",
              data: { email: email },
              success: function (data) {
                if (data == "true") {
                  showModal("중복된 이메일입니다.");
                  $("#emailBoolean").prop("checked", false);
                } else {
                  showModal("사용 가능한 이메일입니다.");
                  $("#proofButton").css("display", "");
                  $("#emailBoolean").prop("checked", true);
                }
              },
              error: function (error) {
                console.log(error);
              },
            });
          }
            return false;
          }
          
          /* 이메일 인증 */
          function sendMail() {

            let email = $("#email").val();

            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/member/sendMail/join",
              type: "post",
              data: {email : email},
              success: function(data) {
                if(data == "true") {
                  showModal("인증번호가 전송되었습니다.");
                  $("#emailBoolean3").prop("checked", true);
                } else {
                  showModal("인증번호 전송에 실패하였습니다.");
                  $("#emailBoolean3").prop("checked", false);
                }
              },
              error: function(error) {
                console.log(error);
              }
            });
            return false;
        };

          /* 인증번호 확인 */
          $(function(){
            $("#proof").keyup(function(){

              let number = $(this).val();

              $.ajax({
                url: "${ pageContext.servletContext.contextPath }/member/mailCheck",
                type: "post",
                data: { number : number },
                success: function(data) {
                  if(data == "true") {
                    $(".proofCheck").html("인증 번호가 일치합니다.")
                    .css("color", "blue");
                    $(this).focus().css("background", "palegreen");
                    $("#proofBoolean").prop("checked", true);
                  } else {
                    $(".proofCheck")
                    .html("인증 번호가 일치하지 않습니다.")
                    .css("color", "red");
                    $(this).focus().css("background", "lightpink");
                    $("#proofBoolean").prop("checked", false);
                  }
                },
                error: function(error) {
                  console.log(error);
                }
              });
            });
          });
          
        /* 이메일 형식 체크 */
        $(function () {
          $("#email").keyup(function () {
            let filter =
              /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

            if (!filter.test($(this).val())) {
              $(".emailCheck")
                .html("올바르지 않은 이메일 형식입니다.")
                .css("color", "red");
              $(this).focus().css("background", "lightpink");
              $("#emailBoolean2").prop("checked", false);
            } else {
              $(".emailCheck")
                .html("올바른 이메일 형식입니다.")
                .css("color", "blue");
              $(this).focus().css("background", "palegreen");
              $("#emailBoolean2").prop("checked", true);
            }
          });
        });

        /* 핸드폰 번호 형식 체크 */
        $(function () {
          $("#phone").keyup(function () {
            let filter = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

            if (!filter.test($(this).val())) {
              $(".phoneCheck")
                .html("올바르지 않은 번호 형식입니다.")
                .css("color", "red");
              $(this).focus().css("background", "lightpink");
              $("#phoneBoolean").prop("checked", false);
            } else {
              $(".phoneCheck")
                .html("올바른 번호 형식입니다.")
                .css("color", "blue");
              $(this).focus().css("background", "palegreen");
              $("#phoneBoolean").prop("checked", true);
            }
          });
        });

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

        /* 닉네임 중복 체크 */
        function duplicationCheck2() {
          let nickName = $("#nickName").val();

          if (!nickName) {
            showModal("닉네임을 입력해주세요.");
          } else {
            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/member/nickDupCheck",
              type: "post",
              data: { nickName: nickName },
              success: function (data) {
                if (data == "true") {
                  showModal("중복된 닉네임입니다.");
                  $("#nickBoolean").prop("checked", false);
                } else {
                  showModal("사용 가능한 닉네임입니다.");
                  $("#nickBoolean").prop("checked", true);
                }
              },
              error: function (error) {
                console.log(error);
              }
            });
          }
          return false;
        }

        /* 전체 조건 체크 */
        $(function () {
          $("#confirm").click(function (e) {

            let name = $("#nameBoolean").prop("checked");
            let email = $("#emailBoolean").prop("checked");
            let email2 = $("#emailBoolean2").prop("checked");
            let email3 = $("#emailBoolean3").prop("checked");
            let proof = $("#proofBoolean").prop("checked");
            let password = $("#pwdBoolean").prop("checked");
            let password2 = $("#pwdBoolean2").prop("checked");
            let nickName = $("#nickBoolean").prop("checked");
            let phone = $("#phoneBoolean").prop("checked");

            if (!name) {
              showModal("이름을 다시 확인해주세요.");
              return false;
            } else if(!email || !email2 || !email3) {
              showModal("이메일을 다시 확인해주세요.");
              return false;
            } else if(!proof) {
              showModal("인증 번호를 다시 확인해주세요.");
              return false;
            } else if (!password || !password2) {
              showModal("비밀 번호를 다시 확인해주세요.");
              return false;
            } else if (!nickName) {
              showModal("닉네임을 다시 확인해주세요.");
              return false;
            } else if (!phone) {
              showModal("핸드폰 번호를 다시 확인해주세요.");
              return false;
            } else {
              e.preventDefault();

              $("#registModal").fadeIn();
              $("#goMain").click(function () {
                $("#submitForm")
                  .attr(
                    "action",
                    "${ pageContext.servletContext.contextPath }/member/regist"
                  )
                  .submit();
              });
            }
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

          /* 마우스 커서 이벤트 */
          $(function() {
              $(".onButton").hover(
                function () {
                  $(this).css("color", "black").css("cursor", "pointer");
                },
                function () {
                  $(this).css("color", "white").css("cursor", "default");
                }
              );
            });


      </script>
    </main>

    <jsp:include page="../common/footer.jsp" />

  </body>
</html>

<!-- 모달창 모아두는 곳 -->
<div class="ui mini modal" id="registModal">
  <div class="contents">
    <p class="titles">회원 가입이 완료되었습니다.</p>
    <div class="re-modal-btn">
      <button id="goMain" class="ui button btn">확인</button>
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