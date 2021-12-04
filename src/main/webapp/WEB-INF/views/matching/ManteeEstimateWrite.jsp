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
										<c:forEach var="category" items="${categoryList}" >
											<option value="${category.categoryCode}">${category.categoryName}</option>
										</c:forEach>
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