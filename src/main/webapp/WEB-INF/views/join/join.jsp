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
   <link href="${ pageContext.servletContext.contextPath }/resources/css/join.css" rel="stylesheet" />
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
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
            <div class="thumbnail" id="ttext">회원가입 </div>
        </div>

        <br><br>
        
        <form method="post" id="submitForm">
        <div class="content">
            <div class="title">이름</div>
            <input type="text" placeholder="이름을 입력하세요" name="name" id="name">
            <div class="nameCheck"></div>
            <input type="checkbox" id="nameBoolean" style="display: none;">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">이메일</div>
            <input type="text" placeholder="이메일을 입력하세요" name="email" id="email">
            <button onclick="return duplicationCheck()">중복확인</button>
            <button type="button" onclick="return sendMail()">이메일 인증하기</button>
            <div class="emailCheck"></div>
            <input type="checkbox" id="emailBoolean" style="display: none;">
            <input type="checkbox" id="emailBoolean2" style="display: none;">
            <input type="checkbox" id="emailBoolean3" style="display: none;">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">인증번호</div>
            <input type="text" name="proof" id="proof">
            <input type="text" id="proof2" style="display: none;">
            <div class="proofCheck"></div>
            <input type="checkbox" id="proofBoolean" style="display: none;">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">비밀번호</div>
            <input type="password"  name="password" id="password">
            <div class="pwdCheck">최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상</div>
            <input type="checkbox" id="pwdBoolean" style="display: none;">
        </div>
        <br>
        
        <div class="content">
            <div class="title">비밀번호 확인</div>
            <input type="password" name="password2" id="password2">
            <div class="pwdCheck2"></div>
            <input type="checkbox" id="pwdBoolean2" style="display: none;">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">닉네임</div>
            <input type="text" name="nickName" id="nickName">
            <button onclick="return duplicationCheck2()">중복확인</button>
            <input type="checkbox" id="nickBoolean" style="display: none;">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">핸드폰번호</div>
            <input type="text" placeholder="-없이 입력해주세요" name="phone" id="phone">
            <div class="phoneCheck"></div>
            <input type="checkbox" id="phoneBoolean" style="display: none;">

        </div>

        <br><br><br>
        <div style="align-items: center; width: fit-content; margin: auto;">
            <button id="confirm">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button>
        </div>
        </form>
        
        <script>
          /* 이름 형식 체크 */
          $(function(){
        	 $("#name").keyup(function(){

             let filter = /^[가-힣]+$/;

             if(!filter.test($(this).val())){
               $(".nameCheck").html("올바르지 않은 이름 형식입니다.").css("color","red");
               $(this).focus().css("background", "lightpink");
               $("#nameBoolean").prop("checked", false);
             } else {
               $(".nameCheck").html("올바른 이름 형식입니다.").css("color", "blue");
               $(this).focus().css("background", "palegreen");
               $("#nameBoolean").prop("checked", true);
             }
           });
          });

          /* 이메일 중복 체크 */
          function duplicationCheck() {
            let email = $("#email").val();

            if(!email) {
              $("#nullModal").fadeIn();
              $(".btn").click(function(){
                $("#nullModal").fadeOut();
              });
            } else {

            $.ajax({
              url : "${ pageContext.servletContext.contextPath }/member/idDupCheck",
              type : "post",
              data : {email : email},
              success: function(data) {
                if(data == 'true') {
                  $("#dupModal").fadeIn();
                  $(".btn").click(function(){
                    $("#dupModal").fadeOut();
                    $("#emailBoolean").prop("checked", false);
                  });
                } else {
                  $("#notDupModal").fadeIn();
                  $(".btn").click(function(){
                    $("#notDupModal").fadeOut();
                  $("#emailBoolean").prop("checked", true);
                  });
                }
              },
              error: function(error) {
                console.log(error)
              }
            });
          }
            return false;
          }
          
          /* 이메일 인증 */
          function sendMail() {

            let email = $("#email").val();

            $.ajax({
              url: "${ pageContext.servletContext.contextPath }/sendMail",
              type: "post",
              data: {email : email},
              success: function(data) {
                if(!data) {
                  alert("이메일 전송 실패");
                } else {
                  alert("이메일 전송 완료");
                  $("#proof2").val(data);
                }
              },
              error: function(error) {
                console.log(error);
              }
            });
            return false;
          }

          /* 인증번호 확인 */
          $(function(){
            $("#proof").keyup(function(){

              let num1 = $(this).val();
              let num2 = $("#proof2").val();

              if(num1 == num2) {
                $(".proofCheck").html("인증 번호가 일치합니다.").css("color", "blue");
               $(this).focus().css("background", "palegreen");
               $("#proofBoolean").prop("checked", true);
              } else {
                $(".proofCheck").html("인증번호가 일치하지 않습니다.").css("color","red");
               $(this).focus().css("background", "lightpink");
               $("#emailBoolean2").prop("checked", false);
              }
            });
          });

          /* 이메일 형식 체크 */
          $(function(){
        	 $("#email").keyup(function(){

             let filter = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

             if(!filter.test($(this).val())){
               $(".emailCheck").html("올바르지 않은 이메일 형식입니다.").css("color","red");
               $(this).focus().css("background", "lightpink");
               $("#emailBoolean2").prop("checked", false);
             } else {
               $(".emailCheck").html("올바른 이메일 형식입니다.").css("color", "blue");
               $(this).focus().css("background", "palegreen");
               $("#emailBoolean2").prop("checked", true);
             }
           });
          });

          /* 핸드폰 번호 형식 체크 */
          $(function(){
        	 $("#phone").keyup(function(){

             let filter = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

             if(!filter.test($(this).val())){
               $(".phoneCheck").html("올바르지 않은 번호 형식입니다.").css("color","red");
               $(this).focus().css("background", "lightpink");
               $("#phoneBoolean").prop("checked", false);
             } else {
               $(".phoneCheck").html("올바른 번호 형식입니다.").css("color", "blue");
               $(this).focus().css("background", "palegreen");
               $("#phoneBoolean").prop("checked", true);
             }
           });
          });

          /* 비밀번호 형식 체크 */
          $(function(){
        	 $("#password").keyup(function(){

             let filter = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

             if(!filter.test($(this).val())){
               $(".pwdCheck").html("올바르지 않은 비밀번호 형식입니다.").css("color","red");
               $(this).focus().css("background", "lightpink");
               $("#pwdBoolean").prop("checked", false);
             } else {
               $(".pwdCheck").html("올바른 비밀번호 형식입니다.").css("color", "blue");
               $(this).focus().css("background", "palegreen");
               $("#pwdBoolean").prop("checked", true);
             }
           });
          });

          /* 비밀번호 확인 체크 */
          $(function(){
            $("#password2").keyup(function(){

              if($("#password").val() != $("#password2").val()) {
                $(".pwdCheck2").html("비밀번호가 일치하지 않습니다.").css("color", "red");
                $(this).focus().css("background", "lightpink");
                $("#pwdBoolean2").prop("checked", false);
              } else {
                $(".pwdCheck2").html("비밀번호가 일치합니다.").css("color", "blue");
               $(this).focus().css("background", "palegreen");
               $("#pwdBoolean2").prop("checked", true);
              }
            });
          });

          /* 닉네임 중복 체크 */
          function duplicationCheck2() {
            let nickName = $("#nickName").val();

            if(!nickName) {
              $("#nullModal2").fadeIn();
              $(".btn").click(function(){
                $("#nullModal2").fadeOut();
              });
            } else {

            $.ajax({
              url : "${ pageContext.servletContext.contextPath }/member/nickDupCheck",
              type : "post",
              data : { nickName: nickName},
              success: function(data) {
                if(data == 'true') {
                  $("#dupModal2").fadeIn();
                  $(".btn").click(function(){
                    $("#dupModal2").fadeOut();
                    $("#nickBoolean").prop("checked", false);
                  });
                } else {
                  $("#notDupModal2").fadeIn();
                  $(".btn").click(function(){
                    $("#notDupModal2").fadeOut();
                    $("#nickBoolean").prop("checked", true);
                  });
                }
              },
              error: function(error) {
                console.log(error)
              }
            });
          }
            return false;
          }

          /* 전체 조건 체크 */
        $(function(){
        	$("#confirm").click(function(e){

            let name = $("#nameBoolean").prop("checked");
            let email = $("#emailBoolean").prop("checked");
            let email2 = $("#emailBoolean2").prop("checked");
            let email3 = $("#emailBoolean3").prop("checked");
            let password = $("#pwdBoolean").prop("checked");
            let password2 = $("#pwdBoolean2").prop("checked");
            let nickName = $("#nickBoolean").prop("checked");
            let phone = $("#phoneBoolean").prop("checked");

            if(!name) {
              $("#nameModal").fadeIn();
              $(".btn").click(function(){
                $("#nameModal").fadeOut();
              });
              return false;
            } else if(!email || !email2 || email3) {
              $("#emailModal").fadeIn();
              $(".btn").click(function(){
                $("#emailModal").fadeOut();
              });
              return false;
            } else if(!password || !password2) {
              $("#pwdModal").fadeIn();
              $(".btn").click(function(){
                $("#pwdModal").fadeOut();
              });
              return false;
            } else if(!nickName) {
              $("#nickModal").fadeIn();
              $(".btn").click(function(){
                $("#nickModal").fadeOut();
              });
              return false;
            } else if(!phone) {
              $("#phoneModal").fadeIn();
              $(".btn").click(function(){
                $("#phoneModal").fadeOut();
              });
              return false;
            } else {

        		e.preventDefault();
        		
        		$("#registModal").fadeIn();
        		$("#goMain").click(function(){
        			$("#submitForm").attr("action", "${ pageContext.servletContext.contextPath }/member/regist").submit();
        		});
          }
        	});
        });
        </script>

    </main>

    <jsp:include page="../common/footer.jsp" />


    <script src="css/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
<!-- 모달창 모아두는 곳 -->
<div class="ui mini modal" id="registModal">
  <div class="contents">
    <p class="titles">회원 가입에 성공하셨습니다.</p>
    <div class="re-modal-btn">
    <button id="goMain" class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nullModal">
  <div class="contents">
    <p class="titles">이메일을 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="dupModal">
  <div class="contents">
    <p class="titles">중복된 이메일입니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="notDupModal">
  <div class="contents">
    <p class="titles">사용 가능한 이메일입니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nullModal2">
  <div class="contents">
    <p class="titles">닉네임을 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="dupModal2">
  <div class="contents">
    <p class="titles">중복된 닉네임입니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="notDupModal2">
  <div class="contents">
    <p class="titles">사용 가능한 닉네임입니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nameModal">
  <div class="contents">
    <p class="titles">이름을 다시 확인해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="emailModal">
  <div class="contents">
    <p class="titles">이메일을 다시 확인해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="pwdModal">
  <div class="contents">
    <p class="titles">비밀번호를 다시 확인해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nickModal">
  <div class="contents">
    <p class="titles">닉네임을 다시 확인해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="phoneModal">
  <div class="contents">
    <p class="titles">핸드폰 번호를 다시 확인해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>



