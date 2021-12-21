<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
      
      
         	<!-- 총 정산 금액 -->
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
		정산 할 수수료 : <fmt:formatNumber value="${total2 * 0.1}" pattern="\#,###.##"/><br>
			
		<%-- <fmt:formatNumber value="${total1  + total2}" pattern="\#,###.##"/><br> --%>
      
       <h3> 내역 </h3> 
        <form action="${ pageContext.servletContext.contextPath }/manager/classcal" method="get">
     		<input type="date" name="startDate" value="${ startDate }"> ~ <input type="date" name="endDate" value="${ endDate }"> &nbsp; &nbsp;
				 <select id="searchCondition" name="searchCondition" >
            	 <option value="">선택해주세요</option>
            	 <option value="1">아이디</option>
          	 	 <option value="2">강의</option>
         	 </select>&nbsp; &nbsp;
         	 <input type="search" id="searchValue" name="searchValue" value="${ searchValue }" placeholder="검색어를 입력해주세요">
    		 <button type="submit">검색하기</button>
		</form>
         
          <table class="ui basic table warningtable">
            <thead>
              <tr>
              	<th><input type="checkbox"></th>
                <th>결제 번호</th>
                <th>결제 날짜</th>
                <th>구매자</th>
                <th>결제 강의</th>
                <th>결제 금액</th>
                <th>수수료</th>
                <th>정산 금액(원)</th>
                <th>정산 여부</th>
              </tr>
            </thead>
            <tbody>
          	  <c:forEach var="cal" items="${ reviewContent }">
            	 <tr>
	            	<td><input class="check" type="checkbox"></td>
	                <td>${ cal.classPurcCode }</td>
	                <td>${ cal.paymentDTO.payDate }</td>
	                <td>${ cal.email }</td>
	                <td>${ cal.classDTO.title }</td>
	                <td class="payment">${ cal.classDTO.price }</td>
	                <td class="fees">${ cal.classDTO.price * 0.1 }</td>
	                <td>${ cal.classDTO.price * 0.9 }</td>
	                <td class="calYn">${ cal.status }</td>
         	    </tr>
             </c:forEach>
             
             <c:if test="${ !empty reviewContent }">
              <tr>
                <td colspan="5"><strong>총합계</strong></td>
                <td><strong class="paymentSum"></strong></td>
                <td><strong class="feesSum"></strong></td>
                <td><strong class="calSum"></strong></td>
                <td></td>
            </tr>
            </c:if>
            
             <c:if test="${ empty reviewContent }">
              <tr>
                <td colspan="9"><strong>조회 내역이 없습니다.</strong></td>
            </tr>
            </c:if>
            
            </tbody>
          </table>

			 <input class="calculate" type="submit" value="정산하기">
			 
			<jsp:include page="../common/Paging.jsp" />

        </div>
  	</div>
  	
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
         /*    $(function(){
              $(".calculate").click(function(e){

                let checkNum = $("input:checked").length;
                console.log(checkNum);
                
                let checkcal = $("document.getElementsByClassName('check')[8].checked");
                console.log(checkcal);
                
                e.preventDefault();

                if(!checkNum) {
                	// 선택 내역 없음
                  $("#checkModal").fadeIn();
                  $(".btn").click(function(){
                    $("#checkModal").fadeOut();
                  });
                  
                } else {
                
	            	$.ajax({
	                    url: "${ pageContext.servletContext.contextPath }/manager/classcal",
	                    type: "post", 
	                    data: {categoryCode : categoryCode},
	                    success: function(categoryName == "false") {
	                    	
	                    	 console.log(categoryName);
	                    } else {
	                    	$("#checkCategoryName").prop("placeholder", categoryName);
	                    	$("#changeName").attr('style', "display:block;");
	                    	$("#checkName").attr('disabled', false);
	                    	$('#checkName').val('');
	                    	} 
	                    },
	                    error: function(error) {
	                        console.log(error);
	                      }
	          		});
	          	});
	            }); */
	                	
                  /*  $("#calModal").fadeIn();
                   $(".btn").click(function(){
                    $("#calModal").fadeOut();
                      $("#resultModal").fadeIn();
                      $(".btn").click(function(){
                        window.location.reload();
                      });
                  });
                }
              });
            });  */
            
            $(function(){
                $(".calculate").click(function(e){
                
                	let check3 = document.getElementsByClassName('check');
                	var check4 = [];
                	
                	console.log(check3);
                	for(let i = 0; i < check3.length; i++){
                		if(check3[i].checked == true){
                			check4.push(check3[i].checked);
                		}else{
                			console.log("아님");
                		}
                		
                	}
                	
                	console.log(check4);
                });
            });
                

            // 완료된 정산 인풋박스 비활성화
            let finishcal = $(".check");
            
            let check1 = document.getElementsByTagName('tr');
            let check2 = document.getElementsByClassName('check');
            
           for(let i = 0; i < check1.length; i++ ){
        	   if(check1[i].children[8].getInnerHTML() == 'Y' ){
        		   check2[i-1].setAttribute("disabled",false)
        	   } else {
        		   console.log("good");
        	   }
         	  };
            
          /*  let select = document.getElementsByTagName('select');
           console.log(select); */
           
           	
           
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

<div class="ui mini modal" id="resultModal">
  <div class="content">
    <p class="title">정산 처리가 완료되었습니다.</p>
    <div class="re-modal-btn">
    <button id="result" class="ui button btn">확인</button>
  </div>
  </div>
</div>