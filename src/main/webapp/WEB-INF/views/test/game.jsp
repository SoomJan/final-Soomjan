<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/semantic/test.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 
 <script>
   		 $( document ).ready(function() {
   		$("tr").click(function(event){

		  console.log(event.target.children);
		  
			let mine = event.target.children[0];
			
		 	console.log(mine);
			 mine.style.color = "red";
   	      
   			});
   		}); 
   		
   		/* function opentd(){
		let mine = event.target.children[0];
		let min = event.target;
			
		 	console.log(mine);
			  mine.style.color = "red";
			 /* min.style.backgroundColor = "red";
   		};  */
    	</script>
    	 </head>
  <body>
    	<h1>지뢰찾기 게임</h1>
    	
    	<table>
    	<c:forEach var="arr" items="${ arr }">
    	<tr>
    		<c:forEach var="arr2" items="${ arr }">
    			<td class="td">
					<h4 class="mine">${ arr2 }</h4>    		
    			</td>
    		</c:forEach>
    	</tr>
    	</c:forEach>
    	</table>
    	
    	
   		
  </body>
</html>
