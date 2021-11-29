<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>강의 영상</title>

<link
	href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagemain.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">

<link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://pagead2.googlesyndication.com/pagead/show_ads.js"></script>

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

.mokcha video {
	width: 600;
	margin: 10px;
}

.mokcha p{
	margin: 10px;
}

.mokcha{
	width: 100%;
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
				<h2>4개의 목차</h2>
				<hr>
				<div class="mokcha">
					<h3>chap01. 리터럴</h3>
					<p>목차 설명</p>
					<video width="550" src="${pageContext.servletContext.contextPath }/resources/videos/cat.mp4" controls></video>
				</div>
				<br>
				<div class="mokcha">
					<h3>chap02. 변수</h3>
					<p>목차 설명</p>
					<video width="550" src="${pageContext.servletContext.contextPath }/resources/videos/cat.mp4" controls></video>
				</div>
				<br>
				<div class="mokcha">
					<h3>chap03. 리터럴</h3>
					<p>목차 설명</p>
					<video width="550" src="${pageContext.servletContext.contextPath }/resources/videos/cat.mp4" controls></video>
				</div>
				<br>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>