<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>

    <title>๋ค๋น๋ฐ</title>
    
    <link href="${ pageContext.servletContext.contextPath }/resources/css/nav.css?after" rel="stylesheet"/>
    
 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	    
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
      
      $(function(){
    	  if( '${ jandiRegistMessage }' != ''){
    		  alert('${ jandiRegistMessage }');
    	  }
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
              <span>๐ </span>
              <span>ํ์ผ๋ก</span>
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
              <span>โ</span>
              <span>๋ก๊ทธ์ธํ๊ธฐ</span>
          </a>
            </li>
        </ul>
        <ul>
            <li>
          <a href="${ pageContext.servletContext.contextPath }/member/terms">
              <span>๐</span>
              <span>ํ์๊ฐ์ </span>
          </a>
            </li>
        </ul>
        </c:if>

        <c:if
            test="${ !empty sessionScope.loginMember.email}" >
             <ul>

            <li>
              <a href="${ pageContext.servletContext.contextPath }/mypage/main">
              <span>โ</span>
              <span>๋ง์ดํ์ด์ง</span>
             </a>
            </li>
        </ul>
        <ul>
            <li>
          <a href="${ pageContext.servletContext.contextPath }/member/logout">
              <span>๐</span>
              <span>๋ก๊ทธ์์</span>
          </a>
            </li>
        </ul>
        </c:if>

        <c:if
            test="${ !empty sessionScope.loginManager.mngNickName }" >
             <ul>

            <li>
          <a href="${ pageContext.servletContext.contextPath }/manager/mentilist">
              <span>โ</span>
              <span>๊ด๋ฆฌ์ ํ์ด์ง</span>
          </a>
            </li>
        </ul>
        <ul>
            <li>
          <a href="${ pageContext.servletContext.contextPath }/manager/logout">
              <span>๐</span>
              <span>๋ก๊ทธ์์</span>
          </a>
            </li>
        </ul>
        </c:if>


      </div>
      
      <div>
        <hr />
        <ul class="find-grass">
          <a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain">
            <li>
              <span>๐ฟ</span>
              <span>ํด๋์ค ๋๋ฌ๋ณด๊ธฐ</span>
            </li>
          </a>
        </ul>
        <ul class="hide-grass">
          <a href="${ pageContext.servletContext.contextPath }/findJandi/findAllJandiMain">
            <li>
              <span>๐</span>
              <span>์จ์ ์๋ ์ฐพ๊ธฐ</span>
            </li>
          </a>
        </ul>
      </div>

      <div>
        <hr/>
        
        <ul>
          <a href="#">
            <li>
              <span>๐ฌ</span>
              <span>์ด๋ฉ์ผ ๋ฌธ์</span>
            </li>
          </a>
        </ul>
        <ul>
          <a href="${ pageContext.servletContext.contextPath}/faq/notice">
            <li>
              <span>๐</span>
              <span>์๊ฒฌ ๋ฐ ์ค๋ฅ ์ ๋ณด</span>
            </li>
          </a>
        </ul>
         <c:if test="${ empty sessionScope.loginMember.email && empty sessionScope.loginManager.mngNickName }">
        <ul>
          <a href="${ pageContext.servletContext.contextPath }/manager/login">
            <li>
              <span>๐</span>
              <span>๊ด๋ฆฌ์ ๋ก๊ทธ์ธ</span>
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
          <img src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png"/></a>
      </div>
      </div>
      <div class="nav-menu">
        <div class="nav-menu-item">
          <div>
            <a href="${ pageContext.servletContext.contextPath }/findJandi/findAllJandiMain">์๋๋ณด๊ธฐ</a>
          </div>
          <div>
            <a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" >ํด๋์ค</a>
          </div>
          <div>
            <a href="${ pageContext.servletContext.contextPath }/matching/manteeMain/${ sessionScope.loginMember.email}">๋งค์นญ</a>
          </div>
          <div>
          <c:if test="${ !empty sessionScope.loginMember }">
          	<c:if test="${ sessionScope.isjandi eq 'Y' }">
            	<a href="${ pageContext.servletContext.contextPath }/jandi/jandiProfile">์๋ ํ์ด์ง</a>
            </c:if>
         	<c:if test="${ sessionScope.isjandi != 'Y' }">
           		<a href="${ pageContext.servletContext.contextPath }/mypage/joinJandi" >์๋ ์ ์ฒญ</a>
           </c:if>
          </c:if>
          <c:if test="${ empty sessionScope.loginMember }">
           		<a href="${ pageContext.servletContext.contextPath }/mypage/joinJandi" >์๋ ์ ์ฒญ</a>
          </c:if>
          </div>
        </div>
        <div class="nav-right">
          <c:if test="${ empty sessionScope.loginMember.email && empty sessionScope.loginManager.mngNickName}">
            <div class="nav-right-login">
              <a href="${ pageContext.servletContext.contextPath }/member/login"><button type="button" class="btn">๋ก๊ทธ์ธ</button>
              </a>
               <a href="${ pageContext.servletContext.contextPath }/member/terms"><button type="button" class="btn" style="background-color:#91c788 ;">ํ์๊ฐ์</button>
              </a>
            </div>
          </c:if>

          <c:if test="${ !empty sessionScope.loginMember.email}">
            <div class="nav-right-login">
              <h5>"${ sessionScope.loginMember.email }" ๋ <br>
                ํ์ํฉ๋๋ค!</h5>
            </div>
          </c:if>

          <c:if test="${ !empty sessionScope.loginManager.mngNickName}">
            <div class="nav-right-login">
              <h5>"${ sessionScope.loginManager.mngNickName }"๋ <br>
                ํ์ํฉ๋๋ค!</h5>
            </div>
          </c:if>

          <div class="nav-right-sidebar">
            <button type="button" id="acti">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/navi.png" />
            </button>
          </div>
        </div>
      </div>
    </nav>
  </body>
</html>
