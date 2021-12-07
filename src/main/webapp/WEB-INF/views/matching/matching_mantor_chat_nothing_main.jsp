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
      href="${ pageContext.servletContext.contextPath }/resources/css/matching/matching_mantee.css"
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
    
  
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
    <jsp:include page="../common/matching_mantee_sidebar.jsp" />
        <div class="introduce">
          
          <div class="matching-content">
          	<p class="estimate_title">채팅 리스트</p>
          	<div class="nothing-comment">
            	<p>앗, 요청한 매칭이 없어요!</p>
            	<p> 😅 견적서를 선택하고 채팅을 시작하여 새싹을 만나보세요!</p>
          	<div class="write">
            <button class="writeBtn">견적서 보기</button>
            </div>
          	</div>
          </div>
          
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
