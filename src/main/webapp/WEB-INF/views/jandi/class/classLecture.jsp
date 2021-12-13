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

	function checkValue(item){
		if($(item).prev().val() != ""){
			$(item).parent().submit();
			alert("업로드를 시작합니다.");
		}else{
			alert("파일을 선택해 주세요.");
		}
	}
	
	function mokchaToggle(item) {
		if($(item).next().css('display') == 'none'){
			$(item).next().css('display', 'block');
			$(item).html($(item).html().replace("▼", "▲"));
		}else{
			$(item).next().css('display','none');
			$(item).html($(item).html().replace("▲", "▼"));
		}
	}
	
	function deleteMokcha(item){
		console.log($(item).next());
		
		if(confirm("해당 목차를 삭제하시면 안의 내용까지 전부 삭제됩니댜. 삭제하시겠습니까?")){
			$(item).parent().submit();
		}
	}
	
	function checkLength(inputItem, spanItem, maxLength){
		let $item = $(inputItem);
		spanItem.html($item.val().length);
		
		if($item.val().length > maxLength){
			alert(maxLength + "자를 초과할 수 없습니다.");
			$item.val($item.val().substr(0, (maxLength-1)));
			$item.focus();
			spanItem.html($item.val().length);
		}
	}
	
	$(function(){
		if('${ requestScope.uploadMessage }' != ''){
			alert('${ requestScope.uploadMessage }');
			console.log('${ requestScope.uploadMessage }');
		}
	});
	
	
</script>
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
						<form action="${pageContext.servletContext.contextPath }/jandi/class/deleteMokcha" method="post">
							<button type="button" class="btnStyle btn btn-primary" onclick="deleteMokcha(this);">삭제</button>
							<input type="hidden" name="mokchaCode" value="${ mokcha.mokchaCode }">
						</form>
						<h3 onclick="mokchaToggle(this);">${ mokcha.mokchaName } ▼</h3>
						<div class="mokchaDiv" style="display:none;">
						<input type="text" width="80%" name="contents" readonly="readonly" value="${ mokcha.contents }">
							<c:forEach var="mokchaFile" items="${ mokchaFileList }">
								<c:if test="${ mokcha.mokchaCode eq mokchaFile.mokchaCode }">
									<video class="mokcha" controls
										src="${ pageContext.servletContext.contextPath }/resources/${ mokchaFile.filePath }"></video>
								</c:if>
							</c:forEach>
							<form action="${pageContext.servletContext.contextPath }/jandi/class/uploadMokchaFile" method="post" enctype="multipart/form-data">
								<div>
								<input type="hidden" value="${ mokcha.mokchaCode }" name="mokchaCode">
								<br><b>영상 업로드</b> <br> <input type="file" name="file" style="border: none;" accept="video/*">
								<button type="button" class="btnStyle sendBtn btn btn-primary" onclick="checkValue(this);">영상 추가하기</button>
								</div>
							</form>
						</div>
					</div>
					<br>
					<hr>
				</c:forEach>
				<!-- 유튜브 영상 링크... 왜 안되나요..ㅜㅠ -->
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/cbuZfY2S2UQ"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen>
				</iframe>
				<div class="newMokcha">
					<form action="${pageContext.servletContext.contextPath }/jandi/class/registLecture" method="post">
						목차 제목 ( <span id="titleCheck">0</span> / 30자 )<br> 
						<input type="text" class="inputSyle" name="mockchaName" 
							placeholder="목차 제목을 입력하세요." onkeyup="checkLength(this, $('#titleCheck'), 30);"> 
						<br> 목차 내용( <span id="contentsCheck">0</span> / 500자 )<br>
						<textarea name="contents" class="contents" placeholder="목차 내용을 입력하세요." onkeyup="checkLength(this, $('#contentsCheck'), 500);" ></textarea>
						<button type="submit" class="btnStyle btn btn-primary" style="margin: 10px;">목차 추가하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>