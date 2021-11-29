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

    <title>등록된 멘티 조회</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css"
    rel="stylesheet"
    />

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="resources/css/semantic/semantic.css">
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
      background-color: #E3FFEC;
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
      <div class="main-content">
      <h1 id="category"> 등록된 멘티 조회 </h1> <br>
    
          <table class="ui basic table warningtable">
            <thead>
              <tr>
                <th>가입 날짜</th>
                <th>이메일</th>
                <th>닉네임</th>
                <th>멘토 여부</th>
                <th>경고 횟수</th>
                <th>블랙 리스트</th>
              </tr>
            </thead>
            <tbody>
              <tr class="move">
                <td>gsp@gmail.com </td>
                <td>권잔디</td>
                <td>2021-11-24</td>
                <td>N</td>
                <td>0</td>
                <td>N</td>
              </tr>
              <tr class="move">
                <td>yhj@gmail.com </td>
                <td>양잔디</td>
                <td>2021-11-24</td>
                <td>N</td>
                <td>0</td>
                <td>N</td>
              </tr>
              <tr class="move">
                <td>osb@gmail.com </td>
                <td>오잔디</td>
                <td>2021-11-24</td>
                <td>Y</td>
                <td>2</td>
                <td>N</td>
              </tr>
              <tr class="move">
                <td>ysm@gmail.com </td>
                <td>유잔디</td>
                <td>2021-11-24</td>
                <td>N</td>
                <td>1</td>
                <td>N</td>
              </tr>
              <tr class="move">
                <td>lsh@gmail.com </td>
                <td>이잔디</td>
                <td>2021-11-24</td>
                <td>Y</td>
                <td>0</td>
                <td>N</td>
              </tr>
              <tr class="move">
                <td>ljh@gmail.com </td>
                <td>환잔디</td>
                <td>2021-11-24</td>
                <td>N</td>
                <td>0</td>
                <td>N</td>
              </tr>
              <tr class="move">
                <td>iyr@gmail.com </td>
                <td>임잔디</td>
                <td>2021-11-24</td>
                <td>N</td>
                <td>2</td>
                <td>N</td>
              </tr>
            </tbody>
          </table>

          <script>
         
            $(function(){
              $(".move").hover(function(){
                $(this).css('background', 'gray');
              }, function(){
                $(this).css('background', 'white');
              });
            });
  
            $(function(){
              $(".move").click(function(){
                location.href="${ pageContext.servletContext.contextPath }/test.jsp";
              });
            });
  
            </script>   

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
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>