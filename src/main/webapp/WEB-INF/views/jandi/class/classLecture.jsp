<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>강의 영상</title>

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

.mokcha {
	width: 100%;
}

.mokcha input {
	border: none;
	width: 80%;
	margin: 10px;
}

.mokcha video {
	width: 600;
	margin: 10px;
}

.newMokcha {
	width: 100%;
	padding-left: 10%;
}

.newMokcha input {
	width: 80%;
	margin: 10px;
}

.newMokcha textarea {
	width: 80%;
	margin: 10px;
}

input {
	border-radius: 0.2rem;
	border: 1px solid black;
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
				<h2>1개의 목차</h2>
				<hr>
				<c:forEach var="mokcha" items="${ mokchaList }">
					<div class="mokcha">
						<button type="button" class="btnStyle">수정</button>
						<h3>${ mokcha.mokchaName }</h3>
						<input type="text" width="80%" name="contents" readonly="readonly"
							value="${ mokcha.contents }">
						<video width="600" src="${pageContext.servletContext.contextPath }/resources/videos/cat.mp4" controls></video>
					</div>
					<br>
				</c:forEach>
				<!-- 유튜브 영상 링크... 왜 안되나요..ㅜㅠ -->
				<!-- <iframe width="560" height="315"
					src="https://www.youtube.com/embed/cbuZfY2S2UQ"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen>
				</iframe> -->
				<hr>
				<div class="newMokcha">
					<form action="" method="post">
						목차 제목<br> <input type="text" name="mockcha"
							placeholder="목차 제목을 입력하세요."> <br> 목차 내용<br>
						<textarea name="contents" placeholder="목차 내용을 입력하세요."></textarea>
						<br> 영상 업로드<br> <input type="file" style="border: none;">
						<button type="submit" class="btnStyle" style="margin: 10px;">
						목차 추가하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>