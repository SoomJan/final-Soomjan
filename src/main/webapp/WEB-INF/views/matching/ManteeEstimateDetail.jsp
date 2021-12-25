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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/matching/matching_mantee.css" rel="stylesheet" />


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
				<p class="estimate_title">견적서 현황</p>
				<br>
				<table class="estimate_table_detail" style="width: 100%">

					<tr>
						<th class="detailJName">No</th>
						<th >${ estimateDetail[0].estimateCode }</th>
					</tr>
					<tr>
						<th class="detailJName">카테고리</th>
						<th>${ estimateDetail[0].categoryDTO.categoryName }</th>
					</tr>
					<tr>
						<th class="detailJName">진행상태</th>
						<th>${ estimateDetail[0].isMatched }</th>
					</tr>
					<tr>
						<th class="detailJName">작성일</th>
						<th>${ estimateDetail[0].writeDate }</th>
					</tr>
					<tr>
						<th class="detailJName">제목</th>
						<th>${ estimateDetail[0].title }</th>
					</tr>
					<tr>
						<th class="detailJName">내용</th>
						<th style="margin-botton:30px; padding-right: 17px;">
						 ${ estimateDetail[0].contents }
						
						</th>
					</tr> 

				</table>
				<br><br>
					<p class="estimate_title">진행중인 멘토 채팅</p>
					
					<div class="chatlist">
					
					<!-- <c:forEach> -->
						<div class="chatting">
						
							<div class="chat_content">
							
								<div class="chat_content_1">
									<div class="chat_content_3"></div>
									<div class="chat_content_4 profile"> 
										<img src="${ pageContext.servletContext.contextPath }/resources/images/tutor1.png">
									</div>
								</div>
								<div class="chat_content_2">
									<div class="chat_content_3" onclick="location.href='${ pageContext.servletContext.contextPath }/matching/chatting';"> 
										<div class="chat_content_3_1" >잔디</div> 
										<div class="chat_content_3_2"></div> 
									</div>
									<div class="chat_content_4"> <p></p></div>
								</div>
						
						
								<!-- <div class="chat_name">
									<p align="center" class="chat_sendman">잔디</p>
								</div>
							
								<div class="chat_date">
									<p>2021-11-26 02:30</p>
								</div>
								
								<div class="profile">
									<img src="">
								</div>
									
								<div class="chat_pre">
									<p>잔디로 금방 만들어 드릴게요!</p>
								</div> -->
								
								
							</div><!-- 채팅 한 개 끝 -->
							
						</div> 
	
	
	
	
					</div> <!-- 채팅리스트 영역 끝 -->
					
					
				<div class="back">
				<form action="${ pageContext.servletContext.contextPath }/matching/manteeMain/${ sessionScope.loginMember.email }">
					<input type="submit" value="목록으로" class="backBtn">
				</form>
				</div>
				

				<!-- <div class="write">
					<button class="writeBtn">멘토 요청보기</button>
				</div> -->
			</div>

		</div>
	</div>
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
