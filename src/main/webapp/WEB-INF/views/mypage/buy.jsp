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

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/buy.css" rel="stylesheet"/>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    <style>
      .buytable thead tr th {background-color: #E3FFEC !important;} /* 구매내역 테이블 */
      .buytable thead tr th {border-bottom: none !important;}
      .buytable tbody tr td {text-align: center; vertical-align : middle;}
      /*.td2 {position: relative; top: 35px;}*/
      .dropsearch {margin-left: 12%;}
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">멤버쉽 구매내역</p>
        <br><br>
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
        <input class="prompt" type="search" name="searchValue" value="<c:out value=" ${
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
            멤버쉽 구매내역이 없습니다.<br>
            새로운 클래스를 구매해주세요.
          </div>
        </c:when>
        <c:when test="${ not empty buyList }">

  
<table class="ui single line table buytable">
  <thead>
    <tr>
      <th colspan="2">클래스제목</th>
      <th id="dateSortBtn">구입 날짜</th>
      <th id="paySortBtn">결제 금액</th>
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
            location.href = "${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=${ buyList[size].classCode }";
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