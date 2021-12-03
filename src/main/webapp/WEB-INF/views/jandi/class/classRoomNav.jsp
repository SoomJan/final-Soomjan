<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
}

table{
	text-align: center;
	width: 100%;
}

table th{
	text-align: center;
}

</style>
<script>
	function deleteClass(){
		if(confirm(" 해당 클래스를 삭제 하시겠습니까? "+ "(클래스를 듣는 인원이 한명이라도 있으면 삭제할 수 없습니다.)")){
			if( ${ sessionScope.currentCount } < 1){
				location.href="${ pageContext.servletContext.contextPath }/jandi/class/deleteClass";
			}else{
				alert("현재 듣는 인원이 있어서 삭제 할 수 없습니다.");
			}
		}
	};
</script>
</head>
<body>
	<div class="sidebar-content">
		<button class="btn btn-primary" style="float:right" onclick="deleteClass();">삭제</button>
		<p class="title"><b>${ sessionScope.classDTO.title } 클래스룸</b></p>
		<p align="right"><b>인원 ${ sessionScope.currentCount } / ${ sessionScope.classDTO.maxCount } 명</b></p>
		<br>
		<!-- 탭 메뉴 상단 시작 -->
		<table >
			<tr>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/jandi/class/classRoom?classCode=${ classCode }" class="room class">클래스</a></th>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/jandi/class/classLecture" class="room lecture">강의 영상</a></th>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/jandi/class/classLearningBoard" class="room learning">학습방</a></th>
				<th width="25"><a href="${ pageContext.servletContext.contextPath }/jandi/class/classChat" class="room classChat">채팅</a></th>
			</tr>
		</table>
		<br>
		<br>
	</div>
	
</body>
</html>