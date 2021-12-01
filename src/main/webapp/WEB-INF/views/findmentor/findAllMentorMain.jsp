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
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/findmentor/findmentormain.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>
  <body>

    <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
    <jsp:include page="../common/findclasssidebar.jsp" />
      
      <div class="container" style="width:75%; margin-top:150px">

  <!-- Page Heading -->
  <h1 class="my-4">멘토 보기 | 
    <small>전체 멘토</small>
  </h1>

  <div class="row">
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer1.png" alt="user"></div>
                <p>우아한형제 IOS | 김민영</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer2.png" alt="user"></div>
                <p>넥슨 & 위메프 | 허민</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer3.png" alt="user"></div>
                <p>블리자드 | 모하임</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer4.png" alt="user"></div>
                <p>페북의 변화 | 주커버그</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer5.png" alt="user"></div>
                <p>암호화폐 이더리움 | 부테린</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer6.png" alt="user"></div>
                <p>MS 개발의 | 빌</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer7.png" alt="user"></div>
                <p>라인 CTO | 박의빈</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer8.png" alt="user"></div>
                <p>진격의 카카오 | Jace</p>
            </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card">
            <div class="card-body little-profi text-center">
                <div class="intmentor-img"><img src="${ pageContext.servletContext.contextPath }/resources/images/developer9.png" alt="user"></div>
                <p>배달의 민족 | 이동욱</p>
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
