<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>등록된 멘토 조회</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css"
      rel="stylesheet"
    />

    <style>
    .warningtable tbody {
      text-align: center;
    }

    .warningtable thead {
      background-color: #E3FFEC;
      text-align: center;
    }
    
    .introduce-detail img {
      width: 60%;
      height: 60%;
      text-align: center;
    }

    p {
    font-weight: bold;
    font-size: 20px;
    }
    
    .manager-paging ul li a {color: white !important;}
    
    .manager-paging {
  		width: 40%;
 		margin: 0 auto;
 		height: 50px;
 		text-align: center;
  		position: relative;
 		top: 20px;
 		 /* border: 1px solid blue; */
	}

	.input-search {
		width: 400px;
    	position: relative;
    	left: 8%;
    	top: 10px;
	}
	
/* 	#searchCondition {
		float: left;
   		position: relative;
    	left: 15%;
    	top: 35%;
	} */

    .dropdown {float: left; left: 6%; top:10px;} /* 정렬 */
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
      <h1 id="category"> 등록된 잔디 조회 </h1> <br>
    
          <table class="ui basic table warningtable">
            <thead>
              <tr>
                <th>이메일</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>잔디 등록 일자</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="jandiMember" items="${ sessionScope.jandiList }">
              <tr class="move">
                <td>${ jandiMember.email }</td>
                <td>${ jandiMember.acc_name }</td>
                <td>${ jandiMember.nickName }</td>
                <td>${ jandiMember.enroll_date }</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>

          <script>
         
 /*          $(function(){
            $(".move").hover(function(){
              $(this).css('background', 'gray');
            }, function(){
              $(this).css('background', 'white');
            });
          }); */

/*           $(function(){
            $(".move").click(function(){
              location.href="${ pageContext.servletContext.contextPath }/test.jsp";
            });
          }); */

          </script>
          <div class="manager-search">
          <input type="hidden" name="currentPage" value="1" />
                  <div class="dropsearch">
          <form action="${ pageContext.servletContext.contextPath }/manager/mentolist" method="get">
		<select 
		  	id="searchCondition"
            name="searchCondition"
			class="ui dropdown menu">
			<option value="" selected>선택</option>
  			<option value="1">이메일</option>
  			<option value="2">닉네임</option>
  			<option value="3">이름</option>
		</select>   
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
  				</div>
 			 	<div class="results"></div>
			</div>
			</form>
			</div>
          </div>
          <div>
          </div>
			 <jsp:include page="../common/Paging.jsp" />
        </div>
        </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
