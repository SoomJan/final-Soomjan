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
   <link href="${ pageContext.servletContext.contextPath }/resources/css/findPwd.css" rel="stylesheet" />
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

    <main class="fullJoin">
       
        <div class="head">
            <div class="thumbnail" id="timage"><img src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png" style="width: 60px; height: 60px; "></div>
            <div class="thumbnail" id="ttext">비밀번호 찾기 </div>
        </div>
 
        <br><br><br><br><br><br>
        <div class="content">
            <div class="title">이름</div>
            <input type="text" placeholder="이름을 입력하세요" name="name">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">이메일</div>
            <input type="email" placeholder="이메일을 입력하세요" name="name">
            <div class="emailCheck">가입 가능한 이메일입니다.</div>
        </div>

       
        <br><br><br><br><br><br><br><br>
        <div style="align-items: center; width: fit-content; margin: auto;">
            <button type="submit" onclick="finishbtn();">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button>
        </div>
        
        


    </main>










    <jsp:include page="../common/footer.jsp" />


    <script src="css/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>