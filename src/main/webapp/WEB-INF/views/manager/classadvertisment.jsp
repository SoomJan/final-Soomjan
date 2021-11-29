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
    <!-- <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    /> -->
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="resources/css/semantic/semantic.css"
    />
    <script src="resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script type="text/javascript" src="css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>현재 광고중인 클래스</h1>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>클래스 이름</th>
              <th>멘토</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#">자바 기반 앱개발 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">코딩알못에서 웹서비스 런칭까지</a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">렛츠고 장고! 웹 개발 첫걸음 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">20시간만에 웹퍼블리셔되기</a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">워드 프레스 칙칙폭폭 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">디자이너를 위한 웹코딩개발 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">디자인? 디자인! </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
          </tbody>
        </table>
        <div class="manager-search">
          <form class="manager-searchbox" method="post">
            <input type="text" />
            <button type="submit">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/research.png"
              />
            </button>
          </form>
        </div>
        <div>
          <div class="manager-paging">
            <ul>
              <li><a href="#">Prev</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">next</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
