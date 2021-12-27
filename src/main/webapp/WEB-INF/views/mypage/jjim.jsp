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

        <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet" />
        <link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/jjim.css" rel="stylesheet" />

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
            color: #00811e !important;
          }

          .jjimcheck {
            position: relative;
            left: 40px;
          }

          #delete2modal {
            height: 150px;
            top: 40%;
            left: 47%;
          }

          #nullmodal {
            height: 150px;
            top: 40%;
            left: 47%;
          }

          #notmodal {
            height: 150px;
            top: 40%;
            left: 47%;
          }
          
          .dropsearch {margin-left: 14%;}

          .finish-go {color: #52734D !important;}
        </style>
      </head>

      <body>
        <jsp:include page="../common/nav.jsp" />
        <div class="common-sidebar">
          <jsp:include page="../common/mypagesidebar.jsp" />
          <div class="sidebar-content">
            <p class="taking-title">찜한 클래스</p>
            <br>
            <div class="dropsearch">
              <form action="${ pageContext.servletContext.contextPath }/mypage/jjim" method="get">
                <input type="hidden" name="currentPage" value="1" />
                <select class="ui dropdown" id="searchCondition" name="searchCondition">
                  <option value="1">카테고리</option>
                  <option value="2">클래스명</option>
                  <option value="3">잔디 닉네임</option>
                </select>
                <div class="ui search">
                  <div class="ui icon input pro">
                    <input class="prompt" type="search" name="searchValue" value="<c:out value="${
                      sessionScope.selectCriteria.searchValue }" />">
                    <button id="searchbtn" style="border: none; background:none; position: relative; right: 18%;"><img
                        src="${ pageContext.servletContext.contextPath }/resources/images/search.png"
                        style="width:25px;"></button>
                  </div>
                  <div class="results"></div>
                </div>
            </div>
            </form>
            <br><br><br><br><br>

            <c:choose>
                <c:when test="${ empty jjimList }">
                  <div class="unlist-text">
                    찜한 클래스가 없거나, 조회된 결과가 없습니다.
                    <br><br><br>
    <a href="${ pageContext.servletContext.contextPath }/findclass/findAllClassMain" class="finish-go"><u>클래스 찜하러가기</u></a>
                  </div>
                </c:when>
                <c:when test="${ not empty jjimList }">

            <table class="ui single line table jjimtable">
              <thead>
                <tr>
                  <th colspan="3">클래스정보</th>
                  <th id="th1"><a class="onButton" id="deletebtn">삭제하기</a></th>
                  <th id="th2" style="display: none;"><a class="onButton" id="returnbtn">되돌리기</a></th>
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
                        src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ jjimList[size].filePath }">
                    </td>
                    <td>
                      <p class="class-title">${ jjimList[size].title }</p>${ jjimList[size].categoryName }
                    </td>
                    <td>${ jjimList[size].nickName }</td>
                  </tr>

                  <script>

                    /* 마우스 커서 이벤트 */
                    $(function() {
                      $(".classInfo${ size + 1 }").hover(
                        function () {
                          $(this).css("color", "green").css("cursor", "pointer");
                        },
                        function () {
                          $(this).css("color", "black").css("cursor", "default");
                        }
                      );
                    });

                    /* 클릭시 클래스 정보로 이동 */
                    $(function() {
                      
                      $(".classInfo${ size + 1 }").click(function () {
                        
                        let isDeleted = "${ jjimList[size].isDeleted }";

                        if(isDeleted == "N") {
                          location.href = "${ pageContext.servletContext.contextPath }/findclass/class/classRoom?classCode=${ jjimList[size].classCode }";
                      } else {
                        $("#notmodal").fadeIn();
                        $(".btn").click(function() {
                          $("#notmodal").fadeOut();
                        });
                      }
                      });
                    });

                    /* 삭제하기 버튼 클릭 */
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

                        /* 클래스 삭제 버튼 보여주기 */
                        $("#deleteClass").css("display", "");
                      });
                    });

                    /* 되돌리기 버튼 클릭 */
                    $(function() {
                      $("#returnbtn").click(function() {

                        /* 기존에 있던 마우스 커서 이벤트 재생 */
                        $(".classInfo${ size + 1 }").hover(
                        function () {
                          $(this).css("color", "green").css("cursor", "pointer");
                        },
                        function () {
                          $(this).css("color", "black").css("cursor", "default");
                        }
                      );

                      /* 기존에 있던 마우스 클릭 이벤트 재생 */
                      $(".classInfo${ size + 1 }").click(function () {

                        let isDeleted = "${ jjimList[size].isDeleted }";

                        if(isDeleted == "N") {
                          location.href = "${ pageContext.servletContext.contextPath }/findclass/class/classRoom?classCode=${ jjimList[size].classCode }";
                        } else {
                        $("#notmodal").fadeIn();
                        $(".btn").click(function() {
                          $("#notmodal").fadeOut();
                        });
                        }
                      });

                        /* 되돌리기 버튼 -> 삭제하기 버튼으로 */
                        $("#th1").css("display", "");
                        $("#th2").css("display", "none");

                        /* 체크박스 버튼 숨기기 */
                        $(".label${ size + 1 }").css("display", "none");

                        /* 클래스 삭제 버튼 숨기기 */
                        $("#deleteClass").css("display", "none");
                      });
                    });
                  </script>

                </c:forEach>
              </tbody>
            </table>
            
            <script>
              $(function () {
                /* 찜 취소하기 */
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

                  /* 빈값 체크 */
                  if(!classNo) {
                    $("#nullmodal").fadeIn();
                    $(".btn").click(function() {
                      $("#nullmodal").fadeOut();
                    });
                  } else {

                  $.ajax({
                    url: "${ pageContext.servletContext.contextPath }/mypage/jjimCancel",
                    type: "post",
                    data: { classNo: classNo },
                    success: function (data) {
                      if (data == "true") {
                        $("#delete2modal").fadeIn();
                        $(".btn").click(function() {
                          location.href="${ pageContext.servletContext.contextPath }/mypage/jjim"
                        });
                      } else {
                        $("#deletemodal").fadeIn();
                        $(".btn").click(function() {
                          $("#deletemodal").fadeOut();
                        });
                      }
                    },
                    error: function (error) {
                      console.log(error);
                    }
                  });
                }
                return false;
                });
              });

              /* 마우스 커서 이벤트 */
              $(function(){
                $(".onButton").hover(
                  function () {
                    $(this).css("color", "black").css("cursor", "pointer");
                  },
                  function () {
                    $(this).css("color", "white").css("cursor", "default");
                  }
                );      
              });

              /* 검색 조건 유지 */
              $(function(){
              $("#searchCondition").val("${ selectCriteria.searchCondition }");
              });


            </script>
            <input id="deleteClass" class="onButton" type="button" value="클래스 삭제" style="float: right; display: none;">
            <jsp:include page="../common/Paging.jsp" />
          </c:when>
        </c:choose>

          </div>
        </div>
        <!-- 클래스 종료 안내 모달창 -->
        <div class="ui mini modal" id="notmodal">
          <div class="content deletecontent">
            <p class="delete-content-title">삭제된 클래스입니다.</p>
            <div class="re-modal-btn">
              <button class="ui button btn">확인</button>
            </div>
          </div>
        </div>
        <!-- 삭제 실패 모달창 -->
        <div class="ui mini modal" id="deletemodal">
          <div class="content deletecontent">
            <p class="delete-content-title">클래스 삭제에 실패하였습니다.</p>
            <div class="re-modal-btn">
              <button class="ui button btn">확인</button>
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
        <!-- 빈값 체크 모달창 -->
        <div class="ui mini modal" id="nullmodal">
          <div class="content deletecontent">
            <p class="delete-content-title">체크된 클래스가 존재하지 않습니다.</p>
            <div class="re-modal-btn">
              <button class="ui button btn">확인</button>
            </div>
          </div>
        </div>
      </body>
      <jsp:include page="../common/footer.jsp" />

      </html>

  