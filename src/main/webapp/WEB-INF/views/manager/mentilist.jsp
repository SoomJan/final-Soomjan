<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>등록된 새싹 조회</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css" rel="stylesheet"/>

    <style>
      .warningtable tbody {
        text-align: center;
      }

      .warningtable thead {
        background-color: #e3ffec;
        text-align: center;
      }

      .introduce-detail img {
        width: 60%;
        height: 60%;
        text-align: center;
      }

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
      p {
        font-weight: bold;
        font-size: 20px;
      }

      .manager-paging ul li a {
        color: white !important;
      }

      .manager-paging {
        width: 40%;
        margin: 0 auto;
        height: 50px;
        text-align: center;
        position: relative;
        top: 20px;
        /* border: 1px solid blue; */
      }
      
      .manager-search{margin-left: 20%;}

    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
        <h1 id="category">등록된 새싹 조회</h1>
        <br />

        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>이메일</th>
              <th>이름</th>
              <th>닉네임</th>
              <th>잔디 여부</th>
              <th>경고 횟수</th>
              <th>블랙 리스트</th>
              <th>가입 날짜</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="ssackMember" items="${ sessionScope.ssackList }">
              <tr class="move">
                <td>${ ssackMember.email }</td>
                <td>${ ssackMember.name }</td>
                <td>${ ssackMember.nickName }</td>
                <td>${ ssackMember.isJandi }</td>
                <td>${ ssackMember.warning }</td>
                <td>${ ssackMember.isBlack }</td>
                <td>${ ssackMember.enrollDate }</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
          <form action="${ pageContext.servletContext.contextPath }/manager/mentilist" method="get" id="searchform">
        <div class="manager-search">
          <input type="hidden" name="currentPage" value="1" />
          <select
            class="ui dropdown menu"
            id="searchCondition"
            name="searchCondition"
          >
          	<option value="" selected>선택</option>
            <option value="1">닉네임</option>
            <option value="2">이메일</option>
            <option value="3">이름</option>
          </select>
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
  				</div>
 			 	<div class="results"></div>
			</div>
          </div>
			<jsp:include page="../common/Paging.jsp" />
			</form>
        </div>
      </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
