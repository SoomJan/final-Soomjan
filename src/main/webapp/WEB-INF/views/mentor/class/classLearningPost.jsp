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
.btnStyle {
	padding: 5px;
	background-color: #91c788;
	border-radius: 0.5rem;
	font-size: 12px;
	border-color: #91c788;
	float: right;
}

img {
	width: 250px;
	text-align: center;
	border: none !important;
}

.content {
	width: 90%;
	border: none !important;
}
</style>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<div class="tab3-title">
					<button type="button" class="btnStyle">수정</button>
					<br>
					<h3>Oh! 잔디</h3>
					<p class="homework">chap01 숙제</p>
					<p class="date">2021.11.18</p>
				</div>
				<hr>
				<br>
				<p>chap1 숙제입니다</p>
				<p>열심히 풀어보세요!!!</p>
				<br>
				<br>
				<br>
				<br>
				<br>
				<h3>첨부파일</h3>
				<p>&nbsp&nbsp homework_chap02.pdf</p>
				<input type="file"> <br>
				<br>
				<h3>제출</h3>
				<hr>
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