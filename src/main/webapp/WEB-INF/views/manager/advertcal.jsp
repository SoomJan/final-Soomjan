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

    <title>광고 결제 내역</title>

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
      <h1 id="category"> 광고 결제 내역 </h1> <br>

      <h3> 내역 </h3> 
      <input type="date"> ~ <input type="date"> &nbsp; &nbsp;
      <input class="date-search" type="submit" value="검색하기">
    
          <table class="ui basic table warningtable">
            <thead>
              <tr>
                <th>결제 날짜</th>
                <th>멘토 이메일</th>
                <th>결제 금액</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>2021-11-24</td>
                <td>gsp@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td>2021-11-24</td>
                <td>yhj@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td>2021-11-24</td>
                <td>osb@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td>2021-11-24</td>
                <td>ysm@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td>2021-11-24</td>
                <td>lsh@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td>2021-11-24</td>
                <td>ljh@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td>2021-11-24</td>
                <td>iyr@gmail.com</td>
                <td class="payment">30,000</td>
              </tr>
              <tr>
                <td><strong>총합계</strong></td>
                <td></td>
                <td><strong class="paymentSum">210,000</strong></td>
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
