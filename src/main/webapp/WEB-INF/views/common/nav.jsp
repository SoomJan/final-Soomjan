<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/glyphicons-halflings-regular.svg"
      rel="stylesheet"
    />

    <!--<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>-->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
      $(function () {
        $("#acti").on("click", function () {
          $("#nav-sidebar").css("left", "81%");
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
        <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png"/>
      </div>

      <div class="nav-sidebar-content">
        <div>
        <ul>
          <a href="${ pageContext.servletContext.contextPath }">
            <li>
              <span>🏠</span>
              <span>홈으로</span>
            </li>
          </a>
        </ul>
      </div>
      <div>
          <hr/>
           <c:if
            test="${ empty sessionScope.loginMember.email && empty sessionScope.loginManager.mngNickName}" >
             <ul>

            <li>
          <a href="${ pageContext.servletContext.contextPath }/member/login">
              <span>✋</span>
              <span>로그인하기</span>
          </a>
            </li>
        </ul>
        <ul>
            <li>
          <a href="${ pageContext.servletContext.contextPath }/member/terms">
              <span>📜</span>
              <span>회원가입 </span>
          </a>
            </li>
        </ul>
        </c:if>

        <c:if
            test="${ !empty sessionScope.loginMember.email}" >
             <ul>

            <li>
              <a href="${ pageContext.servletContext.contextPath }/mypage/main">
              <span>✋</span>
              <span>마이페이지</span>
             </a>
            </li>
        </ul>
        <ul>
            <li>
          <a href="${ pageContext.servletContext.contextPath }/member/logout">
              <span>📜</span>
              <span>로그아웃</span>
          </a>
            </li>
        </ul>
        </c:if>

        <c:if
            test="${ !empty sessionScope.loginManager.mngNickName }" >
             <ul>

            <li>
          <a href="${ pageContext.servletContext.contextPath }/manager/mentilist">
              <span>✋</span>
              <span>관리자 페이지</span>
          </a>
            </li>
        </ul>
        <ul>
            <li>
          <a href="${ pageContext.servletContext.contextPath }/manager/logout">
              <span>📜</span>
              <span>로그아웃</span>
          </a>
            </li>
        </ul>
        </c:if>


      </div>
      
      <div>
        <hr />
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

      <div>
        <hr/>
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
         <c:if test="${ empty sessionScope.loginMember.email && empty sessionScope.loginManager.mngNickName }">
        <ul>
          <a href="${ pageContext.servletContext.contextPath }/manager/login">
            <li>
              <span>📑</span>
              <span>관리자 로그인</span>
            </li>
          </a>
        </ul>
		</c:if>
		
        <hr />
        <ul class="nav-sidebar-inline">
          <a href="#">
            <li>
              <div class="nav-sns2">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/twitter3.png"
                  class="navi-face"
                  style="width: 20px"
                />
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/youtube3.png"
                  class="navi-insta"
                  style="width: 20px"
                />
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/instagram3.png"
                  class="navi-tw"
                  style="width: 20px"
                />
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/facebook3.png"
                  class="navi-you"
                  style="width: 20px"
                />
              </div>
            </li>
          </a>
        </ul>
      </div>
    </div>
  </div>

    <nav>
      <div class="nav-left">
        <div>
        <a href="${ pageContext.servletContext.contextPath }">
          <img
            src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png"
        /></a>
      </div>
      </div>

      <div class="nav-menu">
        <div class="nav-menu-item">
          <div>
            <a
              href="${ pageContext.servletContext.contextPath }/findmentor/findAllMentorMain"
              >멘토보기</a
            >
          </div>
          <div>
            <a
              href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain"
              >클래스</a
            >
          </div>
          <div>
            <a
              href="${ pageContext.servletContext.contextPath }/matching/manteeMain/${ sessionScope.loginMember.email}"
              >매칭</a
            >
          </div>
          <div>
          <c:if test="${ !empty sessionScope.loginMember }">
          	<c:if test="${ sessionScope.isjandi eq 'Y' }">
            	<a href="${ pageContext.servletContext.contextPath }/jandi/jandiProfile">멘토 페이지</a>
            </c:if>
         	<c:if test="${ sessionScope.isjandi != 'Y' }">
           		<a href="${ pageContext.servletContext.contextPath }/jandi/jandiProfile" >멘토신청</a>
           </c:if>
          </c:if>
          <c:if test="${ empty sessionScope.loginMember }">
           	<a href="${ pageContext.servletContext.contextPath }/jandi/jandiProfile" >멘토신청</a>
          </c:if>
          </div>
        </div>

        <div class="nav-right">
          <c:if
            test="${ empty sessionScope.loginMember.email && empty sessionScope.loginManager.mngNickName}"
          >
            <div class="nav-right-login">
              <a href="${ pageContext.servletContext.contextPath }/member/login"
                ><button type="button" class="btn">로그인</button>
              </a>
               <a
                href="${ pageContext.servletContext.contextPath }/member/terms"
                ><button type="button" class="btn" style="background-color:#91c788 ;">회원가입</button>
              </a>
            </div>
          </c:if>

          <c:if test="${ !empty sessionScope.loginMember.email}">
            <div class="nav-right-login">
              <h5>"${ sessionScope.loginMember.email }" 님 <br>
                환영합니다!</h5>
            </div>
          </c:if>

          <c:if test="${ !empty sessionScope.loginManager.mngNickName}">
            <div class="nav-right-login">
              <h5>"${ sessionScope.loginManager.mngNickName }"님 <br>
                환영합니다!</h5>
            </div>
          </c:if>

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
