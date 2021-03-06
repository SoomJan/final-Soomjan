<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    <!-- 캐러셀 css -->
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/swiper.css"
      rel="stylesheet"
    />

   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <script
      type="text/javascript"
      src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.js"
    ></script>
    <script
      type="text/javascript"
      src="${ pageContext.servletContext.contextPath }/resources/js/main.js"
    ></script>
    <script
      type="text/javascript"
      src="${ pageContext.servletContext.contextPath }/resources/js/maincarousel.js"
    ></script>

   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script
      type="text/javascript"
      src="https://pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>

  <script>
  	$(function(){
  		if('${requestScope.authMessage}' != ''){
  			if(confirm('${requestScope.authMessage}')){
  				alert("잔디 신청페이지로 이동! (아직 구현 X)");
  			}
  		}
  	});
  </script>

  <body>
    <jsp:include page="../common/nav.jsp" />

    <!-- 부트스트랩 캐러셀 -->
    <div class="main-logo">
      <div
        id="myCarousel"
        class="carousel slide"
        data-ride="carousel"
        style="overflow: auto"
      >
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img
              class="first-slide"
              src="${ pageContext.servletContext.contextPath }/resources/images/carousel1.png"
              alt="First slide"
            />
          </div>
          <div class="item">
            <img
              class="second-slide"
              src="${ pageContext.servletContext.contextPath }/resources/images/carousel2.png"
              alt="Second slide"
            />
          </div>
          <div class="item">
            <img
              class="third-slide"
              src="${ pageContext.servletContext.contextPath }/resources/images/carousel3.png"
              alt="Third slide"
            />
          </div>
          <div class="item">
            <a href="#"
              ><img
                class="second-slide"
                src="${ pageContext.servletContext.contextPath }/resources/images/carousel2.png"
                alt="Second slide"
            /></a>
          </div>
        </div>
        <a
          class="left carousel-control"
          href="#myCarousel"
          role="button"
          data-slide="prev"
        >
          <span class="sr-only">Previous</span>
        </a>
        <a
          class="right carousel-control"
          href="#myCarousel"
          role="button"
          data-slide="next"
        >
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>

    <main class="container-fluid">
      <div class="main-search">
        <h4>숨어있는 잔디를 찾아보세요</h4>
        <form class="main-searchbox" method="post">
          <input type="text" placeholder="찾으시는 강의가 있으신가요?" />
          <button type="submit">
            <img
              src="${ pageContext.servletContext.contextPath }/resources/images/research.png"
            />
          </button>
        </form>
      </div>
      <div class="recommendclass">
        <a href="#"><button class="btn-hover color-1">#JAVA</button></a>
        <a href="#"><button class="btn-hover color-1">#MVC</button></a>
        <a href="#"><button class="btn-hover color-1">#SPRING</button></a>
        <a href="#"><button class="btn-hover color-1">프론트앤드</button></a>
        <a href="#"><button class="btn-hover color-1">백앤드</button></a>
      </div>
      <br />

      <!-- swiper 캐러셀 -->
      <div class="intro-board">
        <h1>열혈 잔디🌿</h1>
        <h4>최근 일주일간 가장 많이 검색된 잔디를 소개합니다.</h4>
        <br /><br />
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <c:forEach var="class1" items="${ class2 }" end="3">
          <div class="swiper-slide photo">
          	<div class="carousel-img" onclick="location.href='https://www.naver.com'">
				<img  src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${class1.filePath}"  />
          	</div>
          		 <div>
            		  <h4>${ class1.jandiDTO.nickName }</h4>
           		 </div>
           		 <div>
           			   <h5>${ class1.contents }</h5>
           		 </div>	
           		 <div>
           			   <h5>${ class1.price }</h5>
           		 </div>	
          </div>
          </c:forEach>
        </div>
        
        <div class="swiper-button-next">&gt;</div>
        <div class="swiper-button-prev">&lt;</div>
      </div>

    </main>

    <div class="applymentor">
      <div class="applymentor-inner">
        <div class="applymentor-inner-left">
          <strong>더 많은 고객을 만날 기회!</strong><br />
          가입 직후 <strong>내 조건에 맞는 요청서</strong>를<br />
          무료로 받아보고 만나고 싶은<br />
          고객과 연락해보세요.<br />

          <button type="button" onclick>잔디로 가입하기</button>
        </div>

        <div class="swiper-container1">
          <div class="swiper-ljh">
            <div class="swiper-pagination"></div>
            <div class="swiper-button-ljh">
              <div class="swiper-button-prev1">&lt;</div>
              <div class="swiper-button-next1">&gt;</div>
            </div>
          </div>

          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <div class="carousel-img1">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/applymentor1.png"
                />
              </div>
              <div class="classtitle">새싹의 요청서가 도착해요</div>
              <p>
                전문 분야 활동을 등록하면 <br />
                새싹이 도움이 필요한 서비스에 대해<br />
                작성한 요청서가 도착해요
              </p>
            </div>
            <div class="swiper-slide">
              <div class="carousel-img1">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/applymentor2.png"
                />
              </div>
              <div class="classtitle">잔디님의 견적을 발송하세요</div>
              <p>
                답변 보낼 새싹을 선택하고 <br />
                견적을 보낸 후 고용 기회를 잡아보세요
              </p>
            </div>
            <div class="swiper-slide">
              <div class="carousel-img1">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/applymentor3.png"
                />
              </div>
              <div class="classtitle">새싹과 연락하세요</div>
              <p>
                견적을 보낸 새싹과 <br />
                채팅 및 전화(안심번호)를 통해<br />
                의뢰를 진행하세요
              </p>
            </div>
            <div class="swiper-slide">
              <div class="carousel-img1">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/applymentor4.png"
                />
              </div>
              <div class="classtitle">거래가 완료되었어요!</div>
              <p>
                거래를 통해 서로 도움을 <br />
                주고 받고 이제 나도 숨은 잔디!!
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../common/footer.jsp" />

    <script src="css/ie10-viewport-bug-workaround.js"></script>
    <script>
      new Swiper(".swiper-container", {
        slidesPerView: 4, // 동시에 보여줄 슬라이드 갯수
        spaceBetween: 1, // 슬라이드간 간격
        slidesPerGroup: 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

        loopFillGroupWithBlank: true,

        loop: false, // 무한 반복

        pagination: {
          el: ".swiper-pagination",
          clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        navigation: {
          nextEl: ".swiper-button-next", // 다음 버튼 클래스명
          prevEl: ".swiper-button-prev", // 이번 버튼 클래스명
        },
      });
    </script>
    <script>
      new Swiper(".swiper-container1", {
        slidesPerView: 1, // 동시에 보여줄 슬라이드 갯수
        spaceBetween: 1, // 슬라이드간 간격
        slidesPerGroup: 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

        loopFillGroupWithBlank: true,

        loop: false, // 무한 반복

        pagination: {
          el: ".swiper-pagination",
          clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        navigation: {
          nextEl: ".swiper-button-next1", // 다음 버튼 클래스명
          prevEl: ".swiper-button-prev1", // 이번 버튼 클래스명
        },
      });
    </script>
  </body>
</html>
