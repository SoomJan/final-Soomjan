<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>잔디 프로필</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.css" rel="stylesheet"/>
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage/mypagesidebar.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/css/mypage.css" rel="stylesheet"/>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/semantic/semantic.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/css/ie-emulation-modes-warning.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>

<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.introduce-detail img {
	width: 250px;
	text-align: center;
	border-radius: 70%;
}

p {
	font-weight: bold;
	font-size: 20px;
}

.btnStyle {
	padding: 5px;
	background-color: #91c788;
	border-radius: 0.5rem;
	font-size: 12px;
	border-color: #91c788;
	float: right;
}

.areaStyle {
	border: none;
	width: 100%;
	resize: none;
}

.areaStyle: focus {
	border: none;
	width: 100%;
	resize: none;
}

.imgBox {
	width: 100%;
	height: 200px;
}

.img {
	width: 80%;
	height: 100%;
}
</style>

<script>
	function modifyProfile(){
		console.log("클릭");
		$('#openModalBtn').click();
	}
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
			<div class="introduce">
				<button class="btnStyle btn">닉네임 변경</button>
				<div class="introduce-detail">
					<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ requestScope.jandi.profile_path}"
						id="profile" onclick="modifyProfile();">
					<h3>${ requestScope.jandi.nickName }</h3>
				</div>
			</div>
			<br>
			
			<div class="introduce" style="padding: 3%">
			
			
				<form id="mentorForm" action="${ pageContext.servletContext.contextPath }/jandi/jandiIntro" method="post">

					<h2>잔디 경력</h2>
					<hr class="border-1px-black" />
					<br>
					<textarea class="areaStyle" name="career" rows="10" cols="20" wrap="hard"
						style="border: 1px solid black"  placeholder="경력을 작성해 주세요.">
						${ requestScope.jandi.career }
						</textarea>

					<br><br><br>
					<h2>소개</h2>
					<hr class="border-1px-black" />
					<br>
					<textarea class="areaStyle" name="introduce" id="introText" rows="20" cols="20" wrap="hard"
						style="border: 1px solid black" placeholder="소개를 작성해 주세요.">
						${ requestScope.jandi.intro }
						</textarea>
					<br><br>
					<button type="submit" class="btnStyle btn">수정하기</button>
				</form>
			
				<br>
				<br>
				<hr>
				<div class="warining">
					<p>"${ requestScope.jandi.nickName }" 멘토님의 진행중인 클래스</p>
					<hr class="border-1px-black" />
					<table style="width: 100%; overflow-x:scroll">
						<tr>

<%-- 							<c:forEach var="classes" items="${ requestScope.classes }">
								<td>
									<div class="imgBox" align="center">
										<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ requestScope.classes.filePath}" style="width:20px"> 
										<h4>아직 작성된 클래스가 없습니다.</h4>
									</div>
								</td>
							</c:forEach> --%>
						</tr>
					</table>
					<br>
				</div>
			</div>
		</div>
	</div>
			<!-- Modal -->
		<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">프로필 사진 변경</h4>
					</div>
					<form action="jandiProfile1" method="post" id="modalForm" enctype="multipart/form-data">
						<div class="modal-body" align="center">
							<br>
								<b>변경할 프로필 사진을 선택해 주세요.</b>
								<br><br>
								<input type="file" name="profileImage" id="profileImage">
							<br>
							<br>
							<button class="btn btn-default btnBD" style="margin-right:80%;">프로필 사진 초기화</button>
							<input type="text" name="defaultImage" hidden="true">
							<br>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btnBD"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="okBtn" onclick="modifyProfileImage();">변경</button>
						</div>
					</form>
						<script>
							function modifyProfileImage(){
								console.log("전");
								const profileImage=$('#modalForm')[0];
								//파일이 여러개인걸 방지
								const formData=new FormData(profileImage);
								formData.append("profileImage",$('#profileImage')[0].files[0]);
								console.log("중");
								
								
								
								
								$.ajax({
								
									type: "POST",
									url: "${ pageContext.servletContext.contextPath }/jandi/jandiProfile1",
									processData: false,
									contentType: false,
									data: formData,
									success: function(data){
										
								
										$('#profile').attr("src","${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/"+data);
									
										$('.modal fade').attr("hidden",true);
									},
									error:function(err){
										console.log(err);
									}
									
								});
							}
						
						</script>
				</div>
			</div>
		</div>
			
		<button type="button" id="openModalBtn" data-toggle="modal" data-target="#profileModal" hidden="true"></button>
</body>
<jsp:include page="../common/footer.jsp" />
</html>
