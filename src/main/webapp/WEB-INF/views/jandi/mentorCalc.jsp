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

<title>정산 내역</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

<script src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"  src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
a{
	color:black;
}
p {
	font-weight: bold;
	font-size: 20px;
}

.border-1px-black{
	margin-top:10px;
	margin-bottom: 10px;
}

.learnTable thead {
   background-color: #e3ffec;
   text-align: center;   
  }

.learnTable tbody {
   text-align: center;   
  }
  
.learnTable tfoot{
   text-align: center;  
 }
 
.learnTable tfoot th{
   font-weight: bold;
 }
 
table{
	text-align: center;
}

.title-div h3{
	float:left;
}


</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
		
			<div class="title-div">
				<h3>정산 계좌</h3>
				<br>
				<button type="button" style="border:none; background: none; padding:1px; float:right;"
						data-toggle="modal" data-target="#messageModal"><b>정산 계좌 수정은 어떻게 하나요?</b></button>
			</div>
			<br>
			
			<hr class="border-1px-black" />
			
			<div class="account" style="padding-left:30px;">
				<h4>은행 : 우리 은행</h4>
				<h4>계좌 : 1002-111-153***</h4>
				<h4>예금주 : 오잔디</h4>
			</div>
			<br><br>
			
			<div class="title-div">
				<h3>정산 내역</h3>
				<div style="float:right;">
					<input type="date"> ~ <input type="date">
					<button type="button" style="border:none; background: none; padding:5px; font-size: 15px;" ><b>조회</b></button>
				</div>
			</div>
			<br><br>
			<hr class="border-1px-black" />
			<table class="ui basic table learnTable" style="width:100%;">
				<thead>
					<tr>
						<th width="50">정산 날짜</th>
						<th width="10">수익</th>
						<th width="10">수수료</th>
						<th width="20">정산 금액(원)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-09-30</td>
						<td>50,000</td>
						<td>1,500</td>
						<td>48,500</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th>총 합계</th>
						<th>50,000</th>
						<th>1,500</th>
						<th>48,500</th>
					</tr>
				</tfoot>
			</table>
			
			<br><br>
			<div class="title-div">
				<h3>광고 결제 내역</h3>
				<div style="float:right;">
					<input type="date"> ~ <input type="date">
					<button type="button" style="border:none; background: none; padding:5px; font-size: 15px;" ><b>조회</b></button>
				</div>
			</div>
			<br><br>
			<hr class="border-1px-black" />
			<table class="ui basic table learnTable" style="width:100%;">
				<thead>
					<tr>
						<th width="30">결제 날짜</th>
						<th width="50">클래스</th>
						<th width="20">정산 금액(원)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-09-30</td>
						<td>OH! 잔디의 JAVA</td>
						<td>48,500</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th>총 합계</th>
						<th></th>
						<th>48,500</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
		<!-- Modal -->
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">정산 계좌 수정 방법 안내</h4>
					</div>
					<form action="" method="post" id="modalForm">
						<div class="modal-body" align="center">
							<br>
							정산 계좌는 한달에 한번 고객센터를 통해서만 변경이 가능합니다.
							<br>
							자세한 문의는 고객센터로 문의 바랍니다.
							<br>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btnBD"
								data-dismiss="modal">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
