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
        <h1>신고된 멘토 내역 조회</h1>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>신고된 멘토</th>
              <th>내용</th>
              <th>신고 사유</th>
              <th>신고 처리 여부</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#">gsp@gmail.com </a></td>
              <td><a href="#">내가 발로 코드 짜는게 더 빠를듯 ㅋ</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">yhj@gmail.com </a></td>
              <td><a href="#">코드 누가 그렇게 짜라고 알려 줬어요?</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">osb@gmail.com </a></td>
              <td><a href="#">참 잘했어요~ ㅎㅎ</a></td>
              <td>욕설</td>
              <td>L</td>
            </tr>
            <tr>
              <td><a href="#">ysm@gmail.com </a></td>
              <td><a href="#">맘대로 짤거면 수업 왜 들어요?</a></td>
              <td>욕설</td>
              <td>N</td>
            </tr>
            <tr>
              <td><a href="#">lsh@gmail.com </a></td>
              <td><a href="#">기본이 안되어 있으시네요</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">ljh@gmail.com </a></td>
              <td><a href="#">새싹 밟아드릴까요?</a></td>
              <td>욕설</td>
              <td>N</td>
            </tr>
            <tr>
              <td><a href="#">iyr@gmail.com </a></td>
              <td><a href="#">그냥 돈만 내고 수업은 들지 말고 가세요</a></td>
              <td>욕설</td>
              <td>Y</td>
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
