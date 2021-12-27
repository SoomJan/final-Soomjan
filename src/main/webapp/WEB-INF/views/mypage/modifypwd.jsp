<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>비밀번호 변경</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/modify.css" rel="stylesheet"/>

    <style>
      .inputpwd {width: 300px; height: 50px; border: 3px solid #91c788; border-radius: 10px; padding-left: 2%; margin-top: 5%;} /* 비밀번호 input */
      
      .input-pwd { position: relative; width: 65%; margin: 0 auto; top: 30px; left: 16%;} /* 비밀번호 그룹 */

      .pwd-btn { position: relative; top: 50px; width: 50%; left: 39%;} /* 버튼 그룹 */
      #pwd-sure {background-color: #91c788; width: 80px; height: 40px; border: none; border-radius: 15px; color: white;} /* 확인버튼 */
      #pwd-x {background-color: #e2e2e2; width: 80px; height: 40px; border: none; border-radius: 15px; color: white;} /* 취소버튼 */

      .modal {
        height: 150px;
        top: 40%;
        left: 45%;
      }
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">비밀번호 변경</p>
        <div class="input-pwd">
            <input type="password" class="inputpwd" id="originPwd" placeholder="현재 비밀번호">
            <br><br>
            <input type="password" class="inputpwd" id="newPwd" placeholder="새로운 비밀번호">
            <div class="pwdCheck" style="margin-top: 1%; color:darkgray">
              최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자
              하나 이상
            </div>
            <input type="checkbox" id="pwdBoolean" style="display: none" />
            <input type="password" class="inputpwd" id="newPwd2" placeholder="새로운 비밀번호 확인">
            <div class="pwdCheck2" style="margin-top: 1%;"></div>
            <input type="checkbox" id="pwdBoolean2" style="display: none" />
            <br><br>
        </div>
        <div class="pwd-btn">
            <input type="button" class="onButton" id="pwd-sure" value="확인">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="onButton" id="pwd-x" value="취소">
        </div>
      </div>
    </div>
    <script>

      /* 비밀번호 형식 체크 */
      $(function () {
          $("#newPwd").keyup(function () {
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
          $("#newPwd2").keyup(function () {
            if ($("#newPwd").val() != $("#newPwd2").val()) {
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
      $(function(){
        $('#pwd-sure').click(function(){
          
          let originPwd = $("#originPwd").val();
          let newPwd = $("#newPwd").val();
          let newPwd2 = $("#newPwd2").val();

          let pwdBool = $("#pwdBoolean").prop("checked");
          let pwdBool2 = $("#pwdBoolean2").prop("checked");

          /* 빈값과 정규식, 번호 확인 체크 */
          if(!originPwd) {
            showModal("현재 비밀번호를 입력해주세요.");
            return false;
          } else if (!newPwd || !newPwd2) {
            showModal("새로운 비밀번호를 입력해주세요.");
            return false;
          } else if (originPwd == newPwd) {
            showModal("현재 번호와 새로운 번호가 동일합니다.");
            return false;
          } else if(!pwdBool) {
            showModal("비밀번호 형식을 확인해주세요.");
            return false;
          } else if(!pwdBool2) {
            showModal("확인 비밀번호가 일치하지 않습니다.");
            return false;
          } else {

            /* 비밀번호 수정 */
            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/mypage/modifyPwd",
              type: "post",
              data: {originPwd : originPwd, newPwd : newPwd},
              success: function(data) {
                if(data == "true") {
                  $("#nextModal").fadeIn();
                  $("#goMain").click(function(){
                  location.href="${ pageContext.servletContext.contextPath }/mypage/main";
                  });
                } else if (data == "false") {
                  showModal("기존 비밀번호가 틀렸습니다.");
                } else {
                  showModal("비밀번호 수정에 실패했습니다.");
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
     
      /* 마우스 커서 이벤트 */
      $(".onButton").hover(
        function () {
          $(this).css("color", "black").css("cursor", "pointer");
        },
        function () {
          $(this).css("color", "white").css("cursor", "default");
        }
      );      
    </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
<!-- 모달 창-->

<div class="ui mini modal" id="nextModal">
  <div class="contents">
    <p class="titles">비밀번호가 수정되었습니다.</p>
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