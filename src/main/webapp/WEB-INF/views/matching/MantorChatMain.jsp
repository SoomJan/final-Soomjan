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
					
					<div class="chatting">
						
							<div class="chat_content">
								<c:forEach var="chatList" items="${myChatList}">
								<div class="chat_content_1">
									<div class="chat_content_3"></div>
									<div class="chat_content_4 profile"> 
										
										<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${chatList.PROFILE_PATH}">
									</div>
								</div>
								<div class="chat_content_2">
									<div class="chat_content_3" onclick="location.href='${ pageContext.servletContext.contextPath }/matching/chattingroom?matchedCode=${chatList.MATCHED_CODE}'"> 
										<div class="chat_content_3_1" > ${chatList.NICKNAME}</div> 
										<div class="chat_content_3_2"> ${ chatList.TITLE}</div> 
									</div>
									<div class="chat_content_4"> <p></p></div>
								</div>
								
								
						
								</c:forEach>
							
							</div><!-- 채팅 한 개 끝 -->
							
						</div> 
	
						
							
				
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
