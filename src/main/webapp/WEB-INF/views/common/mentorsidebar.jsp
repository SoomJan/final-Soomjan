<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Signin Template for Bootstrap</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
ul {
	list-style: none;
}

a {
	color: black;
}

.btnBD {
	border-color: #91C788;
}

.btnBD:focus, .btnBD:hover {
	background-color: #91C788;
}

.btn-primary {
	color: #fff;
	background-color: #91C788;
	border-color: #91C788
}

.btn-primary.active, .btn-primary.focus, .btn-primary:active,
	.btn-primary:focus, .btn-primary:hover, .open>.dropdown-toggle.btn-primary
	{
	color: #fff;
	background-color: #599A4E;
	border-color: #599A4E
}

.btn-primary:hover {
	background-color: #599A4E;
	border-color: #599A4E
}
</style>

</head>
<body>
	<div id="sidebar">
		<div class="sidebar-inner-name">
			<h1>환잔디 님</h1>
			<hr class="border-1px-black" />
		</div>
		<div class="sidebar-inner-name1">
			<ul>
				<li><a href="soomjan/jandi/jandiProfile">내 정보</a></li>
			</ul>
			<ul>
				<h3>내 클래스</h3>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/class/chat">클래스</a></li>
				<li><button type="button" style="border:none; background: none; padding:1px;"
						data-toggle="modal" data-target="#addClassModal">클래스 생성하기</button></li>
			</ul>
			<ul>
				<h3>정산 관리</h3>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/jandiCalc">정산 내역</a></li>
			</ul>
			<ul>
				<h3>광고 관리</h3>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/createAd">클래스 광고 신청</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/jandi/myAd">광고 현황</a></li>
			</ul>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="addClassModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">클래스 추가하기</h4>
					</div>
					<form action="" method="post" id="modalForm">
						<div class="modal-body" align="center">
							카테고리 <select id="category">
								<option value="">프로그래밍 언어</option>
							</select> <br>
							<br> 클래스 정원 <input type="number" name="num"> 명 <br>
							<br> 클래스 가격 <input type="number" name="price"> 원
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btnBD"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="okBtn">클래스
								생성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
			$('#okBtn').click(function() {
				if (confirm("한번 설정된 클래스의 설정은 변경할 수 없습니다. 생성하시겠습니까?")) {
					alert("클래스 생성된 클래스로 이동!");
				}
			});
		</script>
	</div>
</body>

</html>
