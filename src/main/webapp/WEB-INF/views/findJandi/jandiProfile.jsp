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

<title>멘토 프로필</title>

<link
	href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css"
	rel="stylesheet" />

<script
	src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.introduce-detail img {
	width: 250px;
	text-align: center;
	border-radius: 70%;
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

.areaStyle {
	border: none;
	width: 100%;
	resize: none;
}

.imgBox {
	width: 100%;
	height: 200px;
}

.img {
	width: 80%;
	height: 100%;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/findJandisidebar.jsp" />
		<div class="sidebar-content">
			<div class="introduce">
				<div class="introduce-detail">
					<img
						src="${ pageContext.servletContext.contextPath }/resources/images/redgrass.png" />
					<h3>OH! 잔디 멘토</h3>
				</div>
			</div>
			<br>
			<div class="introduce" style="padding: 3%">
				<P>멘토 경력</P>
				<hr class="border-1px-black" />
				<div style="min-height:100px;">저의 경력은요~~</div>
				<br>
				<P>소개</P>
				<hr class="border-1px-black" />
				<div  style="min-height:200px;">제 수업은요~~</div>
				<br>
				<div class="warining">
					<p>오잔디 멘토님의 진행중인 클래스</p>
					<hr class="border-1px-black" />
					<table style="width: 100%">
						<tr>
							<td>
								<div class="imgBox" align="center">
									<img class="img"
										src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg">
									<p>클래스 제목</p>
								</div>
							</td>
							<td>
								<div class="imgBox" align="center">
									<img class="img"
										src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg">
									<p>클래스 제목</p>
								</div>
							</td>
							<td>
								<div class="imgBox" align="center">
									<img class="img"
										src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg">
									<p>클래스 제목</p>
								</div>
							</td>
						</tr>
					</table>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
