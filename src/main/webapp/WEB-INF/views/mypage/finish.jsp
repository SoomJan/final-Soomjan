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

    <title>수강완료 클래스</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/nav.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/finish.css" rel="stylesheet" />
  <!--  <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagemain.css" rel="stylesheet"/> -->
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 

    <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    <style>
        .reviewbtn {background-color: #91C788 !important;} /* 수강후기 작성 버튼 */
        .dropdown { position: relative;} /* 정렬 */
        .finishtable thead tr th {border-bottom: none !important;} /* 수강완료 클래스 테이블 */
        .finishtable thead tr th {background-color: #E3FFEC !important;}
        .finishtable {text-align: center !important; vertical-align: middle !important;}
        .finishbtn {position: relative; top: 30px;}
        #finish2modal {height: 150px; top: 50%; left: 47%;}
        	.input-search {
		width: 400px;
    	position: relative;
    	left: 18%;
    	top: 10px;
	}
	
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
          <select
            class="ui dropdown menu"
            id="searchCondition"
            name="searchCondition"
          >
            <option value="1">카테고리</option>
            <option value="2">클래스제목</option>
            <option value="3">강사닉네임</option>
          </select>
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="${ sessionScope.selectCriteria.searchValue }">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
    		<!-- 	<input type="button" id="searchbtn"> -->
  				</div>
 			 	<div class="results"></div>
			</div>
  </div>
  </form>
  <br><br><br><br><br>
  <div class="unlist-text">
  수강이 완료된 클래스가 없습니다.
</div>
<br>
<table class="ui single line table finishtable">
  <thead>
    <tr>
      <th>카테고리</th>
      <th>클래스제목</th>
      <th>강사닉네임</th>
      <th>수강완료</th>
      <th>수강후기</th>
    </tr>
  </thead>
  <tbody>
<!--     <tr>
      <td>2021.08.18</td>
      <td>나도 '메이플'</td>
      <td>메이플러버</td>
      <td>2021.10.18</td>
      <td><p class="complete">후기작성완료</p></td>
    </tr> -->
    <c:forEach var="finishClass" items="${ requestScope.finishList }">
    <tr>
      <td>${ finishClass.categoryDTO.categoryName }</td>
      <td>${ finishClass.classDTO.title }</td>
      <td>${ finishClass.classDTO.nickName }</td>
      <td>${ finishClass.endDate }</td>
      <td><button class="ui button reviewbtn" onclick="reviewbtn(this);">수강후기작성</button></td>
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
  <jsp:include page="../common/Paging.jsp" />
      </div>
    </div>
    <!-- 수강후기 모달창 -->
    <div class="ui small modal" id="reviewmodal">
        <div class="header modal-header">나도 만들 수 있어 '메이플'</div>
        <div class="content modal-content">
          <br>
          <table class="ui basic table modal-table">
            <thead>
              <tr>
                <th>강사</th>
                <th>수강기간</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>메이플러버</td>
                <td>2021.06.10 - 2021. 11.10(5개월)</td>
              </tr>
            </tbody>
          </table>
            <br>
            <div class="review">
          <p class="review-title">클래스는 만족하셨나요?</p>
         <div class="star"><i class="big star icon"></i> <i class="big star icon"></i> <i
          class="big star icon"></i> <i class="big star icon"></i> <i
          class="big star icon"></i></div> 
        </div>
        <br><br>
          <input type="textarea" class="review-text">
          <br><br><br>
          <button class="ui button finishbtn" onclick="finishbtn(this);">작성완료</button>
        </div>
      </div>
      <!-- 수강후기 작성완료 버튼 모달창 -->
      <div class="ui mini modal" id="finishmodal">
        <div class="content finishcontent">
          <p class="finish-content-title">수강후기를 올리시겠습니까?</p>
          <div class="re-modal-btn">
          <button class="ui button btn obtn" onclick="obtn(this);">확인</button>
          <button class="ui button btn xbtn" onclick="xbtn(this);">취소</button>
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
         function reviewbtn(item) {
          $('#reviewmodal').show();
        } 

        function finishbtn(item) {
          $('#finishmodal').show();
        }
        
         function obtn(item) {
           $("#reviewmodal").fadeOut();
           $("#finishmodal").fadeOut();
            $('#finish2modal').show();
            $("#o2btn").click(function(){
               $("#finish2modal").fadeOut();
            });
          } 
         
         function xbtn(item) {
            $("#reviewmodal").fadeOut();
            $("#finishmodal").fadeOut();
         }
         
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
  
      </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>