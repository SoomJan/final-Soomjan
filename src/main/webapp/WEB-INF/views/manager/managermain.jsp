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
    <style>
      .warningtable tbody {
        text-align: center;
      }

      .warningtable thead {
        background-color: #e3ffec;
        text-align: center;
      }

      .introduce-detail img {
        width: 60%;
        height: 60%;
        text-align: center;
      }

      p {
        font-weight: bold;
        font-size: 20px;
      }
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>신고된 멘티 조회</h1>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>회원 아이디</th>
              <th>이름</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#">gsp@gmail.com </a></td>
              <td>권순표</td>
            </tr>
            <tr>
              <td><a href="#">yhj@gmail.com </a></td>
              <td>양효진</td>
            </tr>
            <tr>
              <td><a href="#">osb@gmail.com </a></td>
              <td>오수빈</td>
            </tr>
            <tr>
              <td><a href="#">ysm@gmail.com </a></td>
              <td>유선미</td>
            </tr>
            <tr>
              <td><a href="#">lsh@gmail.com </a></td>
              <td>이선호</td>
            </tr>
            <tr>
              <td><a href="#">ljh@gmail.com </a></td>
              <td>이지환</td>
            </tr>
            <tr>
              <td><a href="#">iyr@gmail.com </a></td>
              <td>임예람</td>
            </tr>
          </tbody>
        </table>
        <div>
          <div class="manager-search">
            <form class="manager-searchbox" method="post">
              <input type="text" />
              <button type="submit">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/redgrass.png"
                />
              </button>
            </form>
          </div>
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
