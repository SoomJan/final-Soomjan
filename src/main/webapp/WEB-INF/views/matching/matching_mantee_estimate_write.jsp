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
		<jsp:include page="../common/matching_mantee_sidebar.jsp" />
		<div class="introduce">

			<div class="matching-content">
				<p class="estimate_title">견적서 작성하기</p>
				<table class="estimate_table" style="width: 100%">

					<tr>
						<th width="70" class="table_head" align="right"">제목</th>
						<!-- <th width="30">절 성장시켜주실 고수분!</th> -->
						<th><input class="input_title" type="text" value="절 성장시켜주실 고수 분 !"></th>
					</tr>
					
					<tr>
						<th class="table_head" align="right">카테고리</th>
						<th align="left" style="padding-left: 115px;">
							<select id="category_cb" name="category">
								<option value="">선택하세요.</option>
								<option value="개발 · 프로그래밍">개발 · 프로그래밍</option>
								<option value="웹 개발">웹 개발</option>
								<option value="프론트엔드">프론트엔드</option>
								<option value="백엔드">백엔드</option>
								<option value="풀스택">풀스택</option>
								<option value="모바일">모바일</option>
								<option value="앱개발">앱개발</option>
								<option value="언어 알고리즘">언어 알고리즘</option>
								<option value="자료구조">자료구조</option>
								<option value="데이터 사이언스">데이터 사이언스</option>
								<option value="데이터베이스">데이터베이스</option>
								<option value="개발 도구 데브옵스">개발 도구 데브옵스</option>
								<option value="인프라 게임">인프라 게임</option>
								<option value="개발 임베디드">개발 임베디드</option>
								<option value="IoT 데스크톱">IoT 데스크톱</option>
								<option value="앱 개발 교양 · 기타">앱 개발 교양 · 기타</option>
						</th>
					</tr>
					
					<tr>
						<th class="table_head" align="right" >작성일</th>
						<th align="left" style="padding-left: 140px;">2021.11.18</th>
					</tr>
					<tr>
						<th class="table_head" align="right">내용</th>
						<th>
							<textarea rows="50" cols="100" class="content_area">
안녕하세요. 저는 자바를 배우고싶은 취준생입니다.
비전공자를 네카라쿠베에 취업할 수 있는 실력까지 성장시켜주실 고수분을 구합니다.
페이는 아쉽지 않게 챙겨드리겠습니다. 
많은 연락 부탁드립니다.
감사합니다 :)
							</textarea>
						</th>
					</tr>


				</table>
				
				<div class="back">
					<button class="backBtn">목록으로</button>
				</div>

				<div class="write">
					<button class="writeBtn">매칭 요청</button>
				</div>
			</div>

		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
