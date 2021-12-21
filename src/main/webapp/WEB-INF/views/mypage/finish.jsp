<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <title>수강완료 클래스</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css?" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/finish.css?" rel="stylesheet" />

    <style>
        .reviewbtn {background-color: #91C788 !important;} /* 수강후기 작성 버튼 */
        .dropdown { position: relative;} /* 정렬 */
        .finishtable thead tr th {border-bottom: none !important;} /* 수강완료 클래스 테이블 */
        .finishtable thead tr th {background-color: #E3FFEC !important;}
        .finishtable {text-align: center !important; vertical-align: middle !important;}
        #finish2modal {height: 150px; top: 50%; left: 47%;}
        #searchbtn > img {position: relative; right: 70%;}
        .dropsearch {margin-left: 14%;}
        .finish-go {color: #52734D !important;}
    </style>
</head>
<body>
    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">수강완료 클래스</p>
        <br>
       <form
            action="${ pageContext.servletContext.contextPath }/mypage/finish"
            method="get" id="searchform">
        <div class="dropsearch">
          <input type="hidden" name="currentPage" value="1" />
          <select class="ui dropdown menu" id="searchCondition" name="searchCondition">
            <option value="" selected>선택</option>
            <option value="1">카테고리</option>
            <option value="2">클래스제목</option>
            <option value="3">강사닉네임</option>
          </select>
            <div class="ui search jandi-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="${ selectCriteria.searchValue }">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
    		<!-- 	<input type="button" id="searchbtn"> -->
  				</div>
 			 	<div class="results"></div>
			</div>
  		</div>
 	 </form>
 	 <script>
 	 	$(function(){
 	 		$('#searchCondition').val("${ selectCriteria.searchCondition }");
 	 		console.log("${ selectCriteria.searchCondition }");
 	 	});
 	 </script>
  <br><br><br>
 <c:if test="${ empty finishList[0].status }">
  <div class="unlist-text">
 	 수강이 완료된 클래스가 없거나, 조회된 결과가 없습니다.
  <br><br><br>
  <a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" class="finish-go"><u>클래스 신청하러가기</u></a>
</div>
</c:if>
<c:if test="${ !empty finishList[0].status }">
<table class="ui single line table finishtable">
  <thead>
    <tr>
      <th>카테고리</th>
      <th>클래스제목</th>
      <th>강사닉네임</th>
      <th>수강완료</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th>수강후기</th>
    </tr>
  </thead>
  <tbody>

    <c:forEach var="finishClass" items="${ requestScope.finishList }">
    <tr>
      <td>${ finishClass.categoryDTO.categoryName }</td>
      <td>${ finishClass.classDTO.title }</td>
      <td>${ finishClass.classDTO.nickName }</td>
      <td>${ finishClass.endDate }</td>
      <td><input type="hidden" name="payDate" id="payDate" value="${ finishClass.paymentDTO.payDate }"></td>
      <td><input type="hidden" value="${ finishClass.reviewDTO.isDelete }"></td>
      <td><input type="hidden" value="${ finishClass.classCode }"></td>
            <td><input type="hidden" value="${ finishClass.classPurcCode }"></td>
      <c:if test="${ finishClass.reviewDTO.rvCode eq 0 || finishClass.reviewDTO.isDelete eq NULL }">
      <td><button class="ui button reviewbtn" id="reviewbtn">수강후기작성</button></td>
      </c:if>
      <c:if test="${ finishClass.reviewDTO.rvCode ne 0 || finishClass.reviewDTO.isDelete eq 'N' }">
      <td style="color: #52734D; font-weight: 700;">후기작성완료</td>
      </c:if>
    </tr>
    </c:forEach>
<!--     <tr>
      <td>2021.07.19</td>
      <td>웹디자인 잘 가르칠 수 있는디</td>
      <td>천재디자인</td>
      <td>2021.11.19</td>
      <td><button class="ui button reviewbtn" onclick="reviewbtn(this);">수강후기작성</button></td>
    </tr> -->
  </tbody>
</table>
<br>
  <jsp:include page="../common/Paging.jsp" />
</c:if>
      </div>
    </div>
    <!-- 수강후기 모달창 -->
   <form action="${ pageContext.servletContext.contextPath }/mypage/finishReview" method="post" id="reviewform">
    <div class="ui small modal" id="reviewmodal">
        <div class="header modal-header"><input type="text" class="t-title" style="border:none; text-align:center;"></div>
        <div class="content modal-content">
          <br>
          <table class="ui basic table modal-table">
            <thead>
              <tr>
              	<th>카테고리</th>
                <th>강사</th>
                <th>수강기간</th>
                
              </tr>
            </thead>
            <tbody>
              <tr>
              	<td><input type="text" class="t-categoryName" name="t-categoryName" style="border:none; text-align:center;"></td>
                <td><input type="text" class="t-nickName" name="t-nickName" style="border:none; text-align:center;"></td>
                <td><input type="text" class="t-date" name="t-date" style="border:none; text-align:center;"></td>
                <input type="hidden" name="classCode" id="classCode" value="${ finishClass.classCode }">
                <input type="hidden" name="classPurcCode" id="classPurcCode" value="${ finishClass.classPurcCode }">
              </tr>
            </tbody>
          </table>
            <br>
            <div class="review">
          <p class="review-title">클래스는 만족하셨나요?</p>
            <p id="star">
			   <a href="#" class="on" id="1">★</a>
			   <a href="#" class="on" id="2">★</a>
			   <a href="#" class="on" id="3">★</a>
			   <a href="#" id="4">★</a>
			   <a href="#" id="5">★</a>
			   <input type="hidden" id="reviewStar" name="reviewStar" value="3">
 			 <p>
 			 <!--  1. 클래스가 on이 붙어있는 요소의 갯수 찾기  -->
 			 
 			 <!-- 2. 갯수를  hidden 담기 -> script로 작성  -->
 			 
 			 <!-- 3. 작성된값 체크  -->
        </div>
        <br><br>
          <textarea name="contents" class="review-text"></textarea>
          <br><br><br>
          <button class="ui button finishbtn">작성완료</button>
          <button class="ui button exitbtn" style="width:100px;">취소</button>
        </div>
      </div>
      </form>
      <!-- 수강후기 작성완료 버튼 모달창 -->
      <div class="ui mini modal" id="finishmodal">
        <div class="content finishcontent">
          <p class="finish-content-title">수강후기를 올리시겠습니까?</p>
          <div class="re-modal-btn">
          <button class="ui button btn obtn" id="obtn" >확인</button>
          <button class="ui button btn xbtn">취소</button>
        </div>
        </div>
      </div>
      <!-- 수강후기 완료 -->
      <div class="ui mini modal" id="finish2modal">
        <div class="content finishcontent">
          <p class="finish-content-title">수강후기가 작성되었습니다.</p>
          <div class="re-modal-btn">
          <button class="ui button btn" id="o2btn">확인</button>
        </div>
        </div>
      </div>
      <script>
  		$(".reviewbtn").on('click', function(e){
  			let $reviewbtn = e.target;
  			let $tr = $($reviewbtn).parent().parent();
  			console.log($tr);
  			console.log($($tr).children().eq(0).html());
  			console.log($($tr).children().eq(4).children().eq(0).val());
  			console.log("classCode : " + $($tr).children().eq(6).children().eq(0).val());
   			$('.t-categoryName').val($($tr).children().eq(0).html()); 
    		$('.t-title').val($($tr).children().eq(1).html());
  			$('.t-nickName').val($($tr).children().eq(2).html());
  			$('#classCode').val($($tr).children().eq(6).children().eq(0).val());
  			$('#classPurcCode').val($($tr).children().eq(7).children().eq(0).val());
  			$('.t-date').val($($tr).children().eq(4).children().eq(0).val() + "-" + $($tr).children().eq(3).html());  
  			$('#reviewmodal').fadeIn();
  			e.preventDefault();
  		});
        
        $(".finishbtn").on('click', function(e) {
        	$('#finishmodal').fadeIn();
        	e.preventDefault();
        });
        
        $(".exitbtn").click(function(e){
        	$('#reviewmodal').fadeOut();
        	e.preventDefault();
        });
        
/*     	function obtn(item) {
           $("#reviewmodal").fadeOut();
           $("#finishmodal").fadeOut();
            $('#finish2modal').show();
            $("#o2btn").click(function(){
               $("#finish2modal").fadeOut();
            });
          }  */
          
        $("#obtn").on('click', function(e){
        	$("#reviewmodal").fadeOut();
        	$("#finishmodal").fadeOut();
        	$("#finish2modal").fadeIn();
        	/* $("#reviewform").submit(); */
        	e.preventDefault();
        });
          
          $("#o2btn").click(function(e){
              $("#finish2modal").fadeOut();
              $("#reviewform").submit();
              e.preventDefault();
          });
          
          $(".xbtn").on('click', function(e){
        	 $("#reviewmodal").fadeOut();
        	 $("#finishmodal").fadeOut();
        	 e.preventDefault();
          });
         
/*          function xbtn(item) {
            $("#reviewmodal").fadeOut();
            $("#finishmodal").fadeOut();
         } */
         
/*          $('.o2btn').on('click',function(){
        
            $('#finish2modal').modal('hide');
         }; */
          
    /*   function xbtn(item) {
          window.location.reload();
        }  */
        
/*     $(function(){
        $('#o2btn').click(function(){
        ('#finish2modal').hide();
     });
   }); */
   
/* 	   $('#star a').click(function(){ 
			 $(this).parent().children("a").removeClass("on");    
			 $(this).addClass("on").prevAll("a").addClass("on");
			 console.log($(this).attr("value"));
		 }); */
		 
	$( document ).ready(function() {
		$( "#star a" ).click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
				var starRate = $(this).attr('id');
				console.log(starRate);
			$("#reviewStar").val(starRate);
				return false;
		});
	}); 
  
      </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>