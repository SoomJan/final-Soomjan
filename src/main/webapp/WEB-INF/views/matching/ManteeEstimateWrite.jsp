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
					<form action="${ pageContext.servletContext.contextPath }/matching/estimateSend" method="POST">
						<table class="estimate_table" style="width: 100%">
					
					
							<tr>
								<th width="70" class="table_head">제목</th>
						<!-- <th width="30">절 성장시켜주실 고수분!</th> -->
								<th><input class="input_title" type="text" name="title"></th>
							</tr>
					
							<tr>
								<th class="table_head">카테고리</th>
								<th>
									<select id="category_cb" name="categoryCode">
										<option value="">선택하세요.</option>
										<option value="1">개발 · 프로그래밍</option>
										<option value="2">웹 개발</option>
										<option value="3">백엔드</option>
										<option value="4">풀스택</option>
										<option value="5">모바일</option>
										<option value="6">앱개발</option>
										<option value="7">언어 알고리즘</option>
										<option value="8">자료구조</option>
										<option value="9">데이터 사이언스</option>
										<option value="10">데이터베이스</option>
										<option value="11">개발 도구 데브옵스</option>
										<option value="12">인프라 게임</option>
										<option value="13">개발 임베디드</option>
										<option value="14">IoT 데스크톱</option>
										<option value="15">앱 개발 교양 · 기타</option>
									</select>
								</th>
							</tr>
					 
								<tr>
									<th class="table_head">내용</th>
									<th>
										<textarea rows="50" cols="100" class="content_area" name="contents">
										</textarea>
									</th>
								</tr>

					</table>
				<div class="back">
					<button class="backBtn">목록으로</button>
				</div>

				<div class="write">
						<button type="submit" class="writeBtn">매칭 요청</button>
				</div>
				</form>
			</div>

		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
