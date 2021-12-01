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

    <title>등록된 멘토 조회</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/nav.css"
      rel="stylesheet"
    />

    <link href="${ pageContext.servletContext.contextPath }/resources/css/glyphicons-halflings-regular.svg" rel="stylesheet" />

    <!--<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>-->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
      $(function () {
        $("#acti").on("click", function () {
          $("#nav-sidebar").css("left", "84%");

        });
      });

      $(function () {
        $(".nav-sidebar-exit").on("click", function () {
          $("#nav-sidebar").css("left", "100%");
        });
      });
    </script>
  </head>

  <body>
    <div class="nav-sidebar" id="nav-sidebar">
      <div class="nav-sidebar-exit">
        <img src="resources/images/close.png" class="navi-close" />
      </div>

      <div class="width-100">
        <ul>
          <a href="#">
            <li>
              <span>🏠</span>
              <span>홈으로</span>
            </li>
          </a>
        </ul>
        <hr style="opacity: 0.4;">
        <ul>
          <a href="login.html" target="_parent">
            <li>
              <span>✋</span>
              <span>로그인하기</span>
            </li>
          </a>
        </ul>
        <ul>
          <a href="#">
            <li>
              <span>📜</span>
              <span>회원가입 </span>
            </li>
          </a>
        </ul>
        <hr style="opacity: 0.4;" />
      </div>

      <div class="width-100">
        <ul class="find-grass">
          <a href="#">
            <li>
              <span>🌿</span>
              <span>잔디 둘러보기</span>
            </li>
          </a>
        </ul>
        <ul class="hide-grass">
          <a href="#">
            <li>
              <span>🍀</span>
              <span>숨은 잔디 찾기</span>
            </li>
          </a>
        </ul>
      </div>

      <div class="width-100">
        <hr style="opacity: 0.4;" />
        <ul>
          <a href="#">
            <li>
              <span>👩‍🏫</span>
              <span>멘토 가입하기</span>
            </li>
          </a>
        </ul>
        <ul>
          <a href="#">
            <li>
              <span>📬</span>
              <span>이메일 문의</span>
            </li>
          </a>
        </ul>
        <ul>
          <a href="#">
            <li>
              <span>📑</span>
              <span>의견 및 오류 제보</span>
            </li>
          </a>
        </ul>

        <hr style="opacity: 0.4;" />
        <ul class="nav-sidebar-inline">
          <a href="#">
            <li>
              <div class="nav-sns2">
                <img src="resources/images/twitter3.png" class="navi-face" style="width: 20px;" />
                <img src="resources/images/youtube3.png" class="navi-insta" style="width: 20px;" />
                <img src="resources/images/instagram3.png" class="navi-tw" style="width: 20px;" />
                <img src="resources/images/facebook3.png" class="navi-you" style="width: 20px;" />
              </div>
            </li>
          </a>
        </ul>
      </div>
    </div>

    <nav>
      <div class="nav-left">
        <a href="#">
          <img
            src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png"
        /></a>
      </div>

      <div class="nav-menu">
        <div class="nav-menu-item">
          <div><a href="${ pageContext.servletContext.contextPath }/findmentor/findAllMentorMain">멘토보기</a></div>
          <div><a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain">클래스</a></div>
          <div><a href="/Final_SoomJan_html/matching/matching_mantee_main.jsp">매칭</a></div>
          <div><a href="${ pageContext.servletContext.contextPath }/jandi/jandiProfile">멘토신청</a></div>
        </div>

        <div class="nav-right">
          <div class="nav-right-login">
            <a href="${ pageContext.servletContext.contextPath }/member/login"><button type="button" class="btn">로그인</button> </a>
          </div>

          <div class="nav-right-regist">
            <a href="${ pageContext.servletContext.contextPath }/member/regist"><button type="button" class="btn">회원가입</button> </a>
          </div>

          <div class="nav-right-sidebar">
            <button type="button" id="acti">
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/navi.png"
              />
            </button>
          </div>
        </div>
      </div>
    </nav>
  </body>
</html>
