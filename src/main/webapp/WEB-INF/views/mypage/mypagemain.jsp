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

    <title>마이페이지 메인</title>

    <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagemain.css" rel="stylesheet"/>

    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
    <script src="resources/css/semantic/semantic.js"></script>
    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/css/bootstrap.js"></script>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/css/nav.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script ype="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
    <style>
    .warningtable tbody {text-align: center;} /* 누적경고 테이블 */

    .warningtable thead {background-color: #E3FFEC; text-align: center;}
    
    .introduce-detail img {width: 60%; height: 60%; text-align: center;} /* 내 정보 이미지 */

    p { font-weight: bold; font-size: 20px;}

    .myinfo{border-radius:10px; height:40px; width: 250px; font-size: 18px; padding-left: 15px; border: 2px solid #91C788 !important;} /* 내 정보 input */
    .modify_myinfo {width: 90px; height: 40px; background-color: #e2e2e2; border: none; border-radius: 10px; position: relative; left: 35%;} /* 수정하기 버튼 */
    #name {position: relative; left: 30%; text-align: left;} /* 내 정보 input */
    #email {position: relative; left: 21%; text-align: left;}
    #nickname { position: relative; left: 27%; text-align: left;}
    #phone { position: relative; left: 21%; text-align: left;}
    .introduce-detail1 > div > label {position: relative; left: 15%;} /* 내 정보 그룹 */

    .warningtable thead tr th {border-bottom: none !important;} /* 누적경고 테이블 */

      /* 회원탈퇴 모달창 */
    #endmodal { height: 600px; left: 40%; top: 20%; }
    .modal-header{text-align: center;}
    .modal-content{height: 540px;}
    .modal-content-text { border: 2px solid; padding: 3%; background-color: #91C788; border-color: #91C788;}
    .context-modal-btn { position: relative; left: 40%; top: 11%;}
    .inputpwd { width: 600px; height: 50px; color: gray; border: 3px solid #91c788; border-radius: 10px; padding-left: 2%; position: relative; left: 4%;}
    </style>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/mypagesidebar.jsp" />
      <div class="sidebar-content">
        <div class="introduce">
          <div class="introduce-detail">
            <img
              src="${ pageContext.servletContext.contextPath }/resources/images/redgrass.png"
            />
          </div>
          <div class="introduce-detail1">
            <div>
              <label for="name"><span>이름</span></label>
              <input type="text" class="myinfo" name="member_info" id="name" value="이지환" readonly>
          </div>

          <div>
              <label for="email"><span>이메일주소</span></label>
              <input type="text" class="myinfo" name="member_info" id="email" value="ljh2194@naver.com" readonly>
          </div>

          <div>
              <label for="nickname"><span>닉네임</span></label>
              <input type="text" class="myinfo" name="member_info" id="nickname" value="환잔디" readonly>
          </div>

          <div>
              <label for="phone"><span>핸드폰번호</span></label>
              <input type="text" class="myinfo" name="member_info" id="phone" value="010-1234-5678" readonly>
          </div>
          <br><br>
          <div>
            <button type="submit" class="modify_myinfo" onclick="modify_myinfo(this);">수정하기</button>
        </div>
          </div>
        </div>
        <div class="warn">
        </div>
        <div class="warining">
        <p>누적 경고 횟수</p>
        <table class="ui basic table warningtable">
          <thead>
            <tr>
              <th>날짜</th>
              <th>사유</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>2021.11.15</td>
              <td>멘토를 향한 욕설 및 협박</td>
            </tr>
            <tr>
              <td>2021.11.18</td>
              <td>멘토에게 심한 욕설</td>
            </tr>
          </tbody>
        </table>
      </div>
      </div>
    </div>
               <!-- 회원탈퇴 모달창 -->
               <div class="ui small modal" id="endmodal">
                <div class="header modal-header">회원탈퇴</div>
                <div class="content modal-content">
                  <br>
                  <p>회원탈퇴 안내사항</p>
                  <br>
                    <div class="modal-content-text">숨은잔디에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?<br>
                    그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!<br>
                    감사합니다. <br>
                    <br>
                    1. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않으며, <br>
                    &nbsp&nbsp 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.<br>
                    2. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.<br>
                    3. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.<br>
                    <hr>
                    <input type="text" class="inputpwd" value="현재 비밀번호">
                    </div>
                    <div class="context-modal-btn">
                      <button class="ui button btn" style="background-color: #91C788;">확인</button>
                      <button class="ui button btn">취소</button>
                    </div>
                </div>
              </div>
              <script>
                 function modify_myinfo(item) {
                  $('#endmodal').show();
                }
              </script>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
