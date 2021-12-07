<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>관리자 계정 관리</title>
    
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
    rel="stylesheet"
    />
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
    rel="stylesheet"
    /> 
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css"
    rel="stylesheet"
    />
    
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
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
  		height: 30px;
  		position: relative;
  		left: 85%;
 		background-color: #91c788;
  		relative;
  		left: 88%;
  		bottom: 60px;
}
    
    .create-pro {
    	border: 3px solid #91c788;
    	padding: 4%;
    	border-radius: 10px;
    	height: 365px;
    }

	.nameCheck {
	position: relative;
    left: 7%;
    top: 5px;
    }
    
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
      <h1 id="category"> 관리자 계정 관리 </h1>

      <h3>관리자 계정 정보</h3>
      <table class="ui basic table warningtable">
        <thead>
          <tr>
            <th></th>
            <th>닉네임</th>
            <th>아이디</th>
            <th>계정 비활성화</th>
          </tr>
        </thead>
        <tbody>
           <c:forEach var="managerMember" items="${ managerList }">
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>${ managerMember.mngNickName }</td>
            <td>${ managerMember.mngId }</td>
            <td>${ managerMember.isDeleted }</td>
          </tr>
            </c:forEach>
        </tbody>
      </table>

      <form>
      <input class="delete btn" type="submit" value="계정 비활성화">
      </form>

      <h3>관리자 계정 생성 </h3>
      <form class="create-pro" action="${ pageContext.servletContext.contextPath }/manager/msregist" method="post">
      <div><h3 class="produce1"> 이름 : <div class="ui input"><input class="pd1" id="mngName" type="text" placeholder="name"></div> </h3>
      <span class="nameCheck"></span></div>
       <div><h3 class="produce2"> 닉네임 : <div class="ui input"><input class="pd2" id="mngNickName" type="text" placeholder="nickname"></div> </h3>
      <span id="nickNamecheck"></span></div>
       <div><h3 class="produce3"> 아이디 : <div class="ui input"> <input class="pd3" id="mngId" type="text" placeholder="ID"></div> </h3>
      <span id="emailcheck"></span></div>
       <div><h3 class="produce4"> 비밀번호 : <div class="ui input"><input class="pd4" id="password" type="password" placeholder="password"></div> </h3></div>
       <div><h3 class="produce5"> 비밀번호확인 : <div class="ui input"><input class="pd5" id="password2" type="password" placeholder="password"></div> </h3>
      <span id="pwdcheck"></span></div>
      <input class="create btn" id="create" type="submit" value="계정 생성">
      </form>

      <script>
      
      /* 이름 체크 */
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
      
      /* 이메일 체크 */
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
      
      /* 비밀번호 확인 체크 */
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
      
              /* 닉네임 체크 */
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
              /* 취소 버튼 누르면 창이 꺼지고, 확인 버튼을 눌러야 데이터가 넘어가도록 추후에 처리 필요 */
              $("#createModal").fadeIn();
              $("#crebtn").click(function(){
                $("#createModal").fadeOut();
                $("#resultModal").fadeIn();
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

            let checkNum = $("input:checked").length;
            console.log(checkNum);

            e.preventDefault();

            if(!checkNum) {
              $("#nullModal").fadeIn();
              $(".btn").click(function(){
                $("#nullModal").fadeOut();
              });
            } else {
              /* 취소 버튼 누르면 창이 꺼지고, 확인 버튼을 눌러야 데이터가 넘어가도록 추후에 처리 필요 */
              $("#deleteModal").fadeIn();
              $(".btn").click(function(){
                $("#deleteModal").fadeOut();
                $("#resultModal2").fadeIn();
              $(".btn").click(function(){
                window.location.reload();
              });
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
  <div class="content">
    <p class="title">이름을 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nickModal">
  <div class="content">
    <p class="title">닉네임을 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="idModal">
  <div class="content">
    <p class="title">아이디를 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="pwdModal">
  <div class="content">
    <p class="title">비밀번호를 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="createModal">
  <div class="content">
    <p class="title">관리자를 등록하시겠습니까?</p>
    <div class="re-modal-btn">
    <button class="ui button btn" id="crebtn">확인</button>
    <button class="ui button btn" id="">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal">
  <div class="content">
    <p class="title">계정 등록이 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn" onclick="location.href='${ pageContext.servletContext.contextPath }/manager/manproduce'">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nullModal">
  <div class="content">
    <p class="title">선택된 관리자가 존재하지 않습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="deleteModal">
  <div class="content">
    <p class="title">해당 관리자계정을 삭제하시겠습니까?</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
    <button class="ui button btn">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal2">
  <div class="content">
    <p class="title">계정 삭제가 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>