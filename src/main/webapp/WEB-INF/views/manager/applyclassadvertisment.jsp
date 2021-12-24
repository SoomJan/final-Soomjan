<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>

    <title>클래스 광고 요청 조회</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />

  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>클래스 광고 요청 조회</h1>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>클래스 이름</th>
              <th>잔디닉네임</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#">자바 기반 앱개발 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">코딩알못에서 웹서비스 런칭까지</a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">렛츠고 장고! 웹 개발 첫걸음 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">20시간만에 웹퍼블리셔되기</a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">워드 프레스 칙칙폭폭 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">디자이너를 위한 웹코딩개발 </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
            <tr>
              <td><a href="#">디자인? 디자인! </a></td>
              <td><a href="#">OH! 잔디</a></td>
              <td>2021-11-18</td>
            </tr>
          </tbody>
        </table>
        <div class="manager-search">
          <input type="hidden" name="currentPage" value="1" />
          <select
            class="ui dropdown menu"
            id="searchCondition"
            name="searchCondition"
          >
          	<option value="" selected>선택</option>
            <option value="1">클래스이름</option>
            <option value="2">잔디닉네임</option>
          </select>
            <div class="ui search menti-search">
  				<div class="ui icon input input-search">
    			<input class="prompt" type="search" id="searchValue" name="searchValue" value="<c:out value="${ sessionScope.selectCriteria.searchValue }"/>">
    			 <button id="searchbtn" style="border: none; background:none; position: relative; right: 11%;"><img src="${ pageContext.servletContext.contextPath }/resources/images/search.png" style="width:25px;"></button>
    		<!-- 	<input type="button" id="searchbtn"> -->
  				</div>
 			 	<div class="results"></div>
			</div>
          </div>
                <jsp:include page="../common/Paging.jsp" />
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
