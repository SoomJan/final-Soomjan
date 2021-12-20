<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Signin Template for Bootstrap</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="${ pageContext.servletContext.contextPath }/resources/css/matching/matching_mantee.css"
	rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/chat.css?" rel="stylesheet" />
<link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

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

.reportBtn {
	background: none;
	border: none;
	border-radius: 0.5rem;
	color:darkred;
	font-size: small;
}
.btn-primary {
	width: 30px; 
	height:30px;
	color: #fff;
	background-color: #91C788;
	border-color: #91C788;
	border-radius: 0.3rem;
	border-style: none;
}

.btn-primary.active, .btn-primary.focus, .btn-primary:active,
	.btn-primary:focus, .btn-primary:hover, .open>.dropdown-toggle.btn-primary
	{
	color: #fff;
	background-color: #599A4E;
	border-color: #599A4E;
	
}

.btn-primary:hover {
	background-color: #599A4E;
	border-color: #599A4E;
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

.modalBtn{
	width:auto;
	height:auto;
	padding: 8px;
}



</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="../common/matching_mantee_sidebar.jsp" />
	<div class="sidebar-content">
	<br><br>
		<div class="chatDiv">
				<div class="chatTop">
				
					<h3>${ sessionScope.classDTO.nickName } </h3>
					<button class="reportBtn" id="reportBtn" data-toggle="modal" data-target="#reportModal">신고</button>
				</div>
				<div class="chatBottom">
					<div style="width: 100%;">
						<div class="chatRight" style="background: #e2fcea">
							
						</div>
						<div align="center" style="background: #e2fcea; border-left: 1px solid green; display:none;" id="typingDiv">
							<i class="comment alternate icon"></i> 상대방이 메시지를 작성중입니다...
						</div>
						<div class="sendMessage" align="center">
							<button class="btn-primary" style="float:left; padding:4px; margin-left:10px; " id="imgBtn" data-toggle="modal" data-target="#sendImgModal">
								<i class="images outline icon"></i>
							</button>
							<textarea class="messageArea" id="msg"></textarea>
							<input class="sendBtn" type="button" id="sendBtn" value="전송" >
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="sendImgModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">파일 첨부</h4>
				</div>
				<div class="modal-body" align="center">
					<br>	
					<form id="chatFileForm" method="post" enctype="multipart/form-data">
						<input type="file" name="sendFile" id="sendFile" accept="image/*">
					</form>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="closeBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn-primary modalBtn" id="sendImgBtn">전송</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회원 신고</h4>
				</div>
				<div class="modal-body" align="center">
					<br>	
					<form action="${pageContext.servletContext.contextPath }/mypage/class/reportMember" id="reportModalForm" method="post" enctype="multipart/form-data">
						<b>신고 카테고리(필수): <select id="repTypeCode" name="repTypeCode">
						<c:forEach var="reportState" items="${ reportStateList }">
							<option value="${ reportState.REP_TYPE_CODE }">${ reportState.REP_TYPE }</option>
						</c:forEach>
						</select>
						</b>
						<br><br>
						<b>이미지 첨부</b> (선택)
						<br>
						<input type="file" name="repImage" id="repImage" accept="image/*">
						<br>
						<b>신고 사유(필수)</b><br>
						<textarea class="contents" name="repContents" style="width:300px;"></textarea>
						<br><br>
						타당한 사유 및 근거 없는 신고는 해당 신고가 반려될 수 있습니다.
						<input name="repEmail" type="hidden" value="${ sessionScope.classDTO.email }">
					</form>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="reportCloseBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn-primary modalBtn" id="reportModalBtn">신고하기</button>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../common/footer.jsp" />s
</body>
</html>
