<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>클래스룸</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

.title {
	width: 100%;
	font-size: 30px;
	text-align: center;
	color:#448817;
}

.room {
	font-size: 20px;
	background: none;
	border: none;
	font-weight: 2px;
	color:black;
}
table{
	text-align: center;
}
</style>

</head>
<body>
	<div class="sidebar-content">
		<p class="title"><b>${ sessionScope.classDTO.title } 클래스룸</b></p>
		<br>
		<!-- 탭 메뉴 상단 시작 -->
		<table style="width: 100%">
			<tr>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=${ classCode }" class="room class">클래스</a></th>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/classLecture" class="room lecture">강의 영상</a></th>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/classLearningBoard" class="room learning">학습방</a></th>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/mypage/class/mypageClassChat" class="room classChat">채팅</a></th>
			</tr>
		</table>
		<br>
		<br>
	</div>
</body>
</html>