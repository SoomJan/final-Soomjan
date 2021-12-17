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

<title>나의 광고</title>

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

<style>
a {
	color: black;
}

p {
	font-weight: bold;
	font-size: 20px;
}

.btnStyle {
	padding: 5px;
	background-color: #91c788;
	border-radius: 0.5rem;
	font-size: 12px;
	border-color: #91c788;
	float: right;
}

.border-1px-black {
	margin-top: 10px;
	margin-bottom: 10px;
}

table {
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
		
			<h1 align="center">결제하기</h1>
			<button type="button" id="kakao-pay" style="float: right">결제하기</button>
			<form action="${ pageContext.servletContext.contextPath }/jandi/jandiPay" method="POST" id="dateForm">
				<table style="width: 100%">
					<tr>
						<td style="width:30%">수업제목</td>
						<td style="width:70%">${ myClasses.contents }</td>
					</tr>
					<tr>
						<td style="width:30%">원하는 광고 시작날짜</td>
						<td style="width:70%"><input type="week" name="startDate"></td>
					</tr>
					<tr>
						<td style="width:30%">광고료</td>
						<td style="width:70%">300,000</td>
					</tr>
				</table>
			</form>

		</div>
		<script type="text/javascript">
		
			let selectedDate = $('#dateForm').startDate.val();
			let contents=${ myClasses.contents};
			let adCode=${ myAd.adCode };
			
			$(function(){
				$('#kakao-pay').click(function(){
					$.ajax({
						url:"${ pageContext.servletContext.contextPath }/jandi/jandiPay",
						dataType:'json',
						data:{"selectedDate" : selectedDate,
							  "adCode":adCode}
						
					})
					.done(function(json){
						alert("결제가 완료되었습니다.");
						
						var box=resp.next_redirect_pc_url;
						
						location.href="${ pageContext.servletContext.contextPath }/jandi/myAd";

					})
					.fail(function(xhr, status, error){
						alert(error);
					});
					
					
				});
			});
			
		
		</script>		
		
		
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
