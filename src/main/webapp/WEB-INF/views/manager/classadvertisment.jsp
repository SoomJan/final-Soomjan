<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>

    <title>현재 광고중인 클래스</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />

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
