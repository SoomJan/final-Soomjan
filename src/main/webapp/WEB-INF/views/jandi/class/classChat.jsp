<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.alternate {
	padding-left:3px;
}

</style>
</head>
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
		
	
	$(function(){
		
		const email = "${ sessionScope.loginMember.email }";
		
		if( '${ chatRoomList[0].CHAT_CODE }' !== '' ){
			
			let chatInfo = {
				email: email,
				chat_code: $('.chatCodeInput').val()
			};
			
			$('.chatRoomBox').first().css('background-color', 'white');
			$('#nick').html($('.chatRoomBox').first().text());
			
			let socket = io("http://125.132.252.115:3000/classChat");
			
			socket.emit("chat_info", chatInfo);
			
			
			console.log(chatInfo);
			
			$('.chatRoomBox').click(function(e){
				$('.chatRoomBox').css('background-color', '#e2fcea');
		
				socket.emit("leaveChat", chatInfo);
				console.log(chatInfo);
				
				let chatBox = e.target;
				$(chatBox).css('background-color', 'white');
				$('#nick').html($(chatBox).text());
				console.log($(chatBox).children().last().val());
				
				let chatCode = $(chatBox).children().last().val();
				
				chatInfo.chat_code = chatCode;
				
				socket.emit("chat_info", chatInfo);
				console.log("chat_info2 : " + chatInfo);
				
			
			});
			
			socket.on("connect_user", function(connect_email){
			console.log(connect_email);
			});
				
			// 채팅 이력 불러오기
			socket.on("receive_msg", function(chat_log){
				$('.chatRight').html('');
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
			            nickName: '${ sessionScope.jandi.nickName }',
			            email: chatInfo.email,
			            chat_contents: $('#msg').val().replace(/\n/g, "<br>"),
			            chat_code: chatInfo.chat_code,
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
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<c:if test="${ chatRoomList != '[]' }">
			<div class="chatDiv">
				<div class="chatTop">
					<h3 id="nick"></h3>
					<button class="reportBtn" id="reportBtn">신고</button>
				</div>
				<div class="chatBottom">
					<div class="chatLeft">
						<c:forEach var="chatRoom" items="${ chatRoomList }">
							<div class="chatRoomBox" >
								<c:out value="${ chatRoom.NICKNAME }"/><i class="comment alternate outline icon"></i>
								<input type="hidden" class="chatCodeInput" value="${ chatRoom.CHAT_CODE }">
							</div>
						</c:forEach>
					</div>
					<div style="width: 100%;">
						<div class="chatRight">
							<br>
						</div>
						<div class="sendMessage" align="center">
							<button class="btn btn-primary" style="float:left; padding:4px;" id="imgBtn" data-toggle="modal" data-target="#sendImgModal">
								<i class="images outline icon"></i>
							</button>
							<textarea class="messageArea" id="msg"></textarea>
							<input class="sendBtn" type="button" id="sendBtn" value="전송" >
						</div>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${ chatRoomList == '[]' }">
			<br><br>
				<h3 align="center"> 아직 클래스를 듣는 인원이 없습니다. </h3>
			</c:if>
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
					<br> <input type="file" id="sendFile"><br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="okBtn">전송</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <script>
			$('#okBtn').click(function() {
				console.log($('#sendFile').val());
			});
	</script> -->

</body>
<jsp:include page="../../common/footer.jsp" />
</html>