<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>찜한 클래스</title>

        <link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
        <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet" />
        <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/jjim.css" rel="stylesheet" />

        <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />
        <link rel="stylesheet" type="text/css"
          href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css">
        <script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript"
          src="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.js"></script>
        <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/nav.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
        <style>
          .jjimtable thead tr {
            text-align: center;
          }

          /* 찜한 클래스 테이블 */
          .jjimtable tbody tr td {
            text-align: center;
            vertical-align: middle;
          }

          .jjimtable thead tr th a {
            color: gray !important;
          }

          .jjimcheck {
            position: relative;
            left: 40px;
          }

          /* 체크박스 */
          #delete2modal {
            height: 150px;
            top: 40%;
            left: 47%;
          }
        </style>
      </head>

      <body>
        <jsp:include page="../common/nav.jsp" />
        <div class="common-sidebar">
          <jsp:include page="../common/mypagesidebar.jsp" />
          <div class="sidebar-content">
            <p class="taking-title">찜한 클래스</p>
            <br><br>
            <div class="dropsearch">
              <form action="${ pageContext.servletContext.contextPath }/mypage/jjim" method="get">
                <input type="hidden" name="currentPage" value="1" />
                <select class="ui dropdown" name="searchCondition">
                  <option value="1">카테고리</option>
                  <option value="2">클래스명</option>
                  <option value="3">잔디 닉네임</option>
                </select>
                <div class="ui search">
                  <div class="ui icon input pro">
                    <input class="prompt" type="search" name="searchValue" value="<c:out value=" ${
                      sessionScope.selectCriteria.searchValue }" />">
                    <button id="searchbtn" style="border: none; background:none; position: relative; right: 18%;"><img
                        src="${ pageContext.servletContext.contextPath }/resources/images/search.png"
                        style="width:25px;"></button>
                  </div>
                  <div class="results"></div>
                </div>
            </div>
            </form>
            <!-- <div class="unlist-text">
  찜한 클래스가 없습니다.<br>
  새로운 클래스를 추가해주세요.
</div> -->
            <br>
            <table class="ui single line table jjimtable">
              <thead>
                <tr>
                  <th colspan="3">클래스정보</th>
                  <th id="th1"><a id="deletebtn">삭제하기</a></th>
                  <th id="th2" style="display: none;"><a id="deletebtn2">되돌리기</a></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="size" begin="0" end="${ fn:length(jjimList)-1 }">
                  <tr class="classInfo${ size + 1 }">
                    <td>
                      <div class="ui checked checkbox jjimcheck"><input type="checkbox" class="check"><input
                          id="deleteCheck" type="hidden" value="${ jjimList[size].classCode }">
                        <label class="label${ size + 1 }" style="display: none;"></label>
                      </div>
                    </td>
                    <td class="imgtd"><img
                        src="${ pageContext.servletContext.contextPath }/resources/images/${ jjimList[size].filePath }">
                    </td>
                    <td>
                      <p class="class-title">${ jjimList[size].title }</p>${ jjimList[size].categoryName }
                    </td>
                    <td>${ jjimList[size].nickName }</td>
                  </tr>

                  <script>

                    /* 마우스 커서 이벤트 */
                    $(function () {
                      $(".classInfo${ size + 1 }").hover(
                        function () {
                          $(this).css("color", "green").css("cursor", "pointer");
                        },
                        function () {
                          $(this).css("color", "black").css("cursor", "default");
                        }
                      );
                    });

                    /* 클릭시 클래스 인포로 이동 */
                    $(function () {
                      $(".classInfo${ size + 1 }").click(function () {
                        location.href = "${ pageContext.servletContext.contextPath }/mypage/class/classRoom?classCode=${ jjimList[size].classCode }";
                      });
                    });

                    /* 삭제하기 버튼 클릭시 체크박스 생성 */
                    $(function () {
                      $("#deletebtn").click(function () {
                        /* 기존에 있던 마우스 이벤트들 제거 */
                        $(".classInfo${ size + 1 }").off("click");
                        $(".classInfo${ size + 1}").off("mouseenter mouseleave");

                        /* 삭제하기 버튼 -> 되돌리기 버튼으로 */
                        $("#th1").css("display", "none");
                        $("#th2").css("display", "");

                        /* 체크박스 버튼 보여주기 */
                        $(".label${ size + 1 }").css("display", "");
                      });
                    });

                  </script>

                </c:forEach>
              </tbody>
            </table>

            <script>
              $(function () {
                /* 삭제하기 */
                $("#deleteClass").click(function () {

                  let classNo = "";

                  $(".check").each(function (el, index) {
                    console.log(el);
                    console.log(index);
                    console.dir($(index).prop("checked"));

                    if ($(index).prop("checked")) {
                      classNo += $(index).next().val() + ",";
                    }
                  });
                  console.log(classNo);

                  $.ajax({
                    url: "${ pageContext.servletContext.contextPath }/mypage/jjimCancel",
                    type: "post",
                    data: { classNo: classNo },
                    success: function (data) {
                      if (!data) {
                        alert("삭제 실패!");
                      } else {
                        alert("삭제 성공");
                      }
                    },
                    error: function (error) {
                      console.log(error);
                    }
                  });
                });

              });


            </script>
            <input id="deleteClass" type="button" value="클래스 삭제">
            <input type="button" value="되돌리기">
            <jsp:include page="../common/Paging.jsp" />
          </div>
        </div>
        <!-- 삭제 버튼 모달창 -->
        <div class="ui mini modal" id="deletemodal">
          <div class="content deletecontent">
            <p class="delete-content-title">체크한 클래스를 찜한 클래스<br> 목록에서 삭제하시겠습니까?</p>
            <div class="re-modal-btn">
              <button class="ui button btn conbtn">확인</button>
              <button class="ui button btn">취소</button>
            </div>
          </div>
        </div>
        <!-- 삭제완료 -->
        <div class="ui mini modal" id="delete2modal">
          <div class="content deletecontent">
            <p class="delete-content-title">찜한 클래스 목록에서<br> 삭제가 완료되었습니다.</p>
            <div class="re-modal-btn">
              <button class="ui button btn">확인</button>
            </div>
          </div>
        </div>
        <!-- <script>
    $('#deletebtn').click(function(){
      $('#deletemodal').show();
    }); 
    
    $('.conbtn').click(function(){
        $('#delete2modal').show();
      }); 
    </script> -->
      </body>
      <jsp:include page="../common/footer.jsp" />

      </html>