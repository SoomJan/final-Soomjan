<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <title>카테고리 수정</title>

    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/managermain.css"
      rel="stylesheet"
    />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/manager/modifycategory.css"
      rel="stylesheet"
    />

  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />

    <div class="common-sidebar">
      <jsp:include page="../common/managersidebar.jsp" />
      <div class="sidebar-content">
        <h1>클래스 카테고리 수정</h1>
        <br /><br />
        <div class="modifycategory-left">
          <h4>현재 카테고리</h4>

          <table class="category-table">
            <thead>
              <tr>
                <td>카테고리 번호</td>
                <td>카테고리 이름</td>
              </tr>
            </thead>

            <tbody>
              <c:forEach var="category" items="${categoryList }">
                <tr>
                  <td>${ category.categoryCode }</td>
                  <td>${ category.categoryName }</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="modifycategory-right">
          <h4>추가할 카테고리</h4>
          <br />
          <form
            action="${ pageContext.servletContext.contextPath }/manager/modifycategory"
            method="POST"
          >
            <input
              type="text"
              placeholder="추가할 카테고리 이름"
              name="categoryName"
            />
            <button type="submit">추가하기</button>
          </form>
          <br /><br>          
 			<h4>수정할 카테고리</h4>
          <br />          



<form action="${ pageContext.servletContext.contextPath }/manager/changeCategory"  method="POST">
            <input
              type="number"
              placeholder="수정할 카테고리 코드"
              id="categoryCode" name="categoryCode"
            />
            <button type="button" onclick="checkCategoryCode()">입력하기</button>
          <script>
          $('#categoryCode').keyup(	function checkCategoryCode() {
          		let categoryCode = $('#categoryCode').val();
          		
          		$.ajax({
                    url: "${ pageContext.servletContext.contextPath }/manager/checkCategoryCode",
                    type: "post", 
                    data: {categoryCode : categoryCode},
                    success: function(categoryName) {
                    	/* alert(categoryName); */
                    	if(categoryName == "false"){
                    		$("#changeName").attr('style', "display:none;");
                        	$("#checkName").attr('disabled', true);

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
          
          </script>
          <br>
          <br>
            <div id="changeName" style="display:none">
      	    <input type="text" id="checkCategoryName" name="categoryName">
            <button type="submit" id="checkName" disabled>수정하기</button>
            </div>
         	 </form>
        </div>
      </div>
    </div>
  </body>

  <jsp:include page="../common/footer.jsp" />
</html>
