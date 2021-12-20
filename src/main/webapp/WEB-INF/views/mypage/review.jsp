<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>수강후기</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/review.css?" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    <style>
        #ti-date { background-color: #91C788; color: black; border-radius: 5px; height: 40px;} /*후기 클래스 수강기간*/
        .reviewList p {float: left; margin-left: 2%; width: 650px !important;} /* 후기 내용 */
        #reviewheader { color: #FDD442; margin-bottom: 2%} /* 후기 별점 */
        .re-title {float: left;} /*후기 클래스 명 */
        .card-content {float: left; width: 630px;}
        .delete-go {
        	color: black !important;
        	text-decoration-line: none;
        }
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">수강후기</p>
        <br><br>
       
       <c:choose>
         <c:when test="${ empty reviewList }"> 
         <div class="unlist-text">
            아직 수강후기가 없습니다.<br>
            클래스 후기를 작성해보세요.
            <br><br><br>
            <a href="${ pageContext.servletContext.contextPath }/mypage/finish" class="review-go"><u>수강후기 작성하러가기</u></a>
        </div>
        </c:when>
		<c:when test="${ !empty reviewList }"> 
		
         <c:forEach var="reviewClass" items="${ requestScope.reviewList }">
         <br>
         <form action="${pageContext.servletContext.contextPath }/mypage/deleteReview" method="post">
         <a href="#" class="delete-go" style="float: right; margin-right: 8%; font-weight: 700;" onclick="deleteReview(this);">삭제</a>
         <input type="hidden" name="rvCode" value="${ reviewClass.REVIEW_CODE }">
         </form>
         <br>
        <div class="ui card" id="reviewcard">
            <div class="content">
              <div class="left aligned header" id="reviewheader">
             <div style="float: left; color: red;">
 			   <c:forEach begin="1" end="${ reviewClass.STAR }">
			   		<i class="star icon"></i>
			   </c:forEach>
			 </div>
			 <c:set var="writeDate" value="${ reviewClass.WRITE_DATE }"/>
			   <div class="re-date" style="float: right; color: black !important; font-size: 15px;"> ${ fn:substring(writeDate, 0, 10) }</div>
              </div>
              <div class="left aligned description reviewList">
                <div class="card-content">${ reviewClass.CONTENTS }</div>
                <div><img src="${ pageContext.servletContext.contextPath }/resources/images/${ reviewClass.ORG_FILE_PATH }"></div>
              </div>
            </div>
            <div class="extra content" id="ti-date">
              <div class="right aligned author"><p class="re-title">클래스명: ${ reviewClass.TITLE }</p><p class="re-nickName">강사닉네임 : ${ reviewClass.NICKNAME }</p></div>
            </div>
          </div>
          </c:forEach>
          <br>
            <jsp:include page="../common/Paging.jsp" />
		</c:when>
		</c:choose>
      </div>
    </div>
    
    <script>
/*     	$(function(){
    		$('.delete-go').click(function(e){
    			$('#deleteModal').fadeIn();
    			e.preventDefault();
    		});
    	});
    	
    	function deleteReview(item) {
    		console.log($(item).next());
    		$(item).parent().submit();	
    	}
    	
    	$(function(){
    		$('#xbtn').click(function(e){
    			$('#deleteModal').fadeOut();
    			e.preventDefault();
    		});
    	}); */
    	
    	function deleteReview(item){
    		console.log($(item).next());
    		
    		if(confirm("선택한 후기를 삭제하시겠습니까?")){
    			$(item).parent().submit();
    		}
    	}
    	
    </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>

<%-- <div class="ui mini modal" id="deleteModal">
  <div class="contents">
  <br><br>
    <p class="titles">선택한 후기를 삭제하시겠습니까?</p>
    <div class="re-modal-btn">
    <c:out value="${ reviewClass.REVIEW_CODE }"/>
    <form action="${pageContext.servletContext.contextPath }/mypage/deleteReview" method="post">
      <button id="okbtn" class="ui button btn" onclick="deleteReview(this);">확인</button>
      <input type="hidden" name="rvCode" value="${ reviewClass.REVIEW_CODE }">
    </form>
      <button id="xbtn" class="ui button btn">취소</button>
    </div>
  </div>
</div> --%>