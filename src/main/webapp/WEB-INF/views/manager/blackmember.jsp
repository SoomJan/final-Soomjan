<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>

    <title>블랙리스트 회원 조회</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css?" rel="stylesheet"/>

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
      
      .warningtable a {
      	text-decoration: none;
    	color: black !important;
      }
      
      .dropsearch {
      	margin-left: 10%;
      }
      
      h1 { color: #91c788;}
      
      .inputSyle{
		border-radius: 0.5rem;
		border: 1.5px solid #91C788;
		background-color: #91C788;
		height: 30px;
		padding:2%;
	  }
	  
	 .contents{
		resize: none;
		border-radius: 0.5rem;
		border: 1.5px solid #91C788;
		background-color: #91C788;
		height: 100px;
		padding:2%;
	
	}
	
	*:focus {
    	outline: 0;
	}

	.btnStyle {
		padding: 5px;
		background-color: #91c788;
		border-radius: 0.5rem;
		font-size: 12px;
		border-color: #91c788;
		float: right;
	}
	
	/* 모달 */
    #blackResultModal {
	  height: 150px;
	  top: 25%;
	  left: 44%;
	}

	.title {
	  position: relative;
	  top: 15%;
	}
	
	.re-modal-btns {
	  margin-top: 10%;
	}
	
	.btn {
	  background-color: white !important;
	}
	
	.resultContent {
	  height: 150px;
	  text-align: center;
	  background-color: #91c788 !important;
	}
    
    .manager-search {margin-left: 5%;}
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>블랙리스트 회원 조회</h1>
        <br />
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>이메일</th>
              <th>이름</th>
              <th>닉네임</th>
              <th>블랙리스트 해지 날짜</th>
              <th>블랙리스트 해지</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="blackMember" items="${ sessionScope.blackMemberList }">
            <tr>
              <td>${ blackMember.email }</td>
              <td>${ blackMember.name }</td>
              <td>${ blackMember.nickName }</td>
              <td>${ blackMember.blackEndDate }</td>
              <td><button class="ui button cancelbtn" id="cancelbtn">해지</button></td>
            </tr>
          </c:forEach> 
          </tbody>
        </table>
         <div class="manager-search">
          <input type="hidden" name="currentPage" value="1" />
          <div class="dropsearch">
          <form id="frm">
          <select
            class="ui dropdown menu"
            id="searchCondition"
            name="searchCondition"
          >
            <option value="" selected>선택</option>
            <option value="1">이메일</option>
            <option value="2">이름</option>
            <option value="3">닉네임</option>
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
        <br />
      </div>
 			<jsp:include page="../common/Paging.jsp" />
    </div>
    </div>
  	<script>
	  	$('.cancelbtn').click(function(e){
	   		console.log($(e.target).parent().parent().children().eq(0).html());
	  		const email = $(e.target).parent().parent().children().eq(0).html();
	  		
	  		$('#blackResultModal').show();
	  		
	  		$('.resultbtn').click(function(){
		  		$.ajax({
		  			url: "${ pageContext.servletContext.contextPath }/manager/blackCancel",
		  			data: { email : email},
		  			type: "POST",
		  			success: function(data){
		  				console.log('들어감');
		  				$('#blackResultModal').hide();
		  				location.reload();
		  			},
		  			error: function(xhr, status, error){
		  				console.log(error);
		  			}
		  		}); 
	  			
	  		});
	  		e.preventDefault();
	  	});
	   	
	   	$('.resultExitbtn').click(function(){
	   		$('#blackResultModal').hide();
	   	})
  	 
  	
  </script>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>

<div class="ui mini modal" id="blackResultModal">
  <div class="content resultContent">
    <div class="title">블랙리스트를 해지하시겠습니까?</div>
    <div class="re-modal-btns">
    <button class="ui button btn resultbtn">확인</button>
    <button class="ui button btn resultExitbtn">취소</button>
  </div>
  </div>
</div>
