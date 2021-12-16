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
      href="${ pageContext.servletContext.contextPath }/resources/css/footer.css?"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
  </head>
  <body>
    <footer>
      <div class="footer">
        <div class="footer-up">
          <div>
            <h3>Company</h3>
            <div>
              <a href="${ pageContext.servletContext.contextPath}/faq/test"><p>회사 소개</p></a>
              <a href="FAQ.html"><p>블로그</p></a>
              <a href="${ pageContext.servletContext.contextPath}/faq/notice"><p>공지사항</p></a>
            </div>
          </div>
          <div>
            <h3>SUPPORT</h3>
            <a href="${ pageContext.servletContext.contextPath}/faq/faq"
              ><p>FAQ</p></a
            >
            <a href="FAQ.html"><p>숨은 잔디 센터</p></a>
          </div>

          <div>
            <h3>POLICIES</h3>
            <a href="${ pageContext.servletContext.contextPath}/faq/policy"
              ><p>이용약관</p></a
            >
            <a href="${ pageContext.servletContext.contextPath}/faq/policy"
              ><p>개인정보처리방침</p></a
            >
          </div>

          <div>
            <h3>1234-5678</h3>
            <h6>평일 10:00 ~ 18:00</h6>
            <h6>(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)</h6>
          </div>
        </div>

        <hr />

        <div class="footer-down">
          <div class="footer-down-left">
            <div>
              상호 : (주)숨은잔디 | 주소 : 서울특별시 서초구 강남대로 441 5층
              503호 | 사업자등록번호 : 767-88-00630 | 대표자명 : 유승제 <br />
              통신판매업 신고번호 : 제 2017-서울서-02964 <br />
              Copyright ⓒ2020 SoomJan inc, ltd. All rights reserved
            </div>
          </div>
          <div class="footer-down-right">
            <div class="nav-sns">
              <a href="https://www.naver.com">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/facebook3.png"
                  class="navi-face"
                  style="width: 50px"
              /></a>
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/youtube3.png"
                class="navi-insta"
                style="width: 50px"
              />
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/instagram3.png"
                class="navi-tw"
                style="width: 50px"
              />
              <img
                src="${ pageContext.servletContext.contextPath }/resources/images/twitter3.png"
                class="navi-you"
                style="width: 50px"
              />
            </div>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>
