<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>find class</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"  rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findJandi/findJandiMain.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>
  <body>

    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
    <jsp:include page="../common/findJandisidebar.jsp" />
      
      <div class="container" style="width:75%; margin-top:150px">

  <!-- Page Heading -->
  <h1 class="my-4">멘토 보기 | 
    <small>전체 멘토</small>
  </h1>

  	<div class="row">
		<div class="row" style="margin-bottom:10px;">
			<div class="dropsearch">
			<form id="searchform" action="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" method="get" >
				<input type="hidden" name="categoryCode" value="${ categoryCode }">
				<select class="ui dropdown" id="searchCondition" name="searchCondition" style="margin-left:120px; float:left; border-radius: 1.5rem;">
					<option value="1">최신순</option>
					<option value="2" >인기순</option>
		       		<option value="3">별점 높은순</option>
		       		<option value="4">별점 낮은순</option>
				</select>
		       	<div class="main-searchbox" style="width:350px;">
			        <input type="search" id="searchValue" name="searchValue" placeholder="찾으시는 강의가 있으신가요?" value="<c:out value="${
						selectCriteria.searchValue }" />">
		          	<button type="submit">
		           		<img src="${ pageContext.servletContext.contextPath }/resources/images/research.png"/>
		         	</button>
				</div>
			</form>
		       	</div>
			  <br><br><br><br><br>
		</div>
		
	   <c:forEach var="jandi" items="${ jandiList }"> 
		    <div class="col-lg-4 col-sm-6 mb-4">
			      <div class="card">
			            <div class="card-body little-profi text-center">
			                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ jandi.profile_path }" alt="user"  
			                	onclick="location.href='${ pageContext.servletContext.contextPath}/findJandi/jandiProfile/${ jandi.email }'"></div>
			                <p>${ jandi.nickname }</p>
			            </div>
			      </div>
		    </div> 
	   </c:forEach>

  </div>
  <!-- /.row -->

  <!-- Pagination -->
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>

</div>
    </div>
	
<!-- /.container -->

  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
