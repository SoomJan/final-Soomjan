<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>신고된 회원 조회</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css?"
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
	#repMembermodal { height: auto; left: 40%; width: 550px; top: 10%; }
    .modal-header{text-align: center;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { margin-left: 70%;}
    #repEmail {margin-left: 11%;}
    #repNickName {margin-left: 11%;}
    #repCategory { position: relative; left: 10px;}
    .modal-body {margin-left: 8%;}
    #xbtn {width: 20px; float: right; position: relative; bottom: 40px;}
      
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>신고된 회원 조회</h1>
        <br />
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>이메일</th>
              <th>닉네임</th>
              <th>내용</th>
              <th>신고 사유</th>
              <th>신고 날짜</th>
              <th>신고 처리 여부</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="reportedMember" items="${ sessionScope.reportMemberList }">
            <tr class="repbtn">
              <td>${ reportedMember.repEmail }</td>
              <td>${ reportedMember.nickName }</td>
              <td>${ reportedMember.contents }</td>
              <td>${ reportedMember.reportStatementDTO.repType }</td>
              <td>${ reportedMember.repDate }</td>
              <td>${ reportedMember.repYn }</td>
              <input type="hidden" value="${ reportedMember.repCode }">
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
            <option value="2">내용</option>
            <option value="3">신고처리여부</option>
          </select>
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
    		<!-- 	<input type="button" id="searchbtn"> -->
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
 
    
    <!-- 신고 자세히보기 모달창 -->
    <form id="repForm" method="POST">
   <div class="ui small modal" id="repMembermodal">
       <div class="header modal-header"><h3>신고 회원 상세내용</h3><img id="xbtn" src="${ pageContext.servletContext.contextPath }/resources/images/xbtn.png" onclick="modalEndBtn(this)"></div>
       <div class="content end-content">
        <br>
          <div class="modal-body" align="left"> 
          	신고카테고리 <input type="text" class="inputSyle repCategory" id="repCategory" name="repCategory" style="width: 300px;" readonly> 
			<br><br>
			이메일 <input type="text" class="inputSyle repEmail" id="repEmail" name="repEmail" style="width: 300px;" readonly> 
			<br><br>
			닉네임 <input type="text" class="inputSyle repNickName" id="repNickName" name="repNickName" style="width: 300px;" readonly> 
			<br><br>
			이미지 첨부<br>
			<br>
			<img id=imgPath name="imgPath" style="width: 300px;"/>
			<br><br> 
			신고사유<br>
			<br>
			<textarea name="repContents" id="repContents" class="contents repContents" readonly style="width: 400px;" ></textarea>
			</div>
			<hr>
			<div class="context-modal-btn">
			   <input type="hidden" id="repCodeInput" name="repCode">
	           <button class="ui button btn1" id="con-btn" style="background-color: #91C788 !important;">신고</button>
	           <button class="ui button btn1" id='end-btn' style="background-color: lightgray !important;">반려</button>
            </div>
        </div>
      </div>
      </form>
	<script>
	$(function(){
  		$(".repbtn").click(function(e){
  			console.log($(e.target).parent().children("input[type=hidden]").val());
  			const repCode = $(e.target).parent().children("input[type=hidden]").val();
  			$('#repCodeInput').val(repCode);
  			$.ajax({
  				url: "${ pageContext.servletContext.contextPath }/manager/repDetail",
  				data: {repCode : repCode},
  				type: "GET",
  				async:false,
  				success: function(data){
  					console.log('들어감');
  					console.log(data.repCategory);
  					$('#repCategory').val(data.repCategory);
  					$('#repEmail').val(data.repEmail);
  					$('#repNickName').val(data.repNickName);
  					$('#repContents').val(data.repContents);
  					$('#imgPath').prop('src','${ pageContext.servletContext.contextPath }/resources/uploadFiles/reportFiles/' + data.imgPath);
  				},
  				error: function(xhr, status, error){
  					console.log(error);
  					console.log(xhr);
  				}
  			});
  			//$('#repMemberModal').show();
  			
  			$("#repMembermodal").show();
  			
/*   		  	$("#xbtn").click(function(){
         	 	$("#repMembermodal").hide();
          	} */
  		});
  		
  		$('#con-btn').click(function(){
  			//console.log(repCode);
  			$("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/confirm").submit();
  		});
  		
  		$('#end-btn').click(function(){
  			$("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/sendBack").submit();
  		});
  		
  		$('#searchbtn').click(function(){
  			$("#frm").prop("action","${ pageContext.servletContext.contextPath }/manager/reportedmentee").submit();
  		});
  		
  	});
  		
  	function modalEndBtn(item){
  		$("#repMembermodal").hide();
  	}
	
	</script>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
