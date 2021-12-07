<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>학습방 게시물</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

<script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"  src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<style>
img {
	width: 250px;
	text-align: center;
	border: none !important;
}

.content {
	width: 90%;
	border: none !important;
}

.learnTable thead {
  background-color: #e3ffec;
   text-align: center;   
  }

.learnTable tbody {
   text-align: center;   
  }
  
table{
	text-align: center;
}
</style>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mypagesidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<div class="tab3-title">
				<br>
					<table>
						<tr>
							<td><p class="homework" style="float:right;">${ learnigPost.title }</td>
							<td><p class="date" style="float:right;">최종 수정일: ${ learnigPost.reDate }</p></td>
						</tr>
						<tr>
							<td><h3 style="float:left;">${ learnigPost.nickName }</h3></td>
							<td><p class="date" style="float:right;">작성일: ${ learnigPost.writeDate }</p></td>
						</tr>
					</table>
				</div>
              <hr><br>
              <p>${ learnigPost.contents }</p>
              <br><br><br><br><br>
              <h3>첨부파일</h3>
              <p>&nbsp&nbsp homework_chap01.pdf</p>
              <p>&nbsp&nbsp homework_chap02.pdf</p>
              <br><br>
              <h3>제출</h3>
              <hr>
              <div class="plus"><div class="ui icon button plusbtn" style="background-color: #91C788;" 
                data-content="Add users to your feed"><i class="add icon" style="color: white;"></i></div><h4>첨부파일추가</h4></div>
              <br>
              <div class="ui steps">
                <div class="step" style="border: 3px solid #91C788;">
                  <div class="title">익명의잔디1</div>
                  <div class="description">homework_chap01.pdf</div>
                </div>
              </div>
              <div class="ui steps">
                <div class="step" style="border: 3px solid #91C788;">
                  <div class="title">익명의잔디2</div>
                  <div class="description">homework_chap01.pdf</div>
                </div>
              </div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>