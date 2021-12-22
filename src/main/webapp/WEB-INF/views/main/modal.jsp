<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/modal.css" rel="stylesheet" />
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
   $(document).ready(function(){
	   $("#checkModal").fadeIn();
       $(".btn").click(function(){
         $("#checkModal").fadeOut();
       });

       $("#ray").fadeIn();
       $(".btn1").click(function(){
         $("#ray").fadeOut();
       });
       
	   $(".modal-today-close").click(function() {
			$("#ray").fadeOut();
			setCookie("mycookie", 'popupEnd', 1);
			console.log(document.cookie);
		});
	   
	   
	   var checkCookie = getCookie("mycookie");
		
		   if(checkCookie == 'popupEnd') {
		   		/* $("#ray").hide(); */
			} else {
				$("#ray").fadeIn();
			}
	   $(".modal-today-close1").click(function() {
			$("#checkModal").fadeOut();
			setCookie("mycookie", 'popupEnd1', 1);
		})
		
			if(checkCookie == 'popupEnd1') {
			   		$("#checkModal").hide();
				} else {
					$("#checkModal").fadeIn();
				}
		});
   
   
   
   
   function setCookie(name, value, expiredays){
		var today = new Date();

		console.log(today.getDate())

		today.setDate(today.getDate() + expiredays); // 현재시간에 하루를 더함 

		document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();

		console.log(today);
	}
		
	function getCookie(name) {

		var cookie = document.cookie;
		
		if (document.cookie != "") {
			var cookie_array = cookie.split("; ");
			console.log(cookie_array)
			for ( var index in cookie_array) {
				var cookie_name = cookie_array[index].split("=");
				if (cookie_name[0] == "mycookie") {
					return cookie_name[1];
				}
			}
		}
		return;
	}
  
   </script>
</head>
<body>

<div class="modal" id="checkModal">
  <div class="content">
      <div class="modal-content">
        <img src="${ pageContext.servletContext.contextPath }/resources/images/sprout.png">
      </div>
      <div class="text">
        <h4>멘토가 될 수 있는 절호의 기회</h4>
        <h4>야! 너두 잔디 될 수 있어!</h4>
         <button class="modal-today-close1"> 오늘 하루 동안 보지 않기</button>
    </div>
    <div class="modal-button">
        <c:if test="${ empty sessionScope.loginMember.email && empty sessionScope.loginManager.mngNickName}">
    <button class="btn" onclick="location.href='${ pageContext.servletContext.contextPath }/member/terms'">회원가입</button>
       </c:if>
       <c:if test="${ !empty sessionScope.loginMember.email}">
        <button class="btn" onclick="location.href='${ pageContext.servletContext.contextPath }/member/joinJandi'">잔디하기</button>
      </c:if>
  
      <button class="btn">아니 난 못해..</button>
  </div>
  </div>
</div>

<div class="modal" id="ray">
  <div class="content">
      <div class="modal-content">
        <img src="${ pageContext.servletContext.contextPath }/resources/images/ray2.jpeg">
      </div>
      <div class="text">
    </div>
    <div class="modal-button">
    <button class="btn1">ㅎㅎ</button>
     <button class="modal-today-close"> 오늘 하루 동안 보지 않기</button>
  </div>
  </div>
</div>

</body>
</html>