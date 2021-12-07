<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>비밀번호 변경</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/modify.css" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    <style>
      .inputpwd {width: 300px; height: 50px; color: gray; border: 3px solid #91c788; border-radius: 10px; padding-left: 2%;} /* 비밀번호 input */
      
      .input-pwd { position: relative; left: 35%; top: 5%;} /* 비밀번호 그룹 */

      .pwd-btn { position: relative;left: 42%; top: 6%; } /* 버튼 그룹 */
      #pwd-sure {background-color: #91c788; width: 80px; height: 40px; border: none; border-radius: 15px;} /* 확인버튼 */
      #pwd-x {background-color: #e2e2e2; width: 80px; height: 40px; border: none; border-radius: 15px;} /* 취소버튼 */

      /* 비밀번호 변경 모달 */
      #pwdhmodal { height: 150px; top: 40%; left: 49%;}

      .pwdcontent { height: 150px; text-align: center; background-color: #91C788 !important;}

      .pwd-content-title {position: relative; top: 15%; font-size: 15px !important;}

      .re-modal-btn {position: relative; top: 20%;}

      .btn {background-color: white !important;}
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/sidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">비밀번호 변경</p>
        <div class="input-pwd">
            <input type="text" class="inputpwd" value="현재 비밀번호">
            <br><br>
            <input type="text" class="inputpwd" value="새로운 비밀번호">
            <br><br>
            <input type="text" class="inputpwd" value="새로운 비밀번호 확인">
            <br><br>
        </div>
        <div class="pwd-btn">
            <input type="button" id="pwd-sure" value="확인">
            <input type="button" id="pwd-x" value="취소">
        </div>
      </div>
    </div>
     <!-- 비밀번호 변경 완료 버튼 모달창 -->
     <div class="ui mini modal" id="pwdhmodal">
      <div class="content pwdcontent">
        <p class="pwd-content-title">비밀번호를 변경하시겠습니까?</p>
        <div class="re-modal-btn">
        <button class="ui button btn">확인</button>
        <button class="ui button btn">취소</button>
      </div>
      </div>
    </div>
    <script>
    $('#pwd-sure').click(function(){
      $('#pwdhmodal').show();
    }); 
    </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>