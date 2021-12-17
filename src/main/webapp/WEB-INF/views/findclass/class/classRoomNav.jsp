<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	color:black;
}
table{
	text-align: center;
}

th{
	text-align: center;
}
.btn-primary {
	color: #fff;
	background-color: #91C788;
	border-color: #91C788;
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
</style>
<script>
	let payWindow;
	$(function(){
		
		$('#purchaseBtn').click(function(){
			
			if('${ sessionScope.loginMember.email }' != ''){
				
				let email = '${ sessionScope.loginMember.email }';
				let class_ing = false;
				
				<c:forEach var="emailList" items="${ sessionScope.currentMemberList }">
					<c:if test="${ sessionScope.loginMember.email == emailList.EMAIL }">
						class_ing = true;
					</c:if>
				</c:forEach>
				
				if(!class_ing){
					$.ajax({
						url: "${ pageContext.servletContext.contextPath }/member/class/purchaseClass",
						type: "post",
						contentType:"application/x-www-form-urlencoded; charset=UTF-8",
						dataType:'json',
						data:  { email:email },
						success: function(resp){
							console.log("결제 고유 번호: " + resp.tid);
							payWindow = window.open(resp.next_redirect_pc_url, "클래스 구매하기", "width:250px,heigh:400px");
						},
						error: function(error){
							cnosole.log(JSON.stringify(error));
						}
					});
				}else{
					alert("이미 수강중인 클래스입니다.");
				}
				
			}else{
				alert("로그인이 필요한 서비스입니다.");
			}
		});
		
		if('${ requestScope.purchaseMessage }' != ''){
			
			if('${ requestScope.purchaseMessage }' == 'Y'){
				if(confirm("결제가 완료되었습니다.")){
					opener.location.href= "${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=" + ${classDTO.classCode};
				}
			}else if('${ requestScope.purchaseMessage }' == 'N'){
				alert("결제에 실패했습니다.");
				payWindow.close();
			}else{
				payWindow.close();
			}
		}
	});
	
</script>

</head>
<body>
	<div class="sidebar-content">
		<p class="title"><b>${ classDTO.title }</b></p>
		<p align="right"><b>${ classDTO.nickName } 잔디</b></p>
		<c:if test="${ classDTO.email != sessionScope.loginMember.email and classDTO.maxCount > sessionScope.currentCount}">
		<p align="right" style="color:darkgreen; font-size:medium;">클래스 신청(30일): ${ classDTO.price }원  
			<button id="purchaseBtn" class="btn btn-primary"><b>신청 하기</b></button></p>
		</c:if>
		<br>
		<!-- 탭 메뉴 상단 시작 -->
		<table style="width: 100%">
			<tr>
				<th width="50"><a href="${ pageContext.servletContext.contextPath}/findclass/class/classRoom?classCode=${ classDTO.classCode }" class="room class">클래스</a></th>
				<th width="50"><a href="${ pageContext.servletContext.contextPath}/findclass/class/classLecture" class="room lecture">강의 영상</a></th>
			</tr>
		</table>
		<br>
		<br>
	</div>
</body>
</html>