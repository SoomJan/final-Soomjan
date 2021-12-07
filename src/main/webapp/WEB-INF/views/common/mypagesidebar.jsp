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
      href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <script src="resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
    <style>
    #endmodal { height: 600px; left: 40%; top: 20%; }
    .modal-header{text-align: center;}
    .modal-content{height: 533px;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { position: relative; left: 40%; top: 11%;}
    .inputpwd {
            width: 600px; 
            height: 50px; 
            color: gray;
            border: 3px solid #91c788; 
            border-radius: 10px; 
            padding-left: 2%;
            position: relative;
            left: 4%;
        }
    
    #endbtnhmodal {
       height: 150px;
      top: 45%;
      left: 50%;
    }
    .end-content-title {font-size: 15px; text-align: center; position: relative; top: 7px;}
    .re-modal-btn {position: relative; left: 27%; top: 7px; background-color: white;}
    .endcontent {height: 150px;}
    #comp-btn{background-color: #91c788;}
    </style>
  </head>

  <link
    rel="stylesheet"
    type="text/css"
    href="semantic/dist/semantic.min.css"
  />
  <script src="semantic/dist/semantic.min.js"></script>

  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>환잔디 님</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <h3>클래스 관리</h3>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="my/attending">수강중인 클래스</a></li>
          <li><a href="#">수강완료 클래스</a></li>
          <li><a href="#">찜한 클래스</a></li>
          <li><a href="#">구매내역</a></li>
          <li><a href="#">클래스 후기</a></li>
        </ul>
        <ul>
          <h3>설정</h3>
          <!-- <hr class="border-1px-black" /> -->
          <li><a href="#">정보수정</a></li>
          <li><a href="#">비밀번호 변경</a></li>
          <li><a href="#" id="endbtn">회원탈퇴</a></li>
        </ul>
      </div>
    </div>
  <!-- 회원탈퇴 모달창 -->
  <div class="ui small modal" id="endmodal">
     <div class="header modal-header"><h2>회원탈퇴</h2></div>
      <div class="content modal-content">
          <br>
          <h3>회원탈퇴 안내사항</h3>
          <br>
          <div class="modal-content-text">숨은잔디에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?<br>
          그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!<br>
          감사합니다. <br>
          <br>
          1. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않으며, <br>
          &nbsp&nbsp 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.<br>
          2. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.<br>
          3. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.<br>
          <hr>
          <input type="text" class="inputpwd" value="현재 비밀번호">
          </div>
            <div class="context-modal-btn">
            <button class="ui button btn" id="con-btn" style="background-color: #91C788;">확인</button>
            <button class="ui button btn">취소</button>
            </div>
          </div>
        </div>
      <!-- 회원탈퇴 완료 버튼 모달창 -->
      <div class="ui mini modal" id="endbtnhmodal">
        <div class="content endcontent">
          <p class="end-content-title">회원탈퇴가 완료되었습니다.<br>
          메인화면으로 되돌아갑니다.</p>
          <div class="re-modal-btn">
          <button class="ui button btn" id="comp-btn">확인</button>
          <button class="ui button btn">취소</button>
        </div>
        </div>
      </div>
      
  <script>
  $(function(){
    $('#endbtn').click(function(){
      $('#endmodal').show();
    }); 
  });
  
  $(function(){
    $('#con-btn').click(function(){
      $('#endbtnhmodal').show();
    });
  });
  </script>
  </body>

  <script src="css/ie10-viewport-bug-workaround.js"></script>
</html>
