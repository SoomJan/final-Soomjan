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

    <title>멤버쉽 구매내역</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/buy.css" rel="stylesheet"/>

    <style>
      .buytable thead tr th {background-color: #E3FFEC !important;} /* 구매내역 테이블 */
      .buytable thead tr th {border-bottom: none !important;}
      .buytable tbody tr td {text-align: center; vertical-align : middle;}
      .dropsearch {margin-left: 14%;}
      .finish-go {color: #52734D !important;}
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">멤버쉽 구매내역</p>
        <br>
        <div class="dropsearch">
          <form id="form" action="${ pageContext.servletContext.contextPath }/mypage/buy" method="get">
            <input type="hidden" name="currentPage" value="1" />
            <input type="hidden" id="sort" name="sort" value="${ sort }" />
		<select class="ui dropdown" id="searchCondition" name="searchCondition">
  			<option value="1">클래스 명</option>
        <option value="2">잔디 닉네임</option>
		</select>
    <div class="ui search">
      <div class="ui icon input pro">
        <input class="prompt" type="search" name="searchValue" value="<c:out value="${
          sessionScope.selectCriteria.searchValue }" />">
          <button id="searchbtn" style="border: none; background:none; position: relative; right: 18%;"><img
            src="${ pageContext.servletContext.contextPath }/resources/images/search.png"
            style="width:25px;"></button>
      </div>
      <div class="results"></div>
    </div>
  </div>
</form>
  <br><br><br><br><br>

  <c:choose>
        <c:when test="${ empty buyList }">
          <div class="unlist-text">
            멤버쉽 구매내역이 없거나, 조회된 결과가 없습니다.
            <br><br><br>
  <a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" class="finish-go"><u>클래스 구매하러가기</u></a>
          </div>
        </c:when>
        <c:when test="${ not empty buyList }">

  
<table class="ui single line table buytable">
  <thead>
    <tr>
      <th colspan="2">클래스제목</th>
      <th id="dateSortBtn">구입 날짜 <span id="dateIcon"><i class="sort icon"></i></span></th>
      <th id="paySortBtn">결제 금액 <span id="payIcon"><i class="sort icon"></i></span></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="size" begin="0" end="${ fn:length(buyList)-1 }">
    <tr class="classInfo${ size + 1}">
      <td class="table-img"><img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ buyList[size].filePath }"></td>
      <td style="text-align: left;"><div class="td2"><p class="table-title">${ buyList[size].title }</p><p class="table-date">${ buyList[size].nickName }</p></div></td>
      <td>${ buyList[size].payDate }</td>
      <td>${ buyList[size].pay } 원</td>
    </tr>

    <script>
      $(function() {

        /* 마우스 커서 이벤트 */
        $(".classInfo${ size + 1 }").hover(
          function () {
            $(this).css("color", "green").css("cursor", "pointer");
          },
          function () {
            $(this).css("color", "black").css("cursor", "default");
          }
        );

        /* 클릭시 클래스 정보로 이동 */
          $(".classInfo${ size + 1 }").click(function () {

            let isDeleted = "${ buyList[size].isDeleted }";

            if(isDeleted == "N") {
              location.href = "${ pageContext.servletContext.contextPath }/findclass/class/classRoom?classCode=${ buyList[size].classCode }";
            } else {
            $("#notmodal").fadeIn();
            $(".btn").click(function() {
              $("#notmodal").fadeOut();
            });
            }
          });
      });

    </script>

    </c:forEach>

    <script>

      $(function(){

        /* 구입날짜 커서 이벤트 */
        $("#dateSortBtn").hover(
          function () {
            $(this).css("color", "blue").css("cursor", "pointer");
          },
          function () {
            $(this).css("color", "black").css("cursor", "default");
          }
        );

        /* 결제 금액 커서 이벤트 */
        $("#paySortBtn").hover(
          function () {
            $(this).css("color", "blue").css("cursor", "pointer");
          },
          function () {
            $(this).css("color", "black").css("cursor", "default");
          }
        );

        /* <i class="sort amount down icon"></i>
        <i class="sort amount up icon"></i> */
        /* 구입날짜 정렬 */
        $("#dateSortBtn").click(function() {
	
          let sort = $("#sort").val();

        if(!sort || sort == "P" || sort == "PA" || sort == "DA") {
          $("#sort").val("D");
        } else if(sort == "D") {
          $("#sort").val("DA");
        }

        $("#form").submit();
        });

        /* 금액 정렬 */
        $("#paySortBtn").click(function() {

          let sort = $("#sort").val();

          if(!sort || sort == "D" || sort == "PA" || sort == "DA") {
            $("#sort").val("P");
          } else if (sort == "P") {
            $("#sort").val("PA");
          }

        $("#form").submit();
        });

        /* 검색 조건 유지 */
       $("#searchCondition").val("${ selectCriteria.searchCondition }");
      });

    </script>
  </tbody>
</table>
<jsp:include page="../common/Paging.jsp" />
</c:when>
</c:choose>
      </div>
    </div>

</body>
<jsp:include page="../common/footer.jsp" />
</html>

 <!-- 클래스 종료 안내 모달창 -->
 <div class="ui mini modal" id="notmodal">
  <div class="content deletecontent">
    <p class="delete-content-title">삭제된 클래스입니다.</p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>