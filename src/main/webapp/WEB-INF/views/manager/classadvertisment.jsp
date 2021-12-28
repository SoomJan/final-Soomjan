<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>현재 광고중인 클래스</title>

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
        <h1>현재 광고중인 클래스</h1>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>클래스 이름</th>
              <th>멘토</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
             <c:forEach var="ad" items="${ purchaseAd }">
            	 <tr class="calClass">
	                <td>${ ad.classDTO.title }</td>
	                <td>${ ad.classDTO.email }</td>
	                <td>${ ad.startDate }</td>
         	    </tr>
             </c:forEach>
          </tbody>
        </table>
        
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
