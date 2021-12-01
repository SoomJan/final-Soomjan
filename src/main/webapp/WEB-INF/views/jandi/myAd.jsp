<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h3 style="color: #147900;" align="right">광고 종료 D - 5</h3>
			<h3>광고 중</h3>
			<hr class="border-1px-black" />
			<h4 style="padding-left: 30px;">광고 중인 클래스 : &nbsp; OH! 잔디의 JAVA</h4>
			<div style="margin: 20px; width: 90%;">
				이 클래스는 OH! 잔디만의 특급 공부 비법을 담은<br>
				JAVA 강의 클래스입니다.<br>
				여태 들었던 JAVA는 지워버리세요!<br>
			</div>
			<h4>등록한 이미지</h4>
			<hr style="margin-top: 10px; margin-bottom: 10px;">
			<div style="margin: 20px; width: 90%;" align="center">
				<img style="width: 80%;"
					src="${ pageContext.servletContext.contextPath }/resources/images/redgrass.png">
			</div>
			<br>
			<br>
			<h4>광고 안내</h4>
			<hr style="margin-top: 10px; margin-bottom: 10px;">
			<div style="margin: 20px;">
				해당 광고를 등록하면 일주일 동안 메인화면에 신청한 광고 이미지와 문구가 노출됩니다.<br> 허위 혹은 과장
				광고시 정책에 따라 법적인 조치를 취할 수 있습니다.<br> <br> 클래스는 중복해서 광고를 올릴 수
				없으며, 멘토당 하나의 클래스만 광고가 가능합니다.<br> <br> 결제 완료한 그 다음날 부터 일주일
				동안 광고가 노출됩니다. <br>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>