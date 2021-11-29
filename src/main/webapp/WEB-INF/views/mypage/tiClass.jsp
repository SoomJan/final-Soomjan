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

    <title>멘티 클래스룸</title>

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

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/css/bootstrap.js"></script>
    <script type="text/javascript" src="resources/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
    <style>
      .item-title {width: 250px; text-align: center; border: none !important;}
      .content {border: none !important;}
      .hr1 {border: 2px solid #91C788; background-color: #91C788;}
    </style>
</head>
<body>
	 <jsp:include page="../common/nav.jsp" />
    <div class="common-sidebar">
      <jsp:include page="../common/sidebar.jsp" />
      <div class="sidebar-content">
        <p class="title">OH! 잔디의 JAVA 클래스룸</p>
        <br><br>
        <div class="container">
          <!-- 탭 메뉴 상단 시작 -->
            <ul class="tabs">
              <li class="tab-link current" data-tab="tab-1">클래스</li>
              <li class="tab-link" data-tab="tab-2">강의영상</li>
              <li class="tab-link" data-tab="tab-3">학습방</li>
              <li class="tab-link" data-tab="tab-4">멘티채팅</li>
            </ul>
            <br><br><br>
          <!-- 탭 메뉴 상단 끝 -->
          <!-- 탭 메뉴 내용 시작 -->
            <div id="tab-1" class="tab-content current">
              <h2>강의 소개</h2>
              <hr class="hr1"><br>
              <p>이 클래스는 OH! 잔디만의 특급 비법이 담긴 강의입니다.</p>
              <p>이 강의를 듣는 여러분은 선택받은 사람들인거에요!</p>
              <p>그러니까 감사하는 마음을 가지고 게을리 하지 않고 열심히 들어주세요.</p>
              <p>제가 공을 들여 만든 강의가 아깝지 않게 해주세요.</p>
              <p>부탁이 아닌 강요랍니다!</p>
              <img src="${ pageContext.servletContext.contextPath }/resources/images/java.png" />
              <br><br><br><br>
              <div class="tag">
              <p class="tagName">태그</p>
              <div class="ui button" data-tooltip="Add users to your feed" data-position="top left">JAVA</div>
              <div class="ui button" data-tooltip="Add users to your feed" data-position="top center">eclipse</div>
              <div class="ui button" data-tooltip="Add users to your feed" data-position="top right">spring</div>
            </div>
            <hr>
            <h2>강의 목차</h2>
            <p class="contents">chap1. 리터럴<br>
               chap2. 변수<br>
               chap3. 메소드<br>
               chap4. 배열</p>
            <hr><br>
            <div class="after"><h2>후기</h2><p>총 5개</p></div>
            <div class="ui card" id="aftercard">
              <div class="content">
                <div class="left aligned header afterheader">
                  <i class="star icon"></i>
                  <i class="star icon"></i>
                  <i class="star icon"></i>
                  <i class="star icon"></i>
                  <i class="star icon"></i>
                </div>
                <div class="left aligned description">
                  <p>알차고 좋은 구성이였습니다! 잘들었습니다.</p>
                </div>
              </div>
              <div class="extra content">
                <div class="right aligned author"><p>익명의 잔디 2021.11.18</p></div>
              </div>
            </div>
            </div>
            <div id="tab-2" class="tab-content">
              <h2>4개의 목차</h2>
              <hr class="hr1"><br>
              <div class="tab2-title"><p>chap01. 리터럴</p><a>삭제</a></div>
              <iframe width="560" height="315" src="https://www.youtube.com/embed/DSqAice-CzE" title="YouTube video player" frameborder="0" 
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              <br><br>
              <div class="tab2-title"><p>chap02. 변수</p><a>삭제</a></div>
              <iframe width="560" height="315" src="https://www.youtube.com/embed/8qX7jBZ0ZEU" title="YouTube video player" frameborder="0" 
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              <br><br>
              <div class="tab2-title"><p>chap03. 메소드</p><a>삭제</a></div>
              영상 업로드
              <br><br>
              <div class="tab2-title"><p>chap04. 배열</p><a>삭제</a></div>
              영상 업로드
              <br><br>
            </div>
            <div id="tab-3" class="tab-content">
              <div class="tab3-title">
              <h3>Oh! 잔디</h3><p class="homework">chap01 숙제</p><p class="date">2021.11.18</p></div>
              <hr class="hr1"><br>
              <p>chap1 숙제입니다</p>
              <p>열심히 풀어보세요!!!</p>
              <br><br><br><br><br>
              <h3>첨부파일</h3>
              <p>&nbsp&nbsp homework_chap01.pdf</p>
              <p>&nbsp&nbsp homework_chap02.pdf</p>
              <br><br>
              <h3>제출</h3>
              <hr>
              <div class="plus"><div class="ui icon button plusbtn" style="background-color: #91C788;" 
                data-content="Add users to your feed"><i class="add icon" style="color: white;"></i></div><h4>첨부파일추가</h4></div>
              <br>
              <div class="ui steps">
                <div class="step" style="border: 3px solid #91C788;">
                  <div class="title">익명의잔디1</div>
                  <div class="description">homework_chap01.pdf</div>
                </div>
              </div>
              <div class="ui steps">
                <div class="step" style="border: 3px solid #91C788;">
                  <div class="title">익명의잔디2</div>
                  <div class="description">homework_chap01.pdf</div>
                </div>
              </div>
            </div>
            <div id="tab-4" class="tab-content">
              gggg
            </div>
          <!-- 탭 메뉴 내용 끝 -->
          </div>
    </div>
    </div>
    <script>
      $(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		/* $('ul.tabs li').removeClass('current'); */
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});
    </script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>