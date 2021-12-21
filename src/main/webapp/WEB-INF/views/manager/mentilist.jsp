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

    <title>등록된 멘티 조회</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" />
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script type="text/javascript" src="css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
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

        <script>
/*           $(function () {
            $(".move").hover(
              function () {
                $(this).css("background", "gray");
              },
              function () {
                $(this).css("background", "white");
              }
            );
          }); */

 /*          $(function () {
            $(".move").click(function () {
              location.href =
                "${ pageContext.servletContext.contextPath }/test.jsp";
            });
          }); */
        </script>

          <form
            action="${ pageContext.servletContext.contextPath }/manager/mentilist"
            method="get" id="searchform">
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
    		<!-- 	<input type="button" id="searchbtn"> -->
  				</div>
 			 	<div class="results"></div>
			</div>
          </div>
			<jsp:include page="../common/Paging.jsp" />
			</form>
        </div>
      </div>
      <script>
/*        	$(function(){
      		$("#searchbtn").click(function(){
      			$("#searchform").submit();
      		});
      	}); */
      </script>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
