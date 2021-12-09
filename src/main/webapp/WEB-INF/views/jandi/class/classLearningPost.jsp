<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.areaStyle {
	border: none;
	width: 90%;
	resize: none;
	margin-left:2%;
	border-radius : 10px;
	padding : 1%;
}

.areaStyle:focus {
	outline: 1px solid black;
}

.inputStyle{
	border: none;
	width: 80%;
	text-align: center;
	border-radius : 10px;
}

.inputStyle:focus {
	outline: 1px solid black;
}
  
</style>
<script>
	$(function(){
		
		if('${ requestScope.uploadMessage }' != ''){
			alert('${ requestScope.uploadMessage }');
			console.log('${ requestScope.uploadMessage }');
		}
		
		$('#title').keyup(function(){
			if($('#title').val().length >= 300){
				alert("300byte를 초과할 수 없습니다.");
				$('#title').val().substr(0, 1500);
			}
		});
		
		$('#contents').keyup(function(){
			if($('#contents').val().length >= 1500){
				alert("1500byte를 초과할 수 없습니다.");
				$('#contents').val().substr(0, 1500);
			}
		});
		
		let message = '${ requestScope.modifyMessage }';
		console.log(message);
		
		if( message !== "" ){
			alert(message);
		}
	});
	
	function checkValue(item){
		if($(item).prev().val() != ""){
			$(item).parent().submit();
			alert("업로드를 시작합니다.");
		}else{
			alert("파일을 선택해 주세요.");
		}
		
	}
	
	function modifyPost(){
		
		$('#postForm')
			.prop("action", "${pageContext.servletContext.contextPath }/jandi/class/modifyLearnigPost")
			.submit();
	}
	
	function deletePost(){
		
		if(confirm("해당 게시물을 삭제하시겠습니까?")){
			$('#postForm')
			.prop("action", "${pageContext.servletContext.contextPath }/jandi/class/deleteLearnigPost")
			.submit();
		}
	}
	
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
				<div align="right">
					<button type="button" class="btnStyle btn btn-primary" onclick="modifyPost();">게시물 수정</button>
					&nbsp;&nbsp;&nbsp;<button type="button" class="btnStyle btn btn-primary" onclick="deletePost();">게시물 삭제</button>
				</div>
				<br>
				<form id="postForm" method="post">
					<div>
						<p style="font-size: x-large; font-weight: 700;" align="center">
							<c:if test="${ learnigPost.title == '제목 없음' }">
								<input class="inputStyle" type="text" name="title" id="title" autofocus
									value="" placeholder="제목을 입력해 주세요.">
							</c:if>
							<c:if test="${ learnigPost.title != '제목 없음' }">
								<input class="inputStyle" type="text" name="title" id="title"
									value="${ learnigPost.title }" placeholder="제목을 입력해 주세요.">
							</c:if>
						</p>
						<p align="right">작성일: ${ learnigPost.writeDate }</p>
						<p align="right">최종 수정일: ${ learnigPost.reDate }</p>
					</div>
					<hr>
					<div id="contents">
						<textarea class="areaStyle" id="contents" name="contents" rows="10" wrap="hard"
							placeholder="내용을 입력해 주세요.">${ learnigPost.contents }</textarea>
					</div>
					<input type="hidden" name="postCode" value="${ learnigPost.postCode }">
				</form>
				<br>
				<br>
				<h3>첨부파일</h3>
				<div style="max-height:200px; overflow-y: auto;">
				<c:forEach var="file" items="${ learnigFileList }">
					<c:if test="${ file.email == learnigPost.email }">
						<b style="float:right;">${ file.writeDate }</b>
						<a style="float:left;"href="${pageContext.servletContext.contextPath }/jandi/class/learningPost/download?filePath=${ file.filePath }&fileName=${file.orgFilePath}">${ file.orgFilePath }</a>
						<br>
					</c:if>
				</c:forEach>
				</div>
				<form action="${pageContext.servletContext.contextPath }/jandi/class/uploadLearningFile" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${ learnigPost.postCode }" name="postCode">
					<br><b>파일 업로드</b> <br> <input type="file" name="file" style="border: none;">
					<button type="button" style="float:right;" class="btnStyle formBtn btn btn-primary" onclick="checkValue(this);">파일 추가하기</button>
				</form>
				<br>
				<h3>제출</h3>
				<hr>
				 <div style="max-height:500px; overflow-y: auto;" align="center">
				<c:forEach var="file" items="${ learnigFileList }">
					<c:if test="${ file.email != learnigPost.email }">
					<div class="ui steps">
						<div class="step" style="border: 3px solid #91C788; width:350px;">
							<div class="title">${ file.nickName }</div>
							<div class="description">
								<b style="float:right;">${ file.writeDate }</b>
								<a style="float:left;"href="${pageContext.servletContext.contextPath }/jandi/class/learningPost/download?filePath=${ file.filePath }&fileName=${file.orgFilePath}">${ file.orgFilePath }</a>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>