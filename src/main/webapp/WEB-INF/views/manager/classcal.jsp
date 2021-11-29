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

    <title>클래스 결제 내역</title>

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
    <link rel="stylesheet" type="text/css" href="resources/css/semantic/semantic.css">
    <script src="resources/css/semantic/semantic.js"></script>
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
      <h1 id="category"> 클래스 결제 내역 </h1> <br>

      <h3> 내역 </h3> 
      <input type="date"> ~ <input type="date"> &nbsp; &nbsp;
      <input class="date-search" type="submit" value="검색하기">
    
          <table class="ui basic table warningtable">
            <thead>
              <tr>
                <th><input class="all" type="checkbox"></th>
                <th>결제 날짜</th>
                <th>이메일</th>
                <th>결제 금액</th>
                <th>수수료</th>
                <th>정산 금액(원)</th>
                <th>정산 여부</th>
                <th>정산 관리자</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td></td>
                <td>2021-11-24</td>
                <td>gsp@gmail.com</td>
                <td class="payment">300,000</td>
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">Y</td>
                <td>호날두</td>
              </tr>
              <tr>
                <td></td>
                <td>2021-11-24</td>
                <td>yhj@gmail.com</td>
                <td class="payment">300,000</td>
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">Y</td>
                <td>호날두</td>
              </tr>
              <tr>
                <td></td>
                <td>2021-11-24</td>
                <td>osb@gmail.com</td>
                <td class="payment">300,000</td>  
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">Y</td>
                <td>호날두</td>
              </tr>
              <tr>
                <td><input class="check" type="checkbox"></td>
                <td>2021-11-24</td>
                <td>ysm@gmail.com</td>
                <td class="payment">300,000</td>
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">N</td>
                <td>호날두</td>
              </tr>
              <tr>
                <td><input class="check" type="checkbox"></td>
                <td>2021-11-24</td>
                <td>lsh@gmail.com</td>
                <td class="payment">300,000</td>
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">N</td>
                <td>메시</td>
              </tr>
              <tr>
                <td><input class="check" type="checkbox"></td>
                <td>2021-11-24</td>
                <td>ljh@gmail.com</td>
                <td class="payment">300,000</td>
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">N</td>
                <td>메시</td>
              </tr>
              <tr>
                <td><input class="check" type="checkbox"></td>
                <td>2021-11-24</td>
                <td>iyr@gmail.com</td>
                <td class="payment">300,000</td>
                <td class="fees">30,000</td>
                <td>270,000</td>
                <td class="calYn">N</td>
                <td>메시</td>
              </tr>
              <tr>
                <td colspan="3"><strong>총합계</strong></td>
                <td><strong class="paymentSum"></strong></td>
                <td><strong class="feesSum">210,000</strong></td>
                <td><strong class="calSum">1,890,000</strong></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
          </table>

          <script>
 
            /* 결제 금액 합계 구하기 */
            let payment = $(".payment")

            let sum = 0;
            for(let i = 0; i < payment.length; i++) {
              let value = payment[i].getInnerHTML().replace(",","");

              let parseValue = parseInt(value);
              sum += parseValue;
            }

            console.log(sum);
            paymentSum = sum.toLocaleString();
            console.log(paymentSum);

            $(".paymentSum").html(paymentSum);

            /* 수수료 합계 구하기 */
            let fees = $(".fees")

            let sum2 = 0;
            for(let i = 0; i < fees.length; i++) {
              let value = fees[i].getInnerHTML().replace(",","");

              let parseValue = parseInt(value);
              sum2 += parseValue;
            }

            console.log(sum2);
            feesSum = sum2.toLocaleString();
            console.log(feesSum);

            $(".feesSum").html(feesSum);

            /* 정산 금액 합계 구하기 */
            let calSum = sum - sum2;
            console.log(calSum);

            $(".calSum").html(calSum.toLocaleString());

            /* 전체선택, 전체 취소 */
            $("this").ready(function(){
              $(".all").click(function(){
                if($(".all").prop("checked")) {
                  $(".check").prop("checked", true);
                } else {
                  $(".check").prop("checked", false);
                }
              });
            });

            /* 정산하기 버튼 모달 처리 */
            $(function(){
              $(".calculate").click(function(e){

                let checkNum = $("input:checked").length;
                console.log(checkNum);
                e.preventDefault();

                if(!checkNum) {
                  $("#checkModal").fadeIn();
                  $(".btn").click(function(){
                    $("#checkModal").fadeOut();
                  });
                } else {
                  $("#calModal").fadeIn();
                  /* 취소 버튼 누르면 창이 꺼지고, 확인 버튼을 눌러야 데이터가 넘어가도록 추후에 처리 필요 */
                  $(".btn").click(function(){
                    $("#calModal").fadeOut();
                      $("#resultModal").fadeIn();
                      $(".btn").click(function(){
                        window.location.reload();
                      });
                  });
                }
              });
            });

          </script>

          <div class="manager-search">
            <form class="manager-searchbox" method="post">
              <input type="text" />
              <button type="submit">
                <img
                  src="${ pageContext.servletContext.contextPath }/resources/images/redgrass.png"
                />
              </button>
            </form>
          </div>
          <input class="calculate" type="submit" value="정산하기">
          <div>
            <div class="manager-paging">
              <ul>
                <li><a href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">next</a></li>
              </ul>
            </div>
          </div>

        </div>
      </div>
    </div>
  </body>
  <jsp:include page="../common/footer.jsp" />
</html>
<!-- 모달창 모아두는 곳 -->
<div class="ui mini modal" id="checkModal">
  <div class="content">
    <p class="title">선택하신 내역이 존재하지 않습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="calModal">
  <div class="content">
    <p class="title">N개의 내역이 정산처리 됩니다. 진행하시겠습니까?</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
    <button class="ui button btn">취소</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal">
  <div class="content">
    <p class="title">정산 처리가 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button id="result" class="ui button btn">확인</button>
  </div>
  </div>
</div>