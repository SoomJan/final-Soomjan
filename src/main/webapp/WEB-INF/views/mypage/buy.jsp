<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      .dropdown { position: relative; left: 17%;} /* 정렬 */
      .search {position: relative; right: 13%;} /* 검색 */
      .buytable thead tr th {background-color: #E3FFEC !important;} /* 구매내역 테이블 */
      .buytable thead tr th {border-bottom: none !important;}
      .buytable tbody tr td {text-align: center; vertical-align : middle;}
      /*.td2 {position: relative; top: 35px;}*/
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/sidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">멤버쉽 구매내역</p>
        <br><br>
        <div class="dropsearch">
		<select class="ui dropdown">
  			<option value="">정렬순</option>
  			<option value="1">최신클래스순</option>
  			<option value="0">제목순</option>
		</select>
    <div class="ui search">
      <div class="ui icon input pro">
        <input class="prompt" type="text">
        <i class="search icon"></i>
      </div>
      <div class="results"></div>
    </div>
  </div>
  <br><br><br><br><br>
  <div class="unlist-text">
  멤버쉽 구매내역이 없습니다.<br>
  새로운 클래스를 구매해주세요.
</div>
<br><br><br>
<table class="ui single line table buytable">
  <thead>
    <tr>
      <th colspan="2">클래스제목</th>
      <th>구입날짜</th>
      <th>구입금액</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="table-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg"></td>
      <td style="text-align: left;"><div class="td2"><p class="table-title">웹개발 야! 너두 할 수 있어</p><p class="table-date">2021.09.01 - 2021.12.01(3개월)</p></div></td>
      <td>2021.08.31</td>
      <td>150,000원</td>
    </tr>
    <tr>
        <td class="table-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg"></td>
        <td style="text-align: left;"><div class="td2"><p class="table-title">웹개발 야! 너두 할 수 있어</p><p class="table-date">2021.09.01 - 2021.12.01(3개월)</p></div></td>
        <td>2021.08.31</td>
        <td>150,000원</td>
      </tr>
  </tbody>
</table>
      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>