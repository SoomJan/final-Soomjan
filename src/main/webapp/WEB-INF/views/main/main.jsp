<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

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
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />

    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.js"
    ></script>
    <script
      type="text/javascript"
      src="${ pageContext.servletContext.contextPath }/resources/js/maincarousel.js"
    ></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/parallax.js"></script>
  </head>

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
        <div class="recommendclass">
          <button>#MVC</button>
          <button>#JAVA</button>
          <button>#SPRING</button>
          <button>프론트앤드</button>
        </div>
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
          <div
            class="swiper-slide photo"
            onclick="location.href='https://www.naver.com'"
          >
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/초록잔디.png"
              />
            </div>
            <div>
              <h4>초록 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>
          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/옐로우잔디.png"
              />
            </div>
            <div>
              <h4>옐로우 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>
          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/레드잔디.png"
              />
            </div>
            <div>
              <h4>레드 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>
          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/퍼플잔디.png"
              />
            </div>
            <div>
              <h4>보라 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>
          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/퍼플잔디.png"
              />
            </div>
            <div>
              <h4>보라 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>

          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/옐로우잔디.png"
              />
            </div>
            <div>
              <h4>옐로우 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>
          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/퍼플잔디.png"
              />
            </div>
            <div>
              <h4>보라 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>

          <div class="swiper-slide photo">
            <div
              class="carousel-img"
              onclick="location.href='https://www.naver.com'"
            >
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/옐로우잔디.png"
              />
            </div>
            <div>
              <h4>옐로우 잔디</h4>
            </div>
            <div>
              <h5>😘모두 다 알려주겠다~</h5>
            </div>
          </div>
        </div>
        <!-- <div class="swiper-pagination"></div> -->
        <div class="swiper-button-next">&gt;</div>
        <div class="swiper-button-prev">&lt;</div>
      </div>

      <!-- <div class="main-logo1">
        <div
          id="myCarousel1"
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
            href="#myCarousel1"
            role="button"
            data-slide="prev"
          >
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="right carousel-control"
            href="#myCarousel1"
            role="button"
            data-slide="next"
          >
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div> -->

      <div class="intro-board">
        <span><h1>이런 강의는 어때요??</h1></span>
        <span><h4>항상 인기 많은 잔디 수업 지금 소개합니다~!</h4></span>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
          <div
            class="swiper-slide photo"
            onclick="location.href='https://www.naver.com'"
          >
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass3.png"
              />
            </div>
            <div class="classtitle">파이썬 코딩 마스터</div>
            <div class="classinstructor">초록잔디</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩19,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass2.png"
              />
            </div>
            <div class="classtitle">진짜 입문 올인원 개발 클래스</div>
            <div class="classinstructor">그랩</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩28,600</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass3.png"
              />
            </div>
            <div class="classtitle">파이썬 코딩 마스터</div>
            <div class="classinstructor">초록잔디</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩19,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass2.png"
              />
            </div>
            <div class="classtitle">진짜 입문 올인원 개발 클래스</div>
            <div class="classinstructor">그랩</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩28,600</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
        </div>
        <!-- <div class="swiper-pagination"></div> -->
        <div class="swiper-button-next">&gt;</div>
        <div class="swiper-button-prev">&lt;</div>
      </div>

      <div class="intro-board">
        <span><h1>11월 4주차 가장 있기있는 강의!!</h1></span>
        <span><h4>수강생 참여도가 가장 좋아요</h4></span>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainfavclass1.png"
              />
            </div>
            <div class="classtitle">스위프트 기초 문법</div>
            <div class="classinstructor">개발하는 정대리</div>
            <div class="classprice">무료강의</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainfavclass2.png"
              />
            </div>
            <div class="classtitle">무자본 1인 지식 창업</div>
            <div class="classinstructor">작가 글리쌤</div>
            <div class="classprice">₩49,500</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass2.png"
              />
            </div>
            <div class="classtitle">진짜 입문 올인원 개발 클래스</div>
            <div class="classinstructor">그랩</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩28,600</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass3.png"
              />
            </div>
            <div class="classtitle">파이썬 코딩 마스터</div>
            <div class="classinstructor">초록잔디</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩19,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass2.png"
              />
            </div>
            <div class="classtitle">진짜 입문 올인원 개발 클래스</div>
            <div class="classinstructor">그랩</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩28,600</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
        </div>
        <!-- <div class="swiper-pagination"></div> -->
        <div class="swiper-button-next">&gt;</div>
        <div class="swiper-button-prev">&lt;</div>
      </div>

      <div class="intro-board">
        <span><h1>따끈따끈한 신규 강의를 만나볼 수 있는 기회!</h1></span>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass3.png"
              />
            </div>
            <div class="classtitle">파이썬 코딩 마스터</div>
            <div class="classinstructor">초록잔디</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩19,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass2.png"
              />
            </div>
            <div class="classtitle">진짜 입문 올인원 개발 클래스</div>
            <div class="classinstructor">그랩</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩28,600</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass3.png"
              />
            </div>
            <div class="classtitle">파이썬 코딩 마스터</div>
            <div class="classinstructor">초록잔디</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩19,900</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass2.png"
              />
            </div>
            <div class="classtitle">진짜 입문 올인원 개발 클래스</div>
            <div class="classinstructor">그랩</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+100)</div>
            <div class="classprice">₩28,600</div>
          </div>
          <div class="swiper-slide photo">
            <div class="carousel-img">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png"
              />
            </div>
            <div class="classtitle">스프링 부트 + JPA</div>
            <div class="classinstructor">김영한</div>
            <div class="classrating">⭑⭑⭑⭑⭑(+300)</div>
            <div class="classprice">₩79,900</div>
          </div>
        </div>
        <!-- <div class="swiper-pagination"></div> -->
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
    <script>
      $(".parallax-window").parallax({
        imageSrc:
          "${ pageContext.servletContext.contextPath }/resources/images/mainclass4.png",
      });
    </script>
  </body>
</html>
