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

    <title>Signin Template for Bootstrap</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css"
      rel="stylesheet"
    />

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
    <style>
        .card {margin-bottom: 5%; margin-left: 2%; margin-right: 2%;}
        .card-img-top {width: 300px;}
        .card-body {text-align: center;}
        .cardgroup {
            display: flex;  /* 가로로 배치하기 */
          /*  justify-content: space-between;  */
            flex-wrap: wrap; /* 나열 된 (정렬 된) 요소들의 총 넓이가 부모 넓이 보다 클 때, 이 요소들을 다음 줄에 이어서 나열(정렬) 해주는 기능 */
            float: left; /* 왼쪽 정렬 */
        }
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/sidebar.jsp" />
      <div class="sidebar-content">
       <div class="cardgroup">
        <div class="card" style="width:300px">
            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg" alt="Card image">
            <div class="card-body">
              <h4 class="card-title">메이플</h4>
              <p class="card-text">메이플재밌어</p>
            </div>
          </div>
          <div class="card" style="width:300px">
            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg" alt="Card image">
            <div class="card-body">
              <h4 class="card-title">바람의나라</h4>
              <p class="card-text">바람의나라재밌어</p>
            </div>
          </div>
          <div class="card" style="width:300px">
            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg" alt="Card image">
            <div class="card-body">
              <h4 class="card-title">카트라이더</h4>
              <p class="card-text">카트라이더재밌어</p>
            </div>
          </div>
          <div class="card" style="width:300px">
            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg" alt="Card image">
            <div class="card-body">
              <h4 class="card-title">마비노기</h4>
              <p class="card-text">마비노기재밌어</p>
            </div>
          </div>
          <div class="card" style="width:300px">
            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg" alt="Card image">
            <div class="card-body">
              <h4 class="card-title">블레이드앤소울</h4>
              <p class="card-text">블레이드앤소울재밌어</p>
            </div>
          </div>

       </div>

      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>