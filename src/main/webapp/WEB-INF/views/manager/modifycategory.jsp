<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    /> -->
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/manager/modifycategory.css"
    rel="stylesheet"
  />

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="resources/css/semantic/semantic.css"
    />
    <script src="resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script type="text/javascript" src="css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>클래스 카테고리 수정</h1>
        <br><br>
        <div class="modifycategory-left">
          <h4> 현재 카테고리</h4>

          <table class="category-table">
            <thead>
              <tr>
                <td>카테고리 번호</td>
                <td>카테고리 이름</td>
              </tr>
            </thead>

            <tbody>
             	<c:forEach var="category" items="${categoryList }">
            	<tr>
             		<td> ${ category.categoryCode } </td>
					    <td>${ category.categoryName }</td>             	
             	</tr>
             	</c:forEach>
            </tbody>
          </table>

        </div>
        <div class="modifycategory-right">
          <h4> 수정할 카테고리</h4>
          <form action="${ pageContext.servletContext.contextPath }/manager/modifycategory" method="POST">
            <input type="text" name="categoryName">
            <button type="submit">추가하기</button>
          </form>
          
        </div>
      </div>
      </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
