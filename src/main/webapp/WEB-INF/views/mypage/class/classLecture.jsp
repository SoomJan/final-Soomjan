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
	width: 90%;
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

.inputSyle{
	border-radius: 0.5rem;
	border: 1.5px solid green;
	height: 30px;
	padding:2%;
}

.contents{
	resize: none;
	border-radius: 0.5rem;
	border: 1.5px solid green;
	height: 100px;
	padding:2%;
	
}
</style>

<script>

function mokchaToggle(item) {
	if($(item).next().css('display') == 'none'){
		$(item).next().css('display', 'block');
		$(item).html($(item).html().replace("▼", "▲"));
	}else{
		$(item).next().css('display','none');
		$(item).html($(item).html().replace("▲", "▼"));
	}
}
</script>

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
				<c:forEach var="mokcha" items="${ mokchaList }">
					<div class="mokcha">
						<h3 onclick="mokchaToggle(this);">${ mokcha.mokchaName } ▼</h3>
						<div class="mokchaDiv" style="display:none;">
						<input type="text" width="80%" name="contents" readonly="readonly" value="${ mokcha.contents }">
							<c:forEach var="mokchaFile" items="${ mokchaFileList }">
								<c:if test="${ mokcha.mokchaCode eq mokchaFile.mokchaCode }">
									<video class="mokcha" controls
										src="${ pageContext.servletContext.contextPath }/resources/${ mokchaFile.filePath }"></video>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<br>
					<hr>
				</c:forEach>
				<br>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>