<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <title>find class</title>

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

    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findclass/findclassmain.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>

  </head>
  <body>

    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
    <jsp:include page="../common/findclasssidebar.jsp" />
      
      <div class="container" style="width:75%; margin-top:150px">

  <!-- Page Heading -->
  <h1 class="my-4">인기 클래스 | 
    <small>웹 개발</small>
  </h1>

	<div> <p style="font-size: 55px; color: green; text-align: center; margin-bottom: 50px;">OH! 잔디의 JAVA클래스 </p></div>

  <div class="row">
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class9.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor1.png" alt="user"></div>
                <h5 class="m-b-0">제주코딩베이스캠프</h5>
                <p>코딩알못에서웹서비스런칭까지</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩69,000 / 12개월</h3><small>★★★★☆(2) | 강남</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>

      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class2.png" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor2.png" alt="user"></div>
                <h5 class="m-b-0">박순열</h5>
                <p>렛츠고!웹개발 첫걸음</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩99,000 / 12개월</h3><small>★★★★☆(4) | 온라인Live</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class3.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor3.png" alt="user"></div>
                <h5 class="m-b-0">김영준</h5>
                <p>워드프레스+쇼핑몰 속성마스터</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩44,000 / 12개월</h3><small>★★★☆☆(1) | 강서</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class4.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor4.png" alt="user"></div>
                <h5 class="m-b-0">김병욱</h5>
                <p>쌀팔다6개월만에 개발자된비법</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩10,000 / 1시간</h3><small>★★★★★(121) | 강남</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class1.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor5.png" alt="user"></div>
                <h5 class="m-b-0">김태완</h5>
                <p>20시간만에 웹퍼블리셔되기</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩22,000 / 1시간</h3><small>★★★★☆(3) | 사당</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class6.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor6.png" alt="user"></div>
                <h5 class="m-b-0">엄태성</h5>
                <p>디자이너를위한 웹코딩개발</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩44,000 / 1시간</h3><small>★★★☆☆(2) | 강남</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class7.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor7.png" alt="user"></div>
                <h5 class="m-b-0">파워러닝</h5>
                <p>워드프레스 4시간 속성마스터</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩44,000 / 1시간</h3><small>★★★★★(1) | 녹화영상</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class8.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor8.png" alt="user"></div>
                <h5 class="m-b-0">솔솔</h5>
                <p>워드프레스로 홈페이지제작</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩70,000 / 1시간</h3><small>★★★★★(32) | 온라인Live</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
         <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/class1.PNG" alt="Card image cap">
            <div class="card-body little-profile text-center">
                <div class="pro-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/tutor9.png" alt="user"></div>
                <h5 class="m-b-0">배가영</h5>
                <p>2시간씩투자해서 웹페이지제작</p> <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" style="margin-bottom:16px;" data-abc="true">자세히보기</a>
                <div class="row text-center m-t-20">
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                    <div class="col-lg-10 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light">₩27,000 / 1시간</h3><small>NEW | 강남</small>
                    </div>
                    <div class="col-lg-1 col-md-4 m-t-20">
                        <h3 class="m-b-0 font-light"> </h3><small> </small>
                    </div>
                </div>
            </div>
      </div>
    </div>
  </div>
  <!-- /.row -->

  <!-- Pagination -->
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>

</div>
    </div>
	
<!-- /.container -->

  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
