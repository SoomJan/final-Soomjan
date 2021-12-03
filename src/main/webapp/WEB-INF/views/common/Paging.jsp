<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">

    <script src="https://code.jquery.com/jquery-3.1.1.min.js" 
                integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous">
    </script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>

</head>
<body>

	<nav style="text-align : center">
	  <ul class="ui pagination menu">
	  
		<!-- 이전 페이지 버튼 -->
		<c:if test="${ sessionScope.SelectCriteria.pageNo <= 1 }">
	 	<li>
			<a href="#" aria-label="Previous" class="item">
			 <span aria-hidden="true">&laquo;</span>
	  	    </a>
		</li>
		</c:if>
		<c:if test="${ sessionScope.SelectCriteria.pageNo > 1 }">
	 	<li id="prevPage">
			<a href="#" aria-label="Previous" class="item">
			 <span aria-hidden="true">&laquo;</span>
	  	    </a>
		</li>
		</c:if>
		
		<!-- 숫자 버튼 -->
	    <c:forEach var="p" begin="${ sessionScope.SelectCriteria.startPage }" end="${ sessionScope.SelectCriteria.endPage }" step="1">
		
		<c:if test="${ sessionScope.SelectCriteria.pageNo eq p }">
			<li><a class="item" disabled><c:out value="${ p }"/></a></li>
		</c:if>
	      
	    <c:if test="${ sessionScope.SelectCriteria.pageNo ne p }">
	   		<li><a onclick="pageButtonAction(this.innerText);" class="item"><c:out value="${ p }"/></a></li>
		</c:if>
		</c:forEach> 
			
	    
	    <!-- 다음 페이지 버튼 -->
	    <c:if test="${ sessionScope.SelectCriteria.pageNo >= sessionScope.SelectCriteria.maxPage }">
	    <li>  
	      <a href="#" aria-label="Next" class="item">
	        <span aria-hidden="true" id="nextPage">&raquo;</span>
	      </a>
	    </li>    
	    </c:if>
		<c:if test="${ sessionScope.SelectCriteria.pageNo < sessionScope.SelectCriteria.maxPage }">
		<li>
		 <a href="#" aria-label="Next" class="item">
	        <span aria-hidden="true" id="maxPage">&raquo;</span>
	     </a> 
	     </li>  
		</c:if>

	  </ul>        
  	</nav>
						
	<script>
	
		const link = "${ pageContext.servletContext.contextPath }/manager/mentilist";
		let searchText = "";
		
		
		if(${ !empty sessionScope.SelectCriteria.searchValue? true: false }) {
			searchText += "&searchValue=${ requestScope.PostitSelectCriteria.searchValue }";
		}
			
		if(document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1" + searchText;
			}
		}
		
		if(document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage=${ sessionScope.SelectCriteria.pageNo - 1 }" + searchText;
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ sessionScope.SelectCriteria.pageNo + 1 }" + searchText;
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ sessionScope.SelectCriteria.maxPage }" + searchText;
			}
		}
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text + searchText;
		}
	</script>
</body>
</html>