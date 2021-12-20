<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>find class</title>
    
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
				전체 클래스 | <small>웹 개발</small>
			</h1>
			<br>
			<div class="row">
				<div class="row" style="margin-bottom:10px;">
					<form id="searchform" action="${ pageContext.servletContext.contextPath }/findclass/searchClass" method="get" >
					 	<input type="hidden" name="classCode" value=${ classDTO.classCode }>
						<select class="ui dropdown" id="searchCondition" name="searchCondition" style="margin-left:120px; float:left; border-radius: 1.5rem;">
			  				<option value="recently" >최신순</option>
			        		<option value="starDESC">별점 높은순</option>
			        		<option value="starASC">별점 낮은순</option>
			       		</select>
			        	<div class="main-searchbox" style="width:350px;">
					        <input type="text"  placeholder="찾으시는 강의가 있으신가요?" />
				          	<button type="submit">
				           		<img src="${ pageContext.servletContext.contextPath }/resources/images/research.png"/>
				         	</button>
			        	</div>
					</form>
				      <div class="recommendclass" style="margin-top:10px;">
				        <a href="#"><button class="tagBtn color-1 ">JAVA</button></a>
				        <a href="#"><button class="tagBtn color-1 ">MVC</button></a>
				        <a href="#"><button class="tagBtn color-1 ">SPRING</button></a>
				        <a href="#"><button class="tagBtn color-1 ">프론트앤드</button></a>
				        <a href="#"><button class="tagBtn color-1 ">백앤드</button></a>
				        <a href="#"><button class="tagBtn color-1 ">ORACLE</button></a>
				      </div>
				</div>
				<c:forEach var="classDTO" items="${ classDTOList }">
				
				</c:forEach>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card">
						<img class="card-img-top"
							src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ classDTO.filePath}"
							alt="Card image cap">
						<div class="card-body little-profile text-center">
							<div class="pro-img">
								<img
									src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/tutor1.png"
									alt="user">
							</div>
							<h5 class="m-b-0"></h5>
							<p>${ classDTO.title}</p>
							<a href="javascript:void(0)"
								class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"
								style="margin-bottom: 16px;" data-abc="true"
								onclick="location.href='${ pageContext.servletContext.contextPath}/findclass/class/viewsUp?classCode=4'">자세히보기</a>
							<div class="row text-center m-t-20">
								<div class="col-lg-1 col-md-4 m-t-20">
									<h3 class="m-b-0 font-light"></h3>
									<small> </small>
								</div>
								<div class="col-lg-10 col-md-4 m-t-20">
									<h3 class="m-b-0 font-light">${ classDTO.price } / 30일</h3>
									<small>★★★★☆</small>
								</div>
								<div class="col-lg-1 col-md-4 m-t-20">
									<h3 class="m-b-0 font-light"></h3>
									<small> </small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- /.row -->

			<!-- Pagination -->
			<br>
			<jsp:include page="../common/Paging.jsp" />
		</div>
	</div>

	<!-- /.container -->

  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
