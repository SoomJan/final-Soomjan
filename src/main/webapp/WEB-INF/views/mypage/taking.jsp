<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>수강중인 클래스</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    <style>
       .takingtable thead tr th {border-bottom: none !important;} /* 수강중인 클래스 테이블 */
       /* .dropdown { position: relative; left: 12%;} 정렬 */
       /* .search {position: relative; right: 13%;} 검색 */
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">수강중인 클래스</p>
        <br>
        <div class="dropsearch">
          <form action="${ pageContext.servletContext.contextPath }/mypage/taking" method="get">
            <input type="hidden" name="currentPage" value="1" />
		<select class="ui dropdown" id="searchCondition" name="searchCondition">
  			<option value="1">카테고리</option>
  			<option value="2">클래스명</option>
  			<option value="3">잔디 닉네임</option>
		</select>
    <div class="ui search">
      <div class="ui icon input">
        <input class="prompt" type="search" name="searchValue" id="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
        <button id="searchbtn" style="border: none; background:none; position: relative; right: 18%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
      </div>
      <div class="results"></div>
    </div>
  </div>
</form>
  <br><br><br><br>
<c:choose>
  <c:when test="${ empty classList }">
    <div class="unlist-text">
      수강중인 클래스가 없습니다.<br>
      필터를 다시 적용하거나 새로운 클래스를 찾아보세요.
    </div>
  </c:when>
  <c:when test="${ not empty classList }">
<table class="ui single line table takingtable">
  <thead>
    <tr>
      <th>카테고리</th>
      <th>클래스제목</th>
      <th>강사닉네임</th>
      <th>수강기간</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="size" begin="0" end="${ fn:length(classList)-1 }">
    <tr class="classInfo${ size + 1 }">
      <td>${ classList[size].categoryDTO.categoryName }</td>
      <td>${ classList[size].classDTO.title }</td>
      <td>${ classList[size].jandiDTO.nickName }</td>
      <td>${ classList[size].paymentDTO.payDate } - ${ classList[size].endDate }</td>
    </tr>

    <script>

      /* 마우스 커서 이벤트 */
      $(function(){
        $(".classInfo${ size + 1 }").hover(
          function() {
            $(this).css("color" , "green").css("cursor", "pointer");
          },
          function() {
            $(this).css("color", "black").css("cursor", "default");
          }
        );
      });

      /* 클릭 시 클래스 인포로 이동 */
      $(function() {
        $(".classInfo${ size + 1 }").click(function(){
          location.href="${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=${ classList[size].classDTO.classCode }";
        });
      });
    </script>
    
    </c:forEach>
  </tbody>
</table>
<jsp:include page="../common/Paging.jsp" />
</c:when>
</c:choose>
      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>