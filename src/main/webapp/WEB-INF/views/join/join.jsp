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
            <input type="text" placeholder="이름을 입력하세요" name="name">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">이메일</div>
            <input type="email" placeholder="이메일을 입력하세요" name="email">
            <div class="emailCheck">가입 가능한 이메일입니다.</div>
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">인증번호</div>
            <input type="number"name="proof">
            <div class="authenticationCheck">인증되었습니다.</div>
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">비밀번호</div>
            <input type="password"  name="password">
        </div>
        <div style="font-size: 6px; margin-left: 155px;">최소 10자리 이상: 영어 대문자, 소문자, 숫자, 특수문자 중 2종류 조합</div>
        <br>
        
        <div class="content">
            <div class="title">비밀번호 확인</div>
            <input type="password" name="password2">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">닉네임</div>
            <input type="text" name="nickName">
            <div class="nickNameCheck">이미 존재하는 닉네임입니다.</div>
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">핸드폰번호</div>
            <input type="text" placeholder="-없이 입력해주세요" name="phone">
        </div>

        <br><br><br>
        <div style="align-items: center; width: fit-content; margin: auto;">
            <button id="confirm">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button>
        </div>
        </form>
        
        <script>
        $(function(){
        	$("#confirm").click(function(e){
        		
        		e.preventDefault();
        		
        		$("#registModal").fadeIn();
        		$("#goMain").click(function(){
        			$("#submitForm").attr("action", "${ pageContext.servletContext.contextPath }/member/regist").submit();
        		});
        		
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
