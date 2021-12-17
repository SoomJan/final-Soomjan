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
<script src="css/ie-emulation-modes-warning.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

main { width: 90% !important;}
.common-sidebar{ width: 80% !important;}

</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

<main>
	<div class="common-sidebar">
		<jsp:include page="../common/matching_mantee_sidebar.jsp" />
		<div class="introduce" style="width:70%">

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
								
							<c:forEach var="ssack" items="${ ssackList }">
								<tr>
									<th width="10">${ ssack.estimateCode }</th>
									<th width="60"><a href="${ pageContext.servletContext.contextPath }/matching/detailEstimate">${ ssack.title }</a></th>
									<th width="30">${ ssack.isMatched }</th> 
								
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
					
			 <jsp:include page="../common/Paging.jsp" />
						</div>
					</div>
				</div>
			</div>
</main>
</body>
<jsp:include page="../common/footer.jsp" />
</html>