<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>

    <title>클래스 결제 내역</title>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="main-content">
      <h1 id="category"> 클래스 정산 완료 내역 </h1> <br>
      
      
         	<%-- <!-- 총 정산 금액 -->
      		<c:set var = "total" value = "0" />
			<c:forEach var="result" items="${allContent}" varStatus="status">     
			<c:set var= "total" value="${total + result.classDTO.price}"/>
			</c:forEach>
			
         	<!-- 정산된 금액 -->
      		<c:set var = "total1" value = "0" />
			<c:forEach var="result" items="${yContent}" varStatus="status">     
			<c:set var= "total1" value="${total1 + result.classDTO.price}"/>
			</c:forEach>
			
         	<!-- 정산할 금액 -->
      		<c:set var = "total2" value = "0" />
			<c:forEach var="result" items="${nContent}" varStatus="status">     
			<c:set var= "total2" value="${total2 + result.classDTO.price}"/>
			</c:forEach>
			
			
 			
			
		총 금액 : <fmt:formatNumber value="${total * 1.0}" pattern="\#,###.##"/> <br>
		총 정산 금액 : <fmt:formatNumber value="${total * 0.9}" pattern="\#,###.##"/><br>
		총 수수료 : <fmt:formatNumber value="${total * 0.1}" pattern="\#,###.##"/><br>
			
		정산된 금액 : <fmt:formatNumber value="${total1 * 0.9}" pattern="\#,###.##"/><br>
		정산된 수수료 : <fmt:formatNumber value="${total1 * 0.1}" pattern="\#,###.##"/><br>
			
		정산 할 금액 : <fmt:formatNumber value="${total2 * 0.9}" pattern="\#,###.##"/><br>
		정산 할 수수료 : <fmt:formatNumber value="${total2 * 0.1}" pattern="\#,###.##"/><br> --%>
			
		<%-- <fmt:formatNumber value="${total1  + total2}" pattern="\#,###.##"/><br> --%>
      
       <h3> 내역 </h3> 
        <form action="${ pageContext.servletContext.contextPath }/manager/finishcal" method="get">
     		<input type="date" name="startDate" value="${ startDate }"> ~ <input type="date" name="endDate" value="${ endDate }"> &nbsp; &nbsp;
				 <select id="searchCondition" name="searchCondition" >
            	 <option value="">선택해주세요</option>
            	 <option value="1">구매자</option>
          	 	 <option value="2">강의</option>
         	 </select>&nbsp; &nbsp;
         	 <input type="search" id="searchValue" name="searchValue" value="${ searchValue }" placeholder="검색어를 입력해주세요">
    		 <button type="submit">검색하기</button>
		</form>
         
          <table class="ui basic table warningtable">
            <thead>
              <tr>
                <th>결제 번호</th>
                <th>결제 날짜</th>
                <th>구매자</th>
                <th>결제 강의</th>
                <th>결제 금액</th>
                <th>수수료</th>
                <th>정산 금액(원)</th>
              </tr>
            </thead>
            <tbody>
          	  <c:forEach var="cal" items="${ reviewContent }">
            	 <tr class="calClass">
	                <td>${ cal.classPurcCode }</td>
	                <td>${ cal.paymentDTO.payDate }</td>
	                <td>${ cal.email }</td>
	                <td>${ cal.classDTO.title }</td>
	                <td class="payment"><fmt:formatNumber value="${cal.classDTO.price}" pattern="\#,###.##"/></td>
	                <td class="fees"><fmt:formatNumber value="${cal.classDTO.price * 0.1}" pattern="\#,###.##"/></td>
	                <td><fmt:formatNumber value="${cal.classDTO.price * 0.9}" pattern="\#,###.##"/></td>
         	    </tr>
             </c:forEach>
             
             <c:if test="${ !empty reviewContent }">
              <tr>
                <td colspan="4"><strong>총합계</strong></td>
                <td><strong class="paymentSum"></strong></td>
                <td><strong class="feesSum"></strong></td>
                <td><strong class="calSum"></strong></td>
            </tr>
            </c:if>
            
             <c:if test="${ empty reviewContent }">
              <tr>
                <td colspan="9"><strong>조회 내역이 없습니다.</strong></td>
            </tr>
            </c:if>
            
            </tbody>
          </table>

			 
			<jsp:include page="../common/Paging.jsp" />

        </div>
  	</div>
  	
  	 <script>
  	 	
            /* 결제 금액 합계 구하기 */
            let payment = $(".payment")

            let sum = 0;
            for(let i = 0; i < payment.length; i++) {
              let value = payment[i].getInnerHTML().replace(",","").replace("\\","");

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
              let value = fees[i].getInnerHTML().replace(",","").replace("\\","");

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

            
            
        	$(function(){
          		$(".calClass").click(function(e){
          			
          			if($(e.target).parent().children()[7].innerText == 'N'){
          			
					 $("#calClass").show();	
					 const classCode = $(e.target).parent().children()[0].innerText;
					 const calDate = $(e.target).parent().children()[1].innerText;
					 const buyEmail = $(e.target).parent().children()[2].innerText;
					 const buyLecture = $(e.target).parent().children()[3].innerText;
					 const calPay = $(e.target).parent().children()[4].innerText;
					 const calFee = $(e.target).parent().children()[5].innerText;
					 const afterPay = $(e.target).parent().children()[6].innerText;
					 
					 console.log(classCode);
					 console.log(calDate);
					 console.log(buyEmail);
					 console.log(buyLecture);
					 console.log(calPay);
					 console.log(calFee);
					 console.log(afterPay);
					 
					 $('#modal_date').empty();
					 $('#modal_email').empty();
					 $('#modal_lecture').empty();
					 $('#modal_pay').empty();
					 $('#modal_fee').empty();
					 $('#modal_after').empty();
					 
					 $('#clanum').prepend(classCode);
					 $('#modal_date').append(calDate);
					 $('#modal_email').append(buyEmail);
					 $('#modal_lecture').append(buyLecture);
					 $('#modal_pay').append(calPay);
					 $('#modal_fee').append(calFee);
					 $('#modal_after').append(afterPay);
					 
					 
					 // value 값 넣기
					 $('.clanum').attr("value",classCode);
					 $('.purEmail').attr("value",buyEmail);
					 	
					 	//fmt 형태 int로 변환
					 	let calFee1 = calFee.replace("\\","").replace(",","");
					 $('.purFees').attr("value",calFee1);
					 
					 console.log(calFee1);
					 
					 $("#cancel-btn").click(function(e){
						 
						 $("#calClass").hide();		
					 });
					 
          			}else {
          				console.log("이미 존재")
          			}
          		}); 
          	});
          </script>
  	
  	
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
    <p class="title">정산 처리가 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button class="ui button btn">확인</button>
  </div>
  </div>
</div>

<div class="ui mini modal" id="resultModal" >
  <div class="content">
    <p class="title">정산 처리가 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button id="result" class="ui button btn">확인</button>
  </div>
  </div>
</div>


<!-- 정산 자세히 보기 모달 -->
<div class="ui mini modal" id="calClass" >
<form action="${ pageContext.servletContext.contextPath }/manager/classcal" method="post">
  <div class="content" style="height:auto;">
   구매 강의 : <p id="modal_lecture"></p>
   구매 날짜 : <p id="modal_date"></p>
   구매자 :  <p id="modal_email"></p>
   구매 가격 :  <p id="modal_pay"></p>
   구매 수수료 :  <p id="modal_fee"></p>
   정산 가격 :  <p id="modal_after"></p>
   <input type="hidden" name="classPurchaseCode" class="clanum">
   <input type="hidden" name="email" class="purEmail">
   <input type="hidden" name="fees" class="purFees">
    <div class="re-modal-btn">
    <button id="result" type="submit" class="ui button btn">확인</button>
    <button type="button" id="cancel-btn" class="ui button btn">취소</button>
  	</div>
  </div>
  </form>
</div>