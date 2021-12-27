<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>관리자 계정 관리</title>
    
    <link href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css" rel="stylesheet"/>
    
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
    
    .delete {background-color: #91c788 !important; height: 35px; width: 100px;}
    .create {background-color: #91c788 !important; height: 35px; width: 100px;}
    
    .create {
  		padding: 5px;
  		border-radius: 0.5rem;
  		font-size: 12px;
  		border-color: #91c788;
  		width: 10%;
  		height: 35px;
 		background-color: #91c788;
 		position: relative;
    	top: 20px;
	}
    
    .create-pro {
    	border: 5px solid #91c788;
    	padding: 4%;
    	border-radius: 30px;
    	height: auto;
    }
    
    .re-modal-btns{position: relative; top: 35%;}
    .title{font-weight: 800;}
    
   .input > input {width: 400px;}
   
   .modalContent {background-color: #91c788;}
   
   #mngName { margin-left: 18%;}
   #mngNickName {margin-left: 15%;}
   #mngId {margin-left: 15%;}
   #password {margin-left: 12%;}
   #password2 {margin-left: 5%;}
   
   
    
  </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
      <h1 id="category"> 관리자 계정 관리 </h1>
	  <br>
      <h3>관리자 계정 정보</h3>
      <table class="ui basic table warningtable">
        <thead>
          <tr>
            <th></th>
            <th>관리자이름</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>계정 비활성화</th>
          </tr>
        </thead>
        <tbody>
           <c:forEach var="managerMember" items="${ managerList }">
          <tr>
            <td><input class="check" value="${ managerMember.mngNo }" type="checkbox" name="check"></td>
            <td>${ managerMember.mngName }</td>
            <td>${ managerMember.mngId }</td>
            <td>${ managerMember.mngNickName }</td>
            <td>${ managerMember.isDeleted }</td>
          </tr>
            </c:forEach>
        </tbody>
      </table>
		<br>
      <form>
      <input class="ui button delete btn" type="submit" value="계정 비활성화" style="width: 130px;">
      </form>

      <h3>관리자 계정 생성 </h3>
      <form class="create-pro" action="${ pageContext.servletContext.contextPath }/manager/msregist" method="post" id="createForm">     
      <div>
     	 <div class="checkmain">이름
    	<div class="ui input"><input type="text" class="pd1" id="mngName" name="mngName"><span class="nameCheck" style="margin-left:10px; margin-top: 7px;"></span></div>
    	</div>
      </div>
      <br>
      <div>
      	<div class="checkmain">닉네임
    	<div class="ui input"><input type="text" class="pd2" id="mngNickName" name="mngNickName"><span id="nickNamecheck" style="margin-left:10px; margin-top: 7px;"></span></div>
    	</div>
      </div>
      <br>
      <div>
      	<div class="checkmain">아이디
    	<div class="ui input"><input type="text" class="pd3" id="mngId" name="mngId"><span id="emailcheck" style="margin-left:10px; margin-top: 7px;"></span></div>
    	</div>
      </div>
      <br>
      <div>
      	<div class="checkmain">비밀번호
    	<div class="ui input"><input type="password" class="pd4" id="password" name="password"><span id="pwd" style="margin-left:10px; margin-top: 7px;"></span></div>
    	</div>
      </div>
      <br>
      <div>
      	<div class="checkmain">비밀번호확인
    	 <div class="ui input"><input type="password" class="pd5" id="password2" name="password2"><span id="pwdcheck" style="margin-left:10px; margin-top: 7px;"></span></div>
    	</div>
      </div>
      
      <input class="ui button create btn" id="create" type="button" value="계정 생성" style="width: 130px;">
      </form>

      <script>
      
      /* 관리자 계정 생성 - 이름 체크 */
       $(function () {
          $("#mngName").keyup(function () {
            let filter = /^[가-힣]+$/;

            if (!filter.test($(this).val())) {
              $(".nameCheck")
                .html("올바르지 않은 이름 형식입니다.")
              $(this).focus().css("background", "lightpink");
            } else {
              $(".nameCheck")
                .html("올바른 이름 형식입니다.")
              $(this).focus().css("background", "#E3FFEC");
            }
          });
        });
      
      /* 관리자 계정 생성 - 이메일 체크 */
              $('#mngId').on('keyup',function(){
        	const email = $('#mngId').val();
        	$.ajax({
              	url:"${ pageContext.servletContext.contextPath }/manager/emailCheck",
              	data: {email : email},
              	type: "POST",
              	success: function(data){
              		if(data == "true"){
              			console.log(data);
              			$('#emailcheck').html('이미 있는 이메일 주소입니다.');
                        $('#mngId').focus().css("background", "lightpink");
              		} else {
              			$('#emailcheck').html('사용 가능한 이메일입니다.');
                        $('#mngId').focus().css("background", "#E3FFEC");
              		}
              	},
              	error: function(xhr, status, error){
              		console.log(error);
              		
              	}
              });
        	});
      
      /* 관리자 계정 생성 - 비밀번호 확인 체크 */
              $(function () {
                  $("#password2").keyup(function () {
                    if ($("#password").val() != $("#password2").val()) {
                      $("#pwdcheck")
                        .html("비밀번호가 일치하지 않습니다.")
                      $(this).focus().css("background", "lightpink");
                      $("#password").css("background", "lightpink");
                    } else {
                      $("#pwdcheck")
                        .html("비밀번호가 일치합니다.")
                      $(this).focus().css("background", "#E3FFEC");
                      $("#password").css("background", "#E3FFEC");
                    }
                  });
                });
      
       /* 관리자 계정 생성 - 닉네임 체크 */
              $('#mngNickName').on('keyup',function(){
        	const nickName = $('#mngNickName').val();
        	$.ajax({
              	url:"${ pageContext.servletContext.contextPath }/manager/nickNameCheck",
              	data: {nickName : nickName},
              	type: "POST",
              	success: function(data){
              		if(data == "true"){
              			console.log(data);
              			$('#nickNamecheck').html('이미 있는 닉네임입니다.')
                        $('#mngNickName').focus().css("background", "lightpink");
              		} else {
              			$('#nickNamecheck').html('사용 가능한 닉네임입니다.')
                        $('#mngNickName').focus().css("background", "#E3FFEC");
              		}
              	},
              	error: function(xhr, status, error){
              		console.log(error);
              		
              	}
              });
        	});
      
        /* 관리자 계정 등록하기 전체조건 확인 */
        $(function(){
          $("#create").click(function(e){
            
            let name = $(".pd1").val();
            let nickName = $(".pd2").val();
            let id = $(".pd3").val();
            let pwd = $(".pd4").val();

            e.preventDefault();

            if(!name) {
              $("#nameModal").fadeIn();
              $(".btn").click(function(){
              $("#nameModal").fadeOut();
              });
            } else if(!nickName) {
              $("#nickModal").fadeIn();
              $(".btn").click(function(){
                $("#nickModal").fadeOut();
              });
            } else if(!id) {
              $("#idModal").fadeIn();
              $(".btn").click(function(){
                $("#idModal").fadeOut();
              });
            } else if(!pwd) {
              $("#pwdModal").fadeIn();
              $(".btn").click(function(){
                $("#pwdModal").fadeOut();
              });
            } else {
              $("#createModal").fadeIn();
              $("#crebtn").click(function(){
                $("#createModal").fadeOut();
                $("#resultModal").fadeIn();
                $('#createForm').submit();
              $("#nobtn").click(function(){
                window.location.reload();
              });
              });
            }
          });
        });

        /* 관리자 계정 비활성화하기 */
        $(function(){
          $(".delete").click(function(e){

            var chkArray = new Array();
            
            $("input:checkbox[name='check']:checked").each(function(){
            	chkArray.push(this.value);
            });

            e.preventDefault();

            if(chkArray == '') {
              $("#nullModal").fadeIn();
              $(".btn").click(function(){
                $("#nullModal").fadeOut();
              });
            } else {
              $("#deleteModal").fadeIn();
              $(".deletebtn1").click(function(){
            	 
            	$.ajax({
            		type: "POST",
            		url: "${ pageContext.servletContext.contextPath }/manager/inactiveManager",
            		data: {checkbox : chkArray},
            		success: function(data){
            			console.log("들어감");
            		},
            		error: function(xhr,status,error){
            			console.log("에러");
            		}
            	});
            	  
                $("#deleteModal").fadeOut();
                $("#resultModal2").fadeIn();
             $(".resultbtn").click(function(){
                window.location.reload();
             });
              });
              $(".deletebtn2").click(function(){
            	  $("#deleteModal").fadeOut();
              });
            }
          });
        });

      </script>
        
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>

<!-- 모달창 모아두는 곳 -->
<div class="ui mini modal" id="nameModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">이름을 입력해주세요.</div>
    <div class="re-modal-btns">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nickModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">닉네임을 입력해주세요.</div>
    <div class="re-modal-btns">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="idModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">아이디를 입력해주세요.</div>
    <div class="re-modal-btns">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="pwdModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">비밀번호를 입력해주세요.</div>
    <div class="re-modal-btns">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="createModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">관리자를 등록하시겠습니까?</div>
    <div class="re-modal-btns">
    <button class="ui button btn" id="crebtn">확인</button>
    <button class="ui button btn" id="">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">계정 등록이 완료되었습니다.</div>
    <div class="re-modal-btns">
    <button class="ui button btn" onclick="location.href='${ pageContext.servletContext.contextPath }/manager/manproduce'">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nullModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">선택된 관리자가 존재하지 않습니다.</div>
    <div class="re-modal-btns">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="deleteModal">
  <div class="content" style="background-color: #91c788;">
    <div class="title">해당 관리자계정을 비활성화하시겠습니까?</div>
    <div class="re-modal-btns">
    <button class="ui button btn deletebtn1">확인</button>
    <button class="ui button btn deletebtn2">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal2">
  <div class="content" style="background-color: #91c788;">
    <div class="title">계정 비활성화가 완료되었습니다.</div>
    <div class="re-modal-btns">
    <button class="ui button btn resultbtn">확인</button>
  </div>
  </div>
</div>