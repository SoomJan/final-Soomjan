<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>멘티 채팅</title>

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

<link href="${ pageContext.servletContext.contextPath }/resources/css/chat.css" rel="stylesheet" />
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

.reportBtn {
	background: none;
	border: none;
	border-radius: 0.5rem;
	color:darkred;
	font-size: small;
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
			<div class="chatDiv">
				<div class="chatTop">
					<h3>OH! 잔디 </h3>
					<button class="reportBtn" id="reportBtn">신고</button>
				</div>
				<div class="chatBottom">
					<div style="width: 100%;">
						<div class="chatRight" style="background: #e2fcea">
							
							<div class="receiverBox">
								<b class="chatName">OH! 잔디</b><br>
								<div class="messageBox">.</div>
								<div class="chatDate">2021-11-25 11:03</div>
							</div>
							
							<div class="senderBox" align="right">
								<b class="chatName">나</b><br>
								<div class="messageBox sender">.</div>
								<div class="chatDate" >2021-11-25 11:03</div>
							</div>
							
							<div class="senderBox" align="right">
								<b class="chatName">나</b><br>
								<div class="messageBox sender">.</div>
								<div class="chatDate " >2021-11-25 11:03</div>
							</div>
							
							<div class="receiverBox">
								<b class="chatName">OH! 잔디</b><br>
								<div class="messageBox">안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.</div>
								<div class="chatDate">2021-11-25 11:03</div>
							</div>
							
							<div class="senderBox" align="right">
								<b>나</b><br>
								<div class="messageBox sender">안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.</div>
								<div>2021-11-25 11:03</div>
							</div>
							
							<div class="receiverBox">
								<b class="chatName">OH! 잔디</b><br>
								<div class="messageBox">
									안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.</div>
								<div class="chatDate">2021-11-25 11:03</div>
							</div>
							
							<div class="senderBox " align="right">
								<b class="chatName" >나</b><br>
								<div class="messageBox sender">
									안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.안녕하세요 만나서 반갑습니다.</div>
								<div class="chatDate" >2021-11-25 11:03</div>
							</div>
							
						</div>
						<div class="sendMessage" align="center">
							<form id="sendMessageForm" method="post" action="">
								<input class="sendInput" type="text" name="message">
								<input class="sendBtn" type="submit" id="sendBtn" value="전송">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>