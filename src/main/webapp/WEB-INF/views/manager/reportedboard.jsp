<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>신고된 클래스 조회</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />

    <style>
    .input-search {
		width: 400px;
	   	position: relative;
	   	left: 18%;
	   	top: 10px;
	}
	
	#searchCondition {
		float: left;
   		position: relative;
    	left: 16%;
    	top: 10px;
	}
	
	.warningtable a {
      	text-decoration: none;
    	color: black !important;
      }
      
     .dropsearch {
      	margin-left: 10%;
      }
      
      h1 { color: #91c788;}
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>신고된 클래스 조회</h1>
        <br />
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>신고한 회원</th>
              <th>신고된 클래스</th>
              <th>내용</th>
              <th>신고 사유</th>
              <th>신고 처리 여부</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="reportClass" items="${ sessionScope.reportClassList }">
              <tr>
              	<td>${reportClass.email}</td>
                <td>${reportClass.classDTO.title}</td>
                <td>${reportClass.repContents}</td>
                <td>${reportClass.reportStatementDTO.repType}</td>
                <td>${reportClass.repYn}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

         <div class="manager-search">
          <input type="hidden" name="currentPage" value="1" />
          <div class="dropsearch">
          <form action="${ pageContext.servletContext.contextPath }/manager/reportedboard" method="get">
          <select class="ui dropdown menu" id="searchCondition" name="searchCondition">
            <option value="" selected>선택</option>
            <option value="1">이메일</option>
            <option value="2">내용</option>
            <option value="3">신고처리여부</option>
          </select>
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="<c:out value="${ sessionScope.searchValue }"/>">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
    		<!-- 	<input type="button" id="searchbtn"> -->
  				</div>
 			 	<div class="results"></div>
			</div>
			</form>
          </div>
        <br />
      </div>
      <br>
        <jsp:include page="../common/Paging.jsp" />
        <div>
        </div>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
