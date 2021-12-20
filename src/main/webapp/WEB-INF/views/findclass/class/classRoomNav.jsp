<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>클래스룸</title>
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
.modalContents{
	resize: none;
	border-radius: 0.5rem;
	border: 1.5px solid green;
	height: 100px;
	padding:2%;
	
}
</style>

<script>
	//------------------결제
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
		
		//--------------------- 신고 전송
		$('#reportClassBtn').click(function(){
			if('${ sessionScope.loginMember.email }' != ''){
				let repContents = $('#repContents').val();
				let repTypeCode =  $('#repTypeCode').val();
					$.ajax({
						url: "${pageContext.servletContext.contextPath }/member/class/reportClass",
						type: "post",
						data:  { 
							repContents: repContents,
							repTypeCode: repTypeCode
							},
						success: function(data){
							alert(data);
						},
						error: function(error){
							cnosole.log(error);
						}
					});
					$('#repContents').val("");
					$('#reportClassCloseBtn').click();
			}else{
				alert("로그인이 필요한 서비스입니다.");
			}
		});	
		
		//-----------찜
		let status = "N";
		<c:forEach var="jjimMember" items="${ sessionScope.jjimClassMemberList }">
			<c:if test="${ jjimMember.EMAIL == loginMember.email }" >
				status = "Y";
			</c:if>
		</c:forEach>
		
		if(status == "Y"){
			$('#jjimBtn').html("<span style='color:red;'><i class='heart icon'></i></span>해제");
		}else{
			$('#jjimBtn').html("<span style='color:red;'><i class='heart outline icon'></i></span>찜");
		}
		
		$('#jjimBtn').click(function(){
			if('${ sessionScope.loginMember.email }' != ''){
				console.log(status);
					$.ajax({
						url: "${pageContext.servletContext.contextPath }/member/class/jjimClass",
						type: "get",
						data:  { status : status},
						success: function(data){
							status = data;
							if(status == "Y"){
								$('#jjimBtn').html("<span style='color:red;'><i class='heart icon'></i></span>해제");
							}else{
								$('#jjimBtn').html("<span style='color:red;'><i class='heart outline icon'></i></span>찜");
							}
						},
						error: function(error){
							cnosole.log(error);
						}
					});
			}else{
				alert("로그인이 필요한 서비스입니다.");
			}
		});
	});
	
</script>

</head>
<body>

	<div>
		<div >
			<button type="button" style="float:left; color:black; background:none; border:none;" 
					data-toggle="modal" data-target="#reportClassModal">
				<span style="color:red;"><i class="bullhorn icon"></i></span>클래스 신고</button>
			<button id="jjimBtn" style="float:right; color:black; background:none; border:none;"></button>
		</div>
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

	<!-- Modal -->
	<div class="modal fade" id="reportClassModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">클래스 신고</h4>
				</div>
				<div class="modal-body" align="center">
					<br>	
						<b>신고 카테고리(필수): <select id="repTypeCode" name="repTypeCode">
						<c:forEach var="reportState" items="${ reportStateList }">
							<option value="${ reportState.REP_TYPE_CODE }">${ reportState.REP_TYPE }</option>
						</c:forEach>
						</select>
						</b>
						<br><br>
						<b>신고 사유(필수)</b><br>
						<textarea class="modalContents" id="repContents" style="width:300px;"></textarea>
						<br><br>
						타당한 사유 및 근거 없는 신고는 해당 신고가 반려될 수 있습니다.
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" id="reportClassCloseBtn" class="btn btn-default btnBD"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="reportClassBtn">신고하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>