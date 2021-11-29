<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>멘티 채팅</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/chat.css?after" rel="stylesheet" />
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
</head>
<script src="http://125.132.252.115:3000/socket.io/socket.io.js"></script>
<script>

	function getCurrentDate(chat_date){
		let date = chat_date.substr(0, 9);
		
		let time = chat_date.substr(11, 16);
		
		return date + " " + time;
	};
	
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
		let socket = io("http://125.132.252.115:3000");
		
		// 채팅방 정보
		let chatInfo = {
			email: 'ysyr0830@gmail.com',
			chat_code: '1'
		}
		
		socket.emit("chatInfo", chatInfo);
		
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
			if(key.keyCode==13 && !key.shiftKey && $('#msg').val() !== ""){
				// 시프트 엔터가 아닌 경우
				$('#sendBtn').click();
			}
		});
		
		$('#sendBtn').click(function(){
			
			// CLASS_CHAT에 저장
	        let chat = {
	            nickName: '람람',
	            email: 'ysyr0830@gmail.com',
	            chat_contents: $('#msg').val().replace(/\n/g, "<br>"),
	            chat_code: '1',
	            chate_date: new Date()
	        };
			
			console.log(chat);
			
			socket.emit("send_msg", chat);
			
			$('#msg').val('');
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
			<div class="chatDiv">
				<div class="chatTop">
					<h3>멘티1</h3>
					<button class="reportBtn" id="reportBtn">신고</button>
				</div>
				<div class="chatBottom">
					<div class="chatLeft">
						<div class="chatRoomBox">멘티1</div>
						<div class="chatRoomBox">멘티2</div>
						<div class="chatRoomBox">멘티3</div>
						<div class="chatRoomBox">멘티1</div>
						<div class="chatRoomBox">멘티2</div>
						<div class="chatRoomBox">멘티3</div>
					</div>
					<div style="width: 100%;">
						<div class="chatRight">
							<br>
						</div>
						<div class="sendMessage" align="center">
							<textarea class="messageArea" id="msg"></textarea>
							<input class="sendBtn" type="button" id="sendBtn" value="전송" >
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<jsp:include page="../../common/footer.jsp" />
</html>