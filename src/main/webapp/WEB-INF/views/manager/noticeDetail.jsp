<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/addnotice.css"
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
        <h1>공지사항 조회</h1>
        <br /><br />

        <div class="notice">
           <div class="notice-div">
              <div class="notice-title"><h2><c:out value="${ faq.title }" /> </h2></div>
             <div class="notice-date"><h6><c:out value="${ faq.writeDate }" /></h6></div>
          </div>
          <br/> <hr> <br>
        <form action="${ pageContext.servletContext.contextPath }/manager/modifyContents" method="post">
          <input name="postCode" style="visibility: hidden;" value="${ faq.postCode }" >         
           <textarea name="contents" id="contents" readonly="true">${ faq.contents }</textarea>
            <button type="submit" id="changecontents" style="display: none;">저장하기</button>
        </form>
        </div>

        <div class="modifybutton">
        <button onclick="modifycontents()">수정하기</button>

        <c:if test="${faq.isDeleted eq 'N'}">
        <button onclick="location.href='${pageContext.servletContext.contextPath}/manager/modifyContents'">비활성화</button>
      </c:if>
      <c:if test="${faq.isDeleted eq 'Y'}">
        <button onclick="location.href='${pageContext.servletContext.contextPath}/manager/noticeDetail/${ faq.postCode }'">비활성화 해제</button>
      </c:if>
      </div>
          <script>
            function modifycontents() {
               $('#contents').attr("readonly",false); 
               $('#contents').attr("style","border:1px solid black"); 
               $('#changecontents').attr("style","display:block")
    }
          </script>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
