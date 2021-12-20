<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>공지사항 작성</title>

  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>공지사항 작성</h1>
        <br /><br />
        <form class="notice-wrapper" action="${ pageContext.servletContext.contextPath }/manager/addnotice" method="post">
          <div>
            제목 : <input type="text" name="title" /><br />내용 :<br />

            <textarea rows="30" cols="80" name="contents">작성하기</textarea>
          </div>
          <button type="submit">제출하기</button>
        </form>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
