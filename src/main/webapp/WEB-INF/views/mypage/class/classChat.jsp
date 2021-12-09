<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script src="http://125.132.252.115:3000/socket.io/socket.io.js"></script>
<script>

	function getFormatDate(chat_date){
		let year = chat_date.getFullYear() 
		let month = chat_date.getMonth() + 1;
		month = month < 10 ? '0' + month :  month;
		
		let date = chat_date.getDate();
		date = date < 10 ? '0' + date :  date;
		
		let hour = chat_date.getHours();
		hour = hour < 10 ? '0' + hour :  hour;
		
		let minutes = chat_date.getMinutes();
		minutes = minutes < 10 ? '0' + minutes :  minutes;
		
		return year + "-" + month + "-" + date + " " + hour + ":" + minutes;
	}

	function addSenderBox(chat){
		let $senderBox = 
			"<div class='senderBox' align='right'><b class='chatName'>"
			+ "나"
			+"</b><br><div class='messageBox sender'>" 
			+ chat.chat_contents 
			+ "</div><div class='chatDate' >"
			+ chat.chat_date
			+ "</div></div><br>";
			
			$('.chatRight').append($senderBox);
	};
	
	function addReceiveBox(chat){
		let $receiverBox = 
			"<div class='receiverBox'><b class='chatName'>"
			+ chat.nickName 
			+ "</b><br><div class='messageBox'>"
			+ chat.chat_contents
			+ "</div><div class='chatDate'>"
			+ chat.chat_date
			+ "</div></div><br>";
			
			$('.chatRight').append($receiverBox);
	};
	
		
	$(document).ready(function(){
		
		const email = "${ sessionScope.loginMember.email }";
		const chatCode = 2;
		// 테스트 채팅방 정보 
		let chatInfo = {
			email: email,
			chat_code: chatCode
		};
		
		if(chatInfo != null){
			
			let socket = io("http://125.132.252.115:3000/classChat");
			
			socket.emit("chat_info", chatInfo);
			
			socket.on("connect_user", function(chatInfo){
				console.log(chatInfo.email);
			});
			
			// 채팅 이력 불러오기
			socket.on("receive_msg", function(chat_log){
				console.log(chat_log);
				for(const chat of chat_log){
					if(chat.email === chatInfo.email){
						addSenderBox(chat);
					}else {
						addReceiveBox(chat);
					}
					
					$('.chatRight').scrollTop($('.chatRight').prop('scrollHeight'));
				}
			});
			
			
			$('#msg').keyup(function(key){
				if(key.keyCode==13 && !key.shiftKey){
					// 시프트 엔터가 아닌 경우
					$('#sendBtn').click();
				}
			});
			
			$('#sendBtn').click(function(){
				
				if($('#msg').val() !== ''){
					// CLASS_CHAT에 저장
			        let chat = {
			            nickName: '${ sessionScope.loginMember.nickName }',
			            email: email,
			            chat_contents: $('#msg').val().replace(/\n/g, "<br>"),
			            chat_code: chatCode,
			            chat_date: getFormatDate(new Date())
			        };
					
					console.log(chat);
					
					socket.emit("send_msg", chat);
					
					$('#msg').val('');
					
				}
			});
			
			socket.on('send_msg', function(chat){
				
				if(chat.email === chatInfo.email){
					addSenderBox(chat);
				}else {
					addReceiveBox(chat);
				}
				//스크롤 맨 아래 감지
				$('.chatRight').scrollTop($('.chatRight').prop('scrollHeight'));
			});
			
		}
	});
		
</script>
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
					<h3>람잔디 </h3>
					<button class="reportBtn" id="reportBtn">신고</button>
				</div>
				<div class="chatBottom">
					<div style="width: 100%;">
						<div class="chatRight" style="background: #e2fcea">
						
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