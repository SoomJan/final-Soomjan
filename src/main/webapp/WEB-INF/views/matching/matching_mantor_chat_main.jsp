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

<title>견적서 리스트</title>


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
				
				<p class="estimate_title">전체 견적서 리스트</p>
					<div class="search">
						<select id="search_category_cb" name="search_category">
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
						</select>
						
						<input id="search_area" type="text" value="">
						
						<button class="search_btn">검색</button>
						</div> <!-- search div  -->	
						
						<br><br><br><br>
						
						<div class="board_table">
							<table style="width: 100%" class="estimate table">	
								<thead>
									<tr class="table_title">
										<th>No</th>
										<th>제목</th>
										<th>카테고리</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									
									</tr>
								
									<tr class="table_content">
										<td width="10" >3</td>
										<td width="50">높은 가격으로 모십니다!</td>
										<td width="30">모바일</td>
										<td width="10">Y</td>
									</tr>
									
									<tr class="table_content">
										<td width="10" >2</td>
										<td width="50">편한 분위기에서 강의하실 분</td>
										<td width="30">데이터베이스</td>
										<td width="10">N</td>
									</tr>
									
									<tr class="table_content">
										<td width="10" >1</td>
										<td width="50">절 성장시켜주실 고수분</td>
										<td width="30">개발 · 프로그래밍</td>
										<td width="10">Y</td>
									</tr>
								
								</tbody>
							
							</table>
					</div>	<!-- board_table div  -->	
				
				<br><br>
				
				
				<div class="manager-paging">
		            <ul>
		              <li><a href="#">Prev</a></li>
		              <li><a href="#">1</a></li>
		              <li><a href="#">2</a></li>
		              <li><a href="#">3</a></li>
		              <li><a href="#">next</a></li>
		            </ul>
				</div>
				
				
				<div class="back">
					<button class="backBtn">목록으로</button>
				</div>

				<div class="write">
					<button class="writeBtn">매칭 요청</button>
				</div>
				
			</div> <!-- matching-content 끝 -->

		</div> <!-- introduce div 끝 -->
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
