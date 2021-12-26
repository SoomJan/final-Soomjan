<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>신고된 회원 조회</title>

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
	#repMembermodal { height: auto; left: 40%; width: 550px; top: 10%; }
    .modal-header{text-align: center;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { margin-left: 70%;}
    #repEmail {margin-left: 11%;}
    #repNickName {margin-left: 11%;}
    #repCategory { position: relative; left: 10px;}
    .modal-body {margin-left: 8%;}
    #xbtn {width: 20px; float: right; position: relative; bottom: 40px;}
    
    #resultModal {
	  height: 150px;
	  top: 25%;
	  left: 44%;
	}
	
	#alreadyModal {
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
            <option value="2">닉네임</option>
            <option value="3">내용</option>
            <option value="4">신고처리여부</option>
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
			   <input type="hidden" id="isBlack" name="isBlack">
	           <button class="ui button btn1" id="con-btn" style="background-color: #91C788 !important;">신고</button>
	           <button class="ui button btn1" id='end-btn' style="background-color: lightgray !important;">반려</button>
            </div>
        </div>
      </div>
      </form>
	<script>
	/* 모달창에 신고된 회원 상세 내용 띄워주기 */
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
                 $('#isBlack').val(data.isBlack);
                 $('#imgPath').prop('src','${ pageContext.servletContext.contextPath }/resources/uploadFiles/reportFiles/' + data.imgPath);
              },
              error: function(xhr, status, error){
                 console.log(error);
                 console.log(xhr);
              }
           });
           $("#repMembermodal").show();
        });

  		/* 신고버튼 클릭 후 '확인' 버튼 클릭 시 블랙리스트 회원인지 조회하기 */
  		$('#con-btn').click(function(event){
  			
  		    let isBlack = $('#isBlack').val();
  		    console.log(isBlack);

  		    if(isBlack == 'Y') {
  		    	alert('이미 블랙리스트 회원입니다.');
  		    } else {
  			 $("#resultModal").show();
  		    }
  			 event.preventDefault();
  		});
  		
  		/* 신고처리 */
  		$('.resultbtn').click(function(){
  			
  			 $("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/confirm").submit(); 
  		});
  		
  		/* '취소' 클릭시 모달창 닫기 */
  		$('.resultExitbtn').click(function(){
  			$('#resultModal').hide();
  			$('#repMembermodal').hide();
  		});
  		
  		/* 반려버튼 클릭 시 신고반려 처리하기 */
  		$('#end-btn').click(function(){
  			$("#repForm").prop("action","${ pageContext.servletContext.contextPath }/manager/sendBack").submit();
  		});
  		
  		/* 검색 기능 */
  		$('#searchbtn').click(function(){
  			$("#frm").prop("action","${ pageContext.servletContext.contextPath }/manager/reportedmentee").submit();
  		});
  		
  	});
  	
		/* 모달창 상단의  x버튼 클릭 시 모달창 닫기 */
	  	function modalEndBtn(item){
	  		$("#repMembermodal").hide();
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
