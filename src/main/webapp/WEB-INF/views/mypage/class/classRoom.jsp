<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>클래스룸</title>

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
.content {
	width: 90%;
	border: none !important;
}

.classImg{
	width: 80%;
	text-align: center;
	border: 1px solid green;
	border-radius: 0.5rem;
}

.areaStyle {
	border: none;
	width: 100%;
	resize: none;
}

.areaStyle:focus {
	outline: none;
}
</style>
<body>
	<jsp:include page="../../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../../common/mypagesidebar.jsp" />
		<jsp:include page="./classRoomNav.jsp" />
		<div class="sidebar-content">
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div>
				<h2>강의 소개 ${ requestScope.errMessageMap.errMessage }</h2>
				<hr>
				<br>
				<div id="contents">
					<textarea class="areaStyle" id="contents" name="contents" rows="10" wrap="hard"
						placeholder="아직 강의 소개가 없습니다." readonly>${ classDTO.contents }</textarea>
				</div>
				<div align="center">
					<img class="classImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ classDTO.filePath }">
				</div>
				<br>
				<br>
				<div class="tag">
				</div>
				<br>
				<input class="areaStyle" name="tag" id="tag" type="hidden" value="${ classDTO.tag }">
				<script>
					$(function(){
						let tags = $('#tag').val().replace(" ","");
						let tagArr = tags.split('#');
						for(let tag of tagArr){
							if(tag !== ""){
								$('.tag').append(
								"<div class='ui button' style='margin:3px;' data-position='top left'>"
								+ tag + "</div>");
							}
						}
					});
				</script>
				<hr>
				<h2>강의 목차</h2>
				<c:forEach var="mokcha" items="${ mokchaList }">
					<p class="contents">
						${ mokcha.mokchaName }
					</p>
				</c:forEach>
				<hr>
				<br>
				<div class="after">
					<h2>후기</h2>
					<p>총 5개</p>
				</div>
				<div class="ui card" id="aftercard" style="margin: 5%; width: 90%;">
					<div class="content">
						<div class="left aligned header afterheader">
							<i class="star icon"></i> <i class="star icon"></i> <i
								class="star icon"></i> <i class="star icon"></i> <i
								class="star icon"></i>
						</div>
						<div class="left aligned description">
							<p>알차고 좋은 구성이였습니다! 잘들었습니다.</p>
						</div>
					</div>
					<div class="extra content" id="name-date-content">
						<div class="right aligned author">
							<p>익명의 잔디 2021.11.18</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>