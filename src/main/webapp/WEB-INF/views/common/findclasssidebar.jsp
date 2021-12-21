<%@ page language="java" contentType="text
/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
   
    <title>클래스 찾기 사이드 바</title>

  </head>
  <body>
    <div id="sidebar">
      <div class="sidebar-inner-name">
        <h1>클래스</h1>
        <hr class="border-1px-black" />
      </div>
      <div class="sidebar-inner-name1">
        <ul>
          <li><a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain">전체 클래스</a></li>
          <li><a href="${ pageContext.servletContext.contextPath }/findclass/findTopClassMain">인기 클래스</a></li>
        </ul>
        <hr class="border-1px-black" />
        <ul>
          <c:if test="${ not empty findClassList }">
            <c:forEach var="categoryList" items="${ categoryList }">
              <li><a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain?categoryCode=${ categoryList.categoryCode }">${ categoryList.categoryName }</a></li>
            </c:forEach>
          </c:if>

          <c:if test="${ not empty topClassList }">
            <c:forEach var="categoryList" items="${ categoryList }">
              <li><a href="${ pageContext.servletContext.contextPath }/findclass/findTopClassMain?categoryCode=${ categoryList.categoryCode }">${ categoryList.categoryName }</a></li>
            </c:forEach>
          </c:if>
        </ul>
        <hr class="border-1px-black" />
      </div>
    </div>
  </body>

</html>
