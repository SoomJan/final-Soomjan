<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
       .dropdown { position: relative; left: 12%;} /* 정렬 */
       .search {position: relative; right: 13%;} /* 검색 */
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
		<select class="ui dropdown">
  			<option value="">정렬순</option>
  			<option value="1">최신클래스순</option>
  			<option value="0">제목순</option>
		</select>
    <div class="ui search">
      <div class="ui icon input">
        <input class="prompt" type="text">
        <i class="search icon"></i>
      </div>
      <div class="results"></div>
    </div>
  </div>
  <br><br>
  <!-- <div class="unlist-text">
  수강중인 클래스가 없습니다.<br>
  필터를 다시 적용하거나 새로운 클래스를 찾아보세요.
</div> -->
<br><br><br>
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
  <c:forEach var="pClass" items="${ classList }">
    <tr>
      <td>${ pClass.categoryDTO.categoryName }</td>
      <td>${ pClass.classDTO.title }</td>
      <td>${ pClass.teacher }</td>
      <td>${ pClass.classDTO.createDate } - ${ pClass.endDate }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>
      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>