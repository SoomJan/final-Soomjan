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
		<jsp:include page="../../common/findclasssidebar.jsp" />
		<jsp:include page="./classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<h2>강의 소개</h2>
				<hr>
				<br>
				<p>이 클래스는 OH! 잔디만의 특급 비법이 담긴 강의입니다.</p>
				<p>이 강의를 듣는 여러분은 선택받은 사람들인거에요!</p>
				<p>그러니까 감사하는 마음을 가지고 게을리 하지 않고 열심히 들어주세요.</p>
				<p>제가 공을 들여 만든 강의가 아깝지 않게 해주세요.</p>
				<p>부탁이 아닌 강요랍니다!</p>
				<img class="content"
					src="${ pageContext.servletContext.contextPath }/resources/images/java.png" />
				<br>
				<br>
				<br>
				<br>
				<div class="tag">
					<p class="tagName">태그</p>
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