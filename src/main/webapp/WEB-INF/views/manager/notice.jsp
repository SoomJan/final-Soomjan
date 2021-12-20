<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>공지사항 관리</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />
      
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>공지사항 관리</h1>
        <br />
        <a href="${ pageContext.servletContext.contextPath }/manager/addnotice" class="addnotice">
          <button>공지사항 작성</button></a>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>공지사항 번호</th>
              <th>제목</th>
              <th>날짜</th>
              <th>활성화 상태</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="faq" items="${ faqList }">
              <tr onclick="location.href='${pageContext.servletContext.contextPath}/manager/noticeDetail/${ faq.postCode }'">
                <td>${ faq.postCode }</td>
                <td>${ faq.title }</td>
                <td>${ faq.writeDate }</td>
                <td>${ faq.isDeleted }</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
       
        <div class="manager-search">
          <input type="hidden" name="currentPage" value="1" />
          <form
            action="${ pageContext.servletContext.contextPath }/manager/notice"
            method="get">
          <input
            class="menu"
            id="searchCondition"
            name="searchCondition"
            style="display: none"
            value="title"
          >
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
    			<i class="search icon"><input type="submit" style="display: none;"></i>
  				</div>
 			 	<div class="results"></div>
			</div>
			</form>
     	 </div>
     	 <br>	
      <jsp:include page="../common/Paging.jsp" />
      </div>

      <script>
        $(function () {
          $(".move").hover(
            function () {
              $(this).css("background", "gray");
            },
            function () {
              $(this).css("background", "white");
            }
          );
        });

      </script>


    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
