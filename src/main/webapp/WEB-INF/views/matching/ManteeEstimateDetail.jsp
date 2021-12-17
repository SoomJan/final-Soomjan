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
				<p class="estimate_title">견적서 현황</p>
				<br>
				<table class="estimate_table" style="width: 100%">

					<tr>
						<th width="10">No</th>
						<th width="60"align="left" name="estimateCode">${ estimate.estimateCode }</th>
					</tr>
					<tr>
						<th width="10">카테고리</th>
						<th width="60"align="left">${ estimate.categoryCode }</th>
					</tr>
					<tr>
						<th width="10">진행상태</th>
						<th width="60"align="left">${ estimate.isMatched }</th>
					</tr>
					<tr>
						<th width="10">작성일</th>
						<th width="60" align="left">${ estimate.writeDate }</th>
					</tr>
					<tr>
						<th width="10">제목</th>
						<th width="60"align="left">${ estimate.title }</th>
					</tr>
					<tr>
						<th width="10">내용</th>
						<th width="60" align="left">
						<br>
						 ${ estimate.contents }
						
						</th>
					</tr> 

				</table>
				<br><br>
					<p class="estimate_title">진행중인 멘토 채팅</p>
					
					<div class="chatlist">
						<div class="chatting">
						
							<div class="profile">
								<img src="">
							</div>
							
							<div class="chat_content">
							
								<div class="chat_name">
									<p align="center" class="chat_sendman">잔디</p>
								</div>
								
								<div class="chat_date">
									<p>2021-11-26 02:30</p>
								</div>
								
								<div class="chat_pre">
									<p align>잔디로 금방 만들어 드릴게요!</p>
								</div>
								
								<div class="chat_count">
									<p class="chat_count_p">&nbsp;&nbsp;&nbsp;1</p>
								</div>
							</div><!-- 채팅 한 개 끝 -->
							
							
							
							
						</div> 
						
	
					</div> <!-- 채팅리스트 영역 끝 -->
					
					
				<div class="back">
					<button class="backBtn">목록으로</button>
				</div>

				<div class="write">
					<button class="writeBtn">멘토 요청보기</button>
				</div>
			</div>

		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
