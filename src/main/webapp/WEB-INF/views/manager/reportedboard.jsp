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
      
      /* 모달 */
	#repClassmodal { height: auto; left: 40%; width: 550px; top: 10%; }
    .modal-header{text-align: center;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { margin-left: 70%;}
    #repTitle {margin-left: 1%;}
    #repCategory { position: relative; left: 10px;}
    #repNickName { margin-left: 11%;}
    .modal-body {margin-left: 10%;}
    #xbtn {width: 20px; float: right; position: relative; bottom: 40px;}
    
    #resultModal {
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
              <th>잔디닉네임</th>
              <th>내용</th>
              <th>신고 사유</th>
              <th>신고 처리 여부</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="reportClass" items="${ sessionScope.reportClassList }">
              <tr class="repClassBtn">
              	<td>${reportClass.email}</td>
                <td>${reportClass.classDTO.title}</td>
                <td>${reportClass.nickName}</td>
                <td>${reportClass.repContents}</td>
                <td>${reportClass.reportStatementDTO.repType}</td>
                <td>${reportClass.repYn}</td>
                <input type="hidden" value="${ reportClass.repCode }">
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
            <option value="1">클래스</option>
            <option value="2">잔디닉네임</option>
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
    
        <!-- 신고 자세히보기 모달창 -->
    <form id="repForm" method="POST">
   <div class="ui small modal" id="repClassmodal">
       <div class="header modal-header"><h3>신고 클래스 상세내용</h3><img id="xbtn" src="${ pageContext.servletContext.contextPath }/resources/images/xbtn.png" onclick="modalEndBtn(this)"></div>
       <div class="content end-content">
        <br>
          <div class="modal-body" align="left"> 
          	신고카테고리 <input type="text" class="inputSyle repCategory" id="repCategory" name="repCategory" style="width: 300px;" readonly> 
			<br><br>
			신고된 클래스 <input type="text" class="inputSyle repTitle" id="repTitle" name="repTitle" style="width: 300px;" readonly> 
			<br><br>
			닉네임 <input type="text" class="inputSyle repNickName" id="repNickName" name="repNickName" style="width: 300px;" readonly> 
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
    		$(".repClassBtn").click(function(e){
    			
    			console.log($(e.target).parent().children("input[type=hidden]").val());
      			const repCode = $(e.target).parent().children("input[type=hidden]").val();
      			$('#repCodeInput').val(repCode);
      			$.ajax({
      				url: "${ pageContext.servletContext.contextPath }/manager/repClassDetail",
      				data: {repCode : repCode},
      				type: "GET",
      				async:false,
      				success: function(data){
      					console.log('들어감');
      					$('#repCategory').val(data.reportStatementDTO.repType);
      					$('#repTitle').val(data.classDTO.title);
      					$('#repContents').val(data.repContents);
      					$('#repNickName').val(data.nickName);
      				},
      				error: function(xhr, status, error){
      					console.log(error);
      					console.log(xhr);
      				}
      			});
      			
    			$("#repClassmodal").show();
    		});
    		
      		$('#con-btn').click(function(event){
      			//console.log(repCode);
      			// $("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/classConfirm").submit();
     			$("#resultModal").show();
      			event.preventDefault();
      		});
      		
      		$('.resultbtn').click(function(){
      			$("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/classConfirm").submit();
      		});
      		
      		$('.resultExitbtn').click(function(){
      			$('#resultModal').hide();
      			$('#repClassmodal').hide();
      		});
      		
      		$('#end-btn').click(function(){
      			$("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/classSendBack").submit();
      		});
      		
      		$('#searchbtn').click(function(){
      			$("#frm").prop("action","${ pageContext.servletContext.contextPath }/manager/reportedboard").submit();
      		});
      	});
      	
    	function modalEndBtn(item){
      		$("#repClassmodal").hide();
      	}
      </script>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>

<div class="ui mini modal" id="resultModal">
  <div class="content resultContent">
    <div class="title">신고처리가 완료되었습니다.</div>
    <div class="re-modal-btns">
    <button class="ui button btn resultbtn">확인</button>
    <button class="ui button btn resultExitbtn">취소</button>
  </div>
  </div>
</div>
