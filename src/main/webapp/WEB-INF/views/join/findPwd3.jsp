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
            <div class="title">새로운 비밀번호</div>
            <input type="password" name="pwd">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">비밀번호 확인</div>
            <input type="password" name="pwd2">
        </div>


       
        <br><br><br><br><br><br><br><br>
        <div style="align-items: center; width: fit-content; margin: auto;">
            <button onclick="show1();">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button onclick="show2();">취소</button>
        </div>

        <div id="modal-page1">
          <p>비밀번호가 일치하지 않습니다.<br>다시 입력해주세요</p>
          <button onclick="off1();">확인</button>
        </div>

        <script>
          function show1(){
            document.getElementById("modal-page1").style.visibility="visible";
          }

          function off1(){
            document.getElementById("modal-page1").style.visibility="hidden";
          }

        </script>

        <div id="modal-page2">
          <p>비밀번호가 변경되었습니다.</p>
          <button onclick="off2();">확인</button>
        </div>

        <script>
          function show2(){
            document.getElementById("modal-page2").style.visibility="visible";
          }

          function off2(){
            document.getElementById("modal-page2").style.visibility="hidden";
          }

        </script>



    </main>










    <jsp:include page="../common/footer.jsp" />


    <script src="css/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>