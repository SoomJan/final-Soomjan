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
				<div class="request-list">
					<p class="explain">전체 견적 요청</p>
					<div id="allrequest">
						<table style="width: 100%" class="estimateList">
						
							<thead>
								<tr class="table_title">
									<th>No</th>
									<th>제목</th>
									<th>진행상태</th>
								</tr>
							</thead>
							<tbody>
								<tr></tr>
								
							<c:forEach var="estimate" items="${ estimateList }">
								<tr>
									<th width="10">${ estimate.estimateCode }</th>
									<th width="60"><a href="#">${ estimate.title }</a></th>
									<th width="30">${ estimate.isMatched }</th> 
								
								</tr>
								</c:forEach>
								<!-- <tr>
									<th width="10">2</th>
									<th width="60">재미있게 강습하고 싶어요~</th>
									<th width="30">N</th>
								</tr> -->
								
							</tbody>
						</table>
					</div>
					<br>
							<div class="write">
								<a href="${ pageContext.servletContext.contextPath }/matching/manteeWrite">
								<button class="writeBtn">견적서 작성</button>
								</a>
							</div>
								
					</div>
					
					</div>
				</div>

			</div>

		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
