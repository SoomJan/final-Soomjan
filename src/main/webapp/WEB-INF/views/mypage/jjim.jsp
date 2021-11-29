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

    <title>찜한 클래스</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/jjim.css" rel="stylesheet"/>

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
      .pro {right: 30%;} /* 검색 */
      .dropdown { position: relative; left: 16%;} /* 정렬 */
      .jjimtable thead tr {text-align: center;} /* 찜한 클래스 테이블 */
      .jjimtable tbody tr td {text-align: center; vertical-align : middle;}
      .jjimtable thead tr th a {color: gray !important;}
      .jjimcheck {position: relative; left: 40px;} /* 체크박스 */
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/sidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">찜한 클래스</p>
        <br><br>
        <div class="dropsearch">
		<select class="ui dropdown">
  			<option value="">정렬순</option>
  			<option value="1">최신클래스순</option>
  			<option value="0">제목순</option>
		</select>
    <div class="ui search">
      <div class="ui icon input pro">
        <input class="prompt" type="text">
        <i class="search icon"></i>
      </div>
      <div class="results"></div>
    </div>
  </div>
  <br><br><br><br><br>
  <div class="unlist-text">
  찜한 클래스가 없습니다.<br>
  새로운 클래스를 추가해주세요.
</div>
<br><br><br>
<table class="ui single line table jjimtable">
  <thead>
    <tr>
      <th colspan="3">클래스정보</th>
      <th><a id="deletebtn">삭제하기</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><div class="ui checked checkbox jjimcheck"><input type="checkbox" checked=""><label></label></div></td>
      <td class="imgtd"><img src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg"></td>
      <td><p class="class-title">만들어보자 '메이플'</p>2021.12.01-2022.03.01(3개월)</td>
      <td>메이플러버</td>
    </tr>
  </tbody>
</table>
      </div>
    </div>
    <!-- 삭제 버튼 모달창 -->
    <div class="ui mini modal" id="deletemodal">
      <div class="content deletecontent">
        <p class="delete-content-title">체크한 클래스를 찜한 클래스<br> 목록에서 삭제하시겠습니까?</p>
        <div class="re-modal-btn">
        <button class="ui button btn">확인</button>
        <button class="ui button btn">취소</button>
      </div>
      </div>
    </div>
    <script>
    $('#deletebtn').click(function(){
      $('#deletemodal').show();
    }); 
    </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>