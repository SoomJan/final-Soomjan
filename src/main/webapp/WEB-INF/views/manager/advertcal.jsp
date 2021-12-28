<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="author" content="" />

    <title>광고 결제 내역</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/manager.css"
      rel="stylesheet"
    />

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
    
          <table class="ui basic table warningtable">
            <thead>
              <tr>
                <th>결제 날짜</th>
                <th>멘토 닉네임</th>
                <th>멘토 이메일</th>
                <th>결제 금액</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="ad" items="${ purchaseAd }">
            	 <tr class="calClass">
            	 	<td>${ad.paymentDTO.payDate }</td>
            	 	<td>${ad.paymentDTO.owner }</td>
            	 	<td>${ad.email }</td>
            	 	<td class="payment">300,000<td>
         	    </tr>
             </c:forEach>
              <tr>
                <td><strong>총합계</strong></td>
                <td></td>
                <td></td>
                <td><strong class="paymentSum"></strong></td>
            </tr>
            </tbody>
          </table>
			<form action="${ pageContext.servletContext.contextPath }/manager/advertcal" method="get">
    			<div style="width:30%; height:60px; margin:0 auto;">
    			<input  type="search" style="width:70%; border:1px solid black; border-radius:30px; padding:10px; height:30px;" id="searchValue" name="searchValue">
    			 <button type="submit" style="border:none; padding:5px;"> 검색하기</button>
				<input name="searchCondition" style="display:none" value="1">
    			 </div>
			</form>

         

			<jsp:include page="../common/Paging.jsp" />
        </div>
      </div>
  </body>
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
  <jsp:include page="../common/footer.jsp" />
</html>