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
	
	#jandiModal { height: auto; left: 40%; width: 550px; top: 10%; }
    .modal-header{text-align: center;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { margin-left: 70%;}
    #email {margin-left: 11%;}
    #nickName {margin-left: 11%;}
    .modal-body {margin-left: 8%;}
    #xbtn {width: 20px; float: right; position: relative; bottom: 40px;}
    
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
	
	.resultContent {
	  height: 150px;
	  text-align: center;
	}

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
              <tr class="move jandiBtn" onclick="location.href='${ pageContext.servletContext.contextPath}/findJandi/jandiProfile/${ jandiMember.email }'">
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
        
        <!-- 잔디회원 상세조회 -->
        <form id="jandiForm" method="POST">
        <div class="ui small modal" id="jandiModal">
       <div class="header modal-header"><h3>잔디 상세내용</h3><img id="xbtn" src="${ pageContext.servletContext.contextPath }/resources/images/xbtn.png" onclick="modalEndBtn(this)"></div>
       <div class="content resultContent">
        <br>
          <div class="modal-body" align="left"> 
          	이미지 첨부<br>
			<br>
			<img id=imgPath name="imgPath" style="width: 300px;"/> 
			<br><br>
			이메일 <input type="text" class="inputSyle email" id="email" name="email" style="width: 300px;" readonly> 
			<br><br>
			닉네임 <input type="text" class="inputSyle nickName" id="nickName" name="nickName" style="width: 300px;" readonly> 
			<br><br> 
			클래스<br>
			<br>
			<textarea name="jandiClass" id="jandiClass" class="contents jandiClass" readonly style="width: 400px;" ></textarea>
			</div>
			<br><br>
			잔디가입날짜 <input type="text" class="inputSyle enrollDate" id="enrollDate" name="enrollDate" style="width: 300px;" readonly> 
			<hr>
			<div class="context-modal-btn">
	           <button class="ui button btn1" id="con-btn" style="background-color: #91C788 !important;">확인</button>
            </div>
        </div>
      </div>
      </form>
      <script>
      $(function(){
    		$(".jandiBtn").click(function(e){
    			console.log($(e.target).parent().children(0).val());
    			const email = $(e.target).parent().children(0).val();
    			$.ajax({
    				url: "${ pageContext.servletContext.contextPath }/manager/jandiDetail",
    				data: {email : email},
    				type: "GET",
    				async:false,
    				success: function(data){
    					console.log('들어감');
    					console.log(data.repCategory);
    					$('#email').val(data.email);
    					$('#nickName').val(data.nickName);
    					$('#jandiClass').val(data.title);
    					$('#enrollDate').val(data.enrollDate);
    					$('#imgPath').prop('src','${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/' + data.profile_path);
    				},
    				error: function(xhr, status, error){
    					console.log(error);
    					console.log(xhr);
    				}
    			});
    			
    			$("#jandiModal").show();
    			
    		});
      });
      </script>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
