<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>클래스룸</title>

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
.classImg{
	width: 80%;
	text-align: center;
	border: 1px solid green;
	border-radius: 0.5rem;
}

.content {
	width: 90%;
	border: none !important;
}

.areaStyle {
	border: none;
	width: 100%;
	resize: none;
}

.areaStyle:focus {
	outline: none;
}

</style>
<script>
$(function(){
	if('${ requestScope.uploadMessage }' != ''){
		alert('${ requestScope.uploadMessage }');
		console.log('${ requestScope.uploadMessage }');
	}
	
	let message = '${ requestScope.modifyMessage }';
	if( message !== "" ){
		alert(message);
	}
	
	let tags = $('#tag').val().replace(" ","");
	let tagArr = tags.split('#');
	for(let tag of tagArr){
		if(tag !== ""){
			$('.tag').append(
			"<div class='ui button' style='margin:3px;' data-position='top left'>"
			+ tag + "</div>");
		}
	}
	
	$('#tagCheck').html($('#tag').val().length);
	$('#contentsCheck').html($('#classContents').val().length);
	
	$('#modifyClassFormBtn').click(function(){
		if(confirm("강의 소개 페이지를 수정하시겠습니까?")){
			$('#modifyClassForm').submit();
		}
	});
	
});

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
</script>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<form action="${ pageContext.servletContext.contextPath }/jandi/class/modifyClass" method="post" id="modifyClassForm">
				<button type="button" class="btn btn-primary" style="float:right" id="modifyClassFormBtn">수정</button>
				<h2>강의 소개</h2>
				<hr>
				<p style="float:right;">( <span id="contentsCheck"></span> / 500자 )</p>
				<br>
				<div id="contents">
					<textarea class="areaStyle" id="classContents" name="contents" rows="10" wrap="hard"
						placeholder="강의 소개를 입력해주세요." onkeyup="checkLength(this, $('#contentsCheck'), 500);">${ classDTO.contents }</textarea>
				</div>
				<br>
				<br>
				<h4>썸네일 <button type="button" style="margin-left:50px; border-radius:1rem;  border: 3px solid #91C788; background: none; padding:5px;"
						data-toggle="modal" data-target="#imageModal">썸네일 변경하기</button>
				</h4>
				<div align="center">
					<img class="classImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ classDTO.filePath }">
				</div>
				<br>
				<br>
				<div class="tag">
				</div>
				<br>
				<p class="tagName">태그 수정   ( <span id="tagCheck"></span> / 150자 ) </p>
				<textarea class="areaStyle" name="tag" id="tag" rows="2" wrap="hard" 
					placeholder="태그를 입력해주세요." onkeyup="checkLength(this, $('#tagCheck'), 150);">${ classDTO.tag }</textarea>
				<hr>
				<h2>강의 목차</h2>
				<c:forEach var="mokcha" items="${ mokchaList }">
					<p class="contents">
						${ mokcha.mokchaName }
					</p>
				</c:forEach>
				<hr>
				<br>
				<div class="after">
					<h2>후기</h2>
					<p>총 5개</p>
				</div>
				<div class="ui card" id="aftercard" style="margin:5%; width:90%; ">
					<div class="content">
						<div class="left aligned header afterheader">
							<i class="star icon"></i> <i class="star icon"></i> <i
								class="star icon"></i> <i class="star icon"></i> <i
								class="star icon"></i>
						</div>
						<div class="left aligned description">
							<p>알차고 좋은 구성이였습니다! 잘들었습니다.</p>
						</div>
					</div>
					<div class="extra content">
						<div class="right aligned author">
							<p>익명의 잔디 2021.11.18</p>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- Modal -->
		<div class="modal fade" id="imageModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">썸네일 변경하기</h4>
					</div>
					<div class="modal-body" align="center">
						<form action="${pageContext.servletContext.contextPath }/jandi/class/uploadClassFile" 
							method="post" enctype="multipart/form-data" id="uploadForm">
							<input type="hidden" value="${ classDTO.classCode }" name="classCode">
							<br>
							<b>파일 업로드</b> 
							<br> 
							<input type="file" id="fileInput" name="file" style="border: none;" accept="image/*">
							<br>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btnBD"
							data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="modifyBtn">변경하기</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('#modifyBtn').click(function() {
				if ($('#fileInput').val() != "") {
					$('#uploadForm').submit();
				}else{
					alert("변경할 썸네일을 선택해 주세요.");
				}
			});
		</script>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>