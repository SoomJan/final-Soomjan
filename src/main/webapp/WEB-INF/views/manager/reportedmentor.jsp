<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>신고된 잔디 조회</title>

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
        <h1>신고된 잔디 내역 조회</h1>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>신고된 잔디</th>
              <th>내용</th>
              <th>신고 사유</th>
              <th>신고 처리 여부</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="manager" items="${ managerList }">
              <tr>
                <td>${manager.mngId}</td>
                <td>${manager.mngName}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <div class="manager-search">
          <div class="ui search menti-search">
            <div class="ui icon input input-search">
              <input class="prompt" type="text" />
              <i class="search icon"></i>
            </div>
            <div class="results"></div>
          </div>
        </div>
        <div>
          <div class="manager-paging">
            <ul>
              <li><a href="#">Prev</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">next</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
