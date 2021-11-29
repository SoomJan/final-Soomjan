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

<title>Signin Template for Bootstrap</title>


<link
	href="${ pageContext.servletContext.contextPath }/resources/css/matching/matching_mantee.css"
	rel="stylesheet" />

<link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/css/semantic/semantic.css">
<script src="resources/css/semantic/semantic.js"></script>
<script src="css/ie-emulation-modes-warning.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="css/bootstrap.js"></script>
<script type="text/javascript" src="css/nav.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript"
	src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.introduce-detail img {
	width: 60%;
	height: 60%;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="../common/matching_mantor_sidebar.jsp" />
		<div class="introduce">

			<div class="matching-content">
				<p class="estimate_title">견적서 작성하기</p>
				<br>
				<table class="estimate_table" style="width: 100%">

					<tr>
						<th width="10">No</th>
						<th width="60" align="left">1</th>
					</tr>
					<tr>
						<th width="10">카테고리</th>
						<th width="60" align="left">개발,프로그래밍</th>
					</tr>
					<tr>
						<th width="10">진행상태</th>
						<th width="60" align="left">Y</th>
					</tr>
					<tr>
						<th width="10">작성일</th>
						<th width="60" align="left">2021.11.18</th>
					</tr>
					<tr>
						<th width="10">제목</th>
						<th width="60" align="left">절 성장시켜주실 고수분!</th>
					</tr>
					<tr>
						<th width="10">내용</th>
						<th width="60" align="left">
안녕하세요. 저는 자바를 배우고싶은 취준생입니다.<br>
비전공자를 네카라쿠베에 취업할 수 있는 실력까지 성장시켜주실 고수분을 구합니다.<br>
페이는 아쉽지 않게 챙겨드리겠습니다. <br>
많은 연락 부탁드립니다. 감사합니다 :)<br>
				</th>
					</tr> 

				</table>
				<br><br>
				
					
					
				<div class="back">
					<button class="backBtn">목록으로</button>
				</div>

				<div class="write">
					<button class="writeBtn">채팅하기</button>
				</div>
			</div>

		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
