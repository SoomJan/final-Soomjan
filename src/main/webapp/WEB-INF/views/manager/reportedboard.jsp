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

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    /> -->
    <link href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css" rel="stylesheet"/>
        <link href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"/>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script type="text/javascript" src="css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    
  	<style>
  	.manager-paging ul li a {color: white !important;}
    
    .manager-paging {
  		width: 40%;
 		margin: 0 auto;
 		height: 50px;
 		text-align: center;
  		position: relative;
 		top: 20px;
 		 /* border: 1px solid blue; */
	}

	.input-search {
		width: 400px;
    	position: relative;
    	left: 18%;
    	top: 10px;
	}
  	</style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
        <h1 id="category">신고된 게시판 조회</h1><br>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>신고된 멘티</th>
              <th>내용</th>
              <th>신고 사유</th>
              <th>신고 처리 여부</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#">gsp@gmail.com </a></td>
              <td><a href="#">잔디가 아니라 잡초였네?</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">yhj@gmail.com </a></td>
              <td><a href="#">이따구로 하실거면 환불해주세요</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">osb@gmail.com </a></td>
              <td><a href="#">수업 해보신적은 있으세요?</a></td>
              <td>욕설</td>
              <td>L</td>
            </tr>
            <tr>
              <td><a href="#">ysm@gmail.com </a></td>
              <td><a href="#">숙제 내놓고 왜 검사안해주는데</a></td>
              <td>욕설</td>
              <td>N</td>
            </tr>
            <tr>
              <td><a href="#">lsh@gmail.com </a></td>
              <td><a href="#">진짜 열심히 듣고있습니다!! 감사해요 ㅎㅎ</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">ljh@gmail.com </a></td>
              <td><a href="#">너 어디사냐?</a></td>
              <td>욕설</td>
              <td>Y</td>
            </tr>
            <tr>
              <td><a href="#">iyr@gmail.com </a></td>
              <td><a href="#">그냥 제가 수업할테니 저한테 돈주세요</a></td>
              <td>욕설</td>
              <td>N</td>
            </tr>
          </tbody>
        </table>
           <div class="manager-search">
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="text">
    			<i class="search icon"></i>
  				</div>
 			 	<div class="results"></div>
			</div>
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
