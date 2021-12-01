<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>클래스룸</title>

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

</head>
<style>
      img{width: 250px; text-align: center; border: none !important;}
      .content {width:90%; border: none !important;}
</style>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<button class="btn btn-primary" style="float:right">수정</button>
				<h2>강의 소개</h2>
				<hr>
				<br>
				<p>${ classDTO.contents }</p>
				<img class="content"
					src="${ pageContext.servletContext.contextPath }/resources/images/java.png" />
				<br>
				<br>
				<br>
				<br>
				<div class="tag">
					<p class="tagName">태그<br>${ classDTO.tag }</p>
					<div class="ui button" data-tooltip="Add users to your feed"
						data-position="top left">JAVA</div>
					<div class="ui button" data-tooltip="Add users to your feed"
						data-position="top center">eclipse</div>
					<div class="ui button" data-tooltip="Add users to your feed"
						data-position="top right">spring</div>
				</div>
				<hr>
				<h2>강의 목차</h2>
				<p class="contents">
					chap1. 리터럴<br> chap2. 변수<br> chap3. 메소드<br> chap4.
					배열
				</p>
				<hr>
				<br>
				<div class="after">
					<h2>후기</h2>
					<p>총 5개</p>
				</div>
				<div class="ui card" id="aftercard" style="margin:5%; width:90%; ">
					<div class="content">
						<div class="left aligned header afterheader">
							<i class="star icon"></i> <i class="star icon"></i> <i
								class="star icon"></i> <i class="star icon"></i> <i
								class="star icon"></i>
						</div>
						<div class="left aligned description">
							<p>알차고 좋은 구성이였습니다! 잘들었습니다.</p>
						</div>
					</div>
					<div class="extra content">
						<div class="right aligned author">
							<p>익명의 잔디 2021.11.18</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>