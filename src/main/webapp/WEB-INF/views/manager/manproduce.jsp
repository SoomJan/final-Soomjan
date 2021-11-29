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

    <title>관리자 계정 관리</title>
    
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css"
    rel="stylesheet"
    />
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
    rel="stylesheet"
    /> 
    <link
    href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css"
    rel="stylesheet"
    />
    
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
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

    p {
    font-weight: bold;
    font-size: 20px;
    }

    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
      <h1 id="category"> 관리자 계정 관리 </h1>

      <h3>관리자 계정 정보</h3>
      <table class="ui basic table warningtable">
        <thead>
          <tr>
            <th></th>
            <th>이름</th>
            <th>닉네임</th>
            <th>아이디</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>권순표</td>
            <td>권잔디</td>
            <td>gsp</td>
          </tr>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>오수빈</td>
            <td>오잔디</td>
            <td>ojd</td>
          </tr>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>임예람</td>
            <td>임잔디</td>
            <td>lyr</td>
          </tr>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>이선호</td>
            <td>이잔디</td>
            <td>lsh</td>
          </tr>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>이지환</td>
            <td>환잔디</td>
            <td>ljh</td>
          </tr>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>유선미</td>
            <td>유잔디</td>
            <td>ysm</td>
          </tr>
          <tr>
            <td><input class="check" type="checkbox"></td>
            <td>양효진</td>
            <td>양잔디</td>
            <td>yhj</td>
          </tr>
        </tbody>
      </table>

      <form>
      <input class="delete" type="submit" value="계정 삭제">
      </form>

      <h3>관리자 계정 생성 </h3>
      <form>
      <h3 class="produce1"> 이름 : <input class="pd1" type="text" placeholder="name"> </h3>
      <h3 class="produce2"> 닉네임 :  <input class="pd2" type="text" placeholder="nickname"> </h3>
      <h3 class="produce3"> 아이디 :  <input class="pd3" type="text" placeholder="ID"> </h3>
      <h3 class="produce4"> 비밀번호 : <input class="pd4" type="text" placeholder="password"> </h3>
      <input class="create" type="submit" value="계정 생성">
      </form>

      <script>
        /* 관리자 계정 등록하기 */
        $(function(){
          $(".create").click(function(e){
            
            let name = $(".pd1").val();
            let nickName = $(".pd2").val();
            let id = $(".pd3").val();
            let pwd = $(".pd4").val();

            e.preventDefault();

            if(!name) {
              $("#nameModal").fadeIn();
              $(".btn").click(function(){
                $("#nameModal").fadeOut();
              });
            } else if(!nickName) {
              $("#nickModal").fadeIn();
              $(".btn").click(function(){
                $("#nickModal").fadeOut();
              });
            } else if(!id) {
              $("#idModal").fadeIn();
              $(".btn").click(function(){
                $("#idModal").fadeOut();
              });
            } else if(!pwd) {
              $("#pwdModal").fadeIn();
              $(".btn").click(function(){
                $("#pwdModal").fadeOut();
              });
            } else {
              /* 취소 버튼 누르면 창이 꺼지고, 확인 버튼을 눌러야 데이터가 넘어가도록 추후에 처리 필요 */
              $("#createModal").fadeIn();
              $(".btn").click(function(){
                $("#createModal").fadeOut();
                $("#resultModal").fadeIn();
              $(".btn").click(function(){
                window.location.reload();
              });
              });
            }
          });
        });

        /* 관리자 계정 삭제하기 */
        $(function(){
          $(".delete").click(function(e){

            let checkNum = $("input:checked").length;
            console.log(checkNum);

            e.preventDefault();

            if(!checkNum) {
              $("#nullModal").fadeIn();
              $(".btn").click(function(){
                $("#nullModal").fadeOut();
              });
            } else {
              /* 취소 버튼 누르면 창이 꺼지고, 확인 버튼을 눌러야 데이터가 넘어가도록 추후에 처리 필요 */
              $("#deleteModal").fadeIn();
              $(".btn").click(function(){
                $("#deleteModal").fadeOut();
                $("#resultModal2").fadeIn();
              $(".btn").click(function(){
                window.location.reload();
              });
              });
            }
          });
        });

      </script>
        
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>

<!-- 모달창 모아두는 곳 -->
<div class="ui mini modal" id="nameModal">
  <div class="content">
    <p class="title">이름을 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nickModal">
  <div class="content">
    <p class="title">닉네임을 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="idModal">
  <div class="content">
    <p class="title">아이디를 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="pwdModal">
  <div class="content">
    <p class="title">비밀번호를 입력해주세요.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="createModal">
  <div class="content">
    <p class="title">관리자를 등록하시겠습니까?</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
    <button class="ui button btn">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal">
  <div class="content">
    <p class="title">계정 등록이 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="nullModal">
  <div class="content">
    <p class="title">선택된 관리자가 존재하지 않습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="deleteModal">
  <div class="content">
    <p class="title">해당 관리자계정을 삭제하시겠습니까?</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
    <button class="ui button btn">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal2">
  <div class="content">
    <p class="title">계정 삭제가 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>