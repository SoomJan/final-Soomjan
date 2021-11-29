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

    <title>수강후기</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/review.css" rel="stylesheet"/>

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
        .re-title {float: left;} /*후기 클래스 명 */
        #ti-date { background-color: #91C788; color: white; border-radius: 5px; height: 40px;} /*후기 클래스 수강기간*/
        .reviewList p {float: left; margin-left: 2%; width: 650px !important;} /* 후기 내용 */
        #reviewheader { color: #FDD442; margin-bottom: 2%} /* 후기 별점 */
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/sidebar.jsp" />
      <div class="sidebar-content">
        <p class="taking-title">수강후기</p>
        <br><br>
         <div class="unlist-text">
            아직 수강후기가 없습니다.<br>
            클래스 후기를 작성해보세요.
            <br><br><br>
            <a href="#" class="review-go"><u>수강후기 작성하러가기</u></a>
        </div>
        <br><br><br>
        <div class="ui card" id="reviewcard">
            <div class="content">
              <div class="left aligned header" id="reviewheader">
                <i class="star icon"></i>
                <i class="star icon"></i>
                <i class="star icon"></i>
                <i class="star icon"></i>
                <i class="star icon"></i>
              </div>
              <div class="left aligned description reviewList">
                <p>제가 메이플을 너무너무 좋아해서 메이플과 비슷한 게임을 만들어보고 싶었는데 이렇게 마침 강의가 나와서 정말 신나게 잘 들을 수 있었습니다! 강사님께서 명강의를 해주신 덕분에 게임만드는 것을 도전해볼 수 있을 것 같아요! 너무너무 감사합니다.  </p>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg">
              </div>
            </div>
            <div class="extra content" id="ti-date">
              <div class="right aligned author"><p class="re-title">클래스명: 메이플 한번 배워볼까?</p><p class="re-date">수강기간: 2021.09.01 - 2021.11.01(2개월)</p></div>
            </div>
          </div>
          <div class="ui card" id="reviewcard">
            <div class="content">
              <div class="left aligned header" id="reviewheader">
                <i class="star icon"></i>
                <i class="star icon"></i>
                <i class="star icon"></i>
                <i class="star icon"></i>
                <i class="star icon"></i>
              </div>
              <div class="left aligned description reviewList">
                <p>메이플을 먼저 배우고나서 바람의나라를 배우고싶었습니다. 명강사님이라 그런지 역시 강의도 탁월하게 잘하시네요! 넥슨은 다람쥐를 뿌려라! 옛날에 하던 바람의 나라 생각이 많이 났습니다.. ㅎㅎ </p>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/maple.jpg">
              </div>
            </div>
            <div class="extra content" id="ti-date">
              <div class="right aligned author"><p class="re-title">클래스명: 바람의나라? </p><p class="re-date">수강기간: 2021.10.11 - 2022.01.11(3개월)</p></div>
            </div>
          </div>
      </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>