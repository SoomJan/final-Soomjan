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

<title>견적서 리스트</title>
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
	width: 60%;
	height: 60%;
	text-align: center;
}
main { width: 90% !important;}
.common-sidebar{ width: 80% !important;}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
<main>
	<div class="common-sidebar">
		<jsp:include page="../common/matching_mantee_sidebar.jsp" />
		<div class="introduce">

			<div class="matching-content">
				
				<p class="estimate_title">채팅 리스트</p>
					<div class="search">
						<select id="search_category_cb" name="search_category">
							<option value="">선택하세요.</option>
								<c:forEach var="category" items="${categoryList}" >
									<option value="${category.categoryCode}">${category.categoryName}</option>
								</c:forEach>
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
				
				
				 <jsp:include page="../common/Paging.jsp" />
				
				
				<!-- <div class="back">
					<button class="backBtn">목록으로</button>
				</div> -->

				<div class="write">
					<button class="writeBtn">매칭 요청</button>
				</div>
				
			</div> <!-- matching-content 끝 -->

		</div> <!-- introduce div 끝 -->
	</div>
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
