<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>학습방</title>

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

</head>
<style>
a{
	color:black;
}
p {
	font-weight: bold;
	font-size: 20px;
}

.border-1px-black{
	margin-top:10px;
	margin-bottom: 10px;
}

.learnTable thead {
  background-color: #e3ffec;
   text-align: center;   
  }

.learnTable tbody {
   text-align: center;   
  }
  
table{
	text-align: center;
}
</style>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mypagesidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
			<p>
			<table style="width:100%;">
				<tr>
				<th align="center" width="25"></th>
				<th align="center" width="50"><h3>OH! 잔디의 JAVA 클래스룸 학습방</h3></th>
				<th align="center" width="25"></th>
				</tr>
			</table>
				<table class="ui basic table learnTable" style="width:100%;">
				<thead>
					<tr>
						<th width="10">멘토</th>
						<th width="80">제목</th>
						<th width="10">날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>OH! 잔디</td>
						<td>chap01 숙제</td>
						<td>2021-11-18</td>
					</tr>
					<tr>
						<td>OH! 잔디</td>
						<td>chap02 숙제</td>
						<td>2021-11-18</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>