<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>인기 클래스 조회</title>
	
    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
   	<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findclass/findclassmain.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>
  <style>
	.tagBtn.color-1 {
		background-image: linear-gradient( to right, #3dbe86, #3cba92, #30dd8a, #2bb673 );
	}
	
	.tagBtn {
	   width: 10%;
		font-size: 12px;
		font-weight: 600;
		color: #fff;
		cursor: pointer;
		margin: 10px;
		height: 30px;
		text-align: center;
		border: none;
		background-size: 300% 50%;
		border-radius: 50px;
	}
	  </style>
  <body>

    <jsp:include page="../common/nav.jsp" />
	<div class="common-sidebar">
		<jsp:include page="../common/findclasssidebar.jsp" />
		<div class="container" style="width: 75%; margin-top: 150px">

			<!-- Page Heading -->
			<h1 class="my-4">
				인기 클래스 | <small style="color:#117800;">
					<c:if test="${ not empty categoryName }">
						${ categoryName } 
					</c:if>
				</small>
			</h1>
			<br><br><br><br><br>
			<div class="row">
			<c:forEach var="topClassList" items="${ topClassList }">
			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card" style="border: 1px solid green;">
					<img class="card-img-top" style=" height: 200px;"
						src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ topClassList.filePath}"
						alt="Card image cap">
					<div class="card-body little-profile text-center">
						<div class="pro-img">
							<img
								src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ topClassList.profilePath }"
								alt="user">
						</div>
						<h5 class="m-b-0"></h5>
						<p>${ topClassList.title}</p>
						<a href="javascript:void(0)"
							class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"
							style="margin-bottom: 16px; background-color: #91c788; border: 1px solid green;" data-abc="true"
							onclick="location.href='${ pageContext.servletContext.contextPath}/findclass/class/viewsUp?classCode=${ topClassList.classCode }'">자세히보기</a>
						<div class="row text-center m-t-20">
							<div class="col-lg-1 col-md-4 m-t-20">
								<h3 class="m-b-0 font-light"></h3>
								<small> </small>
							</div>
							<div class="col-lg-10 col-md-4 m-t-20">
								<h3 class="m-b-0 font-light">₩ ${ topClassList.price } <br>등록일 : ${ topClassList.createDate }</h3>
								<small> 
									<c:if test="${ findClassList.avgStar == '0'}">
										<span style="color:lightgray;"><i class="star icon"></i></span>
									</c:if>
									<c:if test="${ findClassList.avgStar != '0'}">
									<c:forEach begin="1" end="${ findClassList.avgStar }">
								    	<span style="color:#ffcc00;"><i class="star icon"></i></span>
									</c:forEach>  
								    </c:if>
									(${ topClassList.rvCount })
									/ ${ topClassList.categoryName }
								</small>
							</div>
							<div class="col-lg-1 col-md-4 m-t-20">
								<h3 class="m-b-0 font-light"></h3>
								<small> </small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<script>

			$(function() {

				/* 페이지 로드 시 리스트가 없다면 알러창 띄워주기 */
				let topClassList = "${ empty topClassList }";

				if(topClassList == "true") {
					alert("아직 생성된 클래스가 없는 카테고리입니다.");
					history.back();
				}

				/* 마우스 커서 이벤트 */
				$(".btn-rounded").hover(
				function () {
					$(this).css("color", "black").css("cursor", "pointer");
				},
				function () {
					$(this).css("color", "white").css("cursor", "default");
				}
				);
			});
		</script>

			</div>
		</div>
	</div>


</body>
  <jsp:include page="../common/footer.jsp" />
</html>
