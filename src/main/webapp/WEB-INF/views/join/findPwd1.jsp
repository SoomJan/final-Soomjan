<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>비밀번호 찾기</title>

   <link href="${ pageContext.servletContext.contextPath }/resources/css/findPwd.css?" rel="stylesheet" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css"
    />
  </head>

  <body>
    <jsp:include page="../common/nav.jsp" />

    <main class="fullJoin">
       
        <div class="head">
            <div class="thumbnail" id="timage"><img src="${ pageContext.servletContext.contextPath }/resources/images/Logo3.png" style="width: 60px; height: 60px; "></div>
            <div class="thumbnail" id="ttext">비밀번호 찾기 </div>
        </div>
 
        <br><br><br><br>
        <form method="post" id="submitForm"> 
        <div class="content">
            <div class="title">이름</div>
            <input type="text" placeholder="이름을 입력하세요" name="name" id="name">
        </div>

        <br><br>
        
        <div class="content">
            <div class="title">이메일</div>
            <input type="text" placeholder="이메일을 입력하세요" name="email" id="email" style="margin-left: 47px;">
        </div>

       
        <br><br><br><br><br><br><br><br>
        <div style="position: relative; left: 35%; bottom: 90px;" class="pwdbtn">
            <button type="button" onclick="return finishbtn()">확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button>
        </div>
      </form>

        <script>

          function finishbtn() {

            let name = $("#name").val();
            let email = $("#email").val();

            if(!name) {
              showModal("이름을 입력해주세요.");
            } else if(!email) {
              showModal("이메일을 입력해주세요.");
            } else {
              
              $.ajax({
                url: "${ pageContext.servletContext.contextPath }/member/findPwd",
                type: "post",
                data: {name : name, email : email},
                success: function(data) {
                  if(data == "true") {
                    $("#nextModal").fadeIn();
                    $(".btn").click(function () {
                      $("#submitForm")
                      .attr("action", "${ pageContext.servletContext.contextPath }/member/findPwd2").submit();
                    });
                  } else {
                    showModal("찾으시는 이메일이 존재하지 않습니다.");
                  }
                },
                error: function(error) {
                  console.log(error);
                }
              });
            }
            return false;
          }

          /* 모달창 띄워주는 함수 */
        function showModal(str) {
            $("#modalTitle").html(str);
            $("#Modal").fadeIn();
              $(".btn").click(function () {
                $("#Modal").fadeOut();
              });
          };
        </script>

    </main>

    <jsp:include page="../common/footer.jsp" />
  </body>
</html>

<!-- 모달창 모아두는 곳 -->

<div class="ui mini modal" id="Modal">
  <div class="contents">
    <p class="titles" id="modalTitle"></p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>

<div class="ui mini modal" id="nextModal">
  <div class="contents">
    <p class="titles" id="modalTitle">이메일 정보가 확인되었습니다.</p>
    <div class="re-modal-btn">
      <button class="ui button btn">확인</button>
    </div>
  </div>
</div>