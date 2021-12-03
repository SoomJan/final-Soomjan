<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>학습방</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

<script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"  src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>

.border-1px-black{
	margin-top:10px;
	margin-bottom: 10px;
}

.learnTable thead {
  background-color: #e3ffec;
   text-align: center;   
  }

.learnTable tbody {
   text-align: center;   
  }
  
  
table{
	text-align: center;
}
</style>
<script>
	function movePost(item){
		let postCode = $(item).prev().val();
		console.log(postCode);
		location.href="${pageContext.servletContext.contextPath}/jandi/class/classLearningPost?postCode=" + postCode; 
	};
</script>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mentorsidebar.jsp" />
		<jsp:include page="../class/classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
			<p>
			<table style="width:100%;">
				<tr>
				<th align="center" width="25"></th>
				<th align="center" width="50"><h3>${ sessionScope.classDTO.title } 클래스룸 학습방</h3></th>
				<th align="center" width="25"><a href="${pageContext.servletContext.contextPath}/jandi/class/classlearningPost?postCode=0">작성하기</a></th>
				</tr>
			</table>
			<hr class="border-1px-black" />
				<table class="learnTable ui basic table " style="width:100%;">
				<thead>
					<tr class="trStyle">
						<th width="20">멘토</th>
						<th width="60">제목</th>
						<th width="20">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="learningPost" items="${ learningPostList }">
						<input type="hidden" value="${ learningPost.postCode }">
						<tr onclick="movePost(this)">
							<td>${ learningPost.nickName }</td>
							<td>${ learningPost.title }</td>
							<td>${ learningPost.writeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>