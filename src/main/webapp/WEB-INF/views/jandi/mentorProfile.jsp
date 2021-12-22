<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>

<title>잔디 프로필</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.warningtable tbody {
	text-align: center;
}

.warningtable thead {
	background-color: #E3FFEC;
	text-align: center;
}

.imgBox{
	width: 250px;
	heigth: 250px;
	border-radius: 50%;
}

.imgStyle{
	border-radius: 70%;
	width: 200px;
	height:200px;
	overflow:hidden;
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

.inputStyle{
	border:none;
	width:100px;
	text-align: center;
}

.inputStyle{
	border:none;
	width:100px;
	text-align: center;
}

</style>

<script>
	function modifyProfile(){
		console.log("클릭");
		$('#openModalBtn').click();
	}
	
	$(function(){
		
		$('#modifyNickBtn').click(function(){
			let nickName = $('#nickNameInput').val();
			console.log(nickName);
			if(nickName != ""){
				 $.ajax({
		              url: "${ pageContext.servletContext.contextPath }/member/jandiNickDupCheck",
		              type: "post",
		              data: { nickName: nickName },
		              success: function (data) {
		                if (data == "true") {
		                  alert("중복된 닉네임입니다.");
		                } else {
		                  $('#modifyNickForm').submit();
		                }
		              },
		              error: function (error) {
		                console.log(error);
		              }
		         });
				
			}else{
				alert("변경할 닉네임을 입력해 주세요.");
			}
			
		});
		
		if('${ requestScope.nickMessage }' != ''){
			alert("${ requestScope.nickMessage }");
		}
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="common-sidebar">
		<jsp:include page="/WEB-INF/views/common/mentorsidebar.jsp" />
		<div class="sidebar-content">
			<div class="introduce">
				<button class="btnStyle btn" id="modifyNickBtn" type="button">닉네임 변경</button>
				<div align="center">
					<div class="imgBox">
						<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ requestScope.jandi.profile_path}"
							class="imgStyle" id="profile" onclick="modifyProfile();">
					</div>
					<br>
					<form id="modifyNickForm" action="${ pageContext.servletContext.contextPath }/jandi/modifyNickName" method="post">
					<h3><input id="nickNameInput" type="text" name="nickName" class="inputStyle" value="${ requestScope.jandi.nickName }"></h3>
					</form>
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
						style="border: 1px solid black" placeholder="소개를 작성해 주세요.">${ requestScope.jandi.intro }</textarea>
					<br><br>
					<button type="submit" class="btnStyle btn">수정하기</button>
				</form>
				<br>
				<br>
				<hr>
				<div class="warining">
					<p>"${ requestScope.jandi.nickName }" 멘토님의 진행중인 클래스</p>
					<hr class="border-1px-black" />
					<div class="row">
						<c:forEach var="findClassList" items="${ thumbNailClass }">
							<div class="col-lg-4 col-sm-6 mb-4">
								<div class="card">
									<img class="card-img-top" style="width:180px; height:150px;"
										src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/classImage/${ findClassList.filePath}"
										alt="Card image cap">
									<div class="card-body little-profile text-center">
										<div class="pro-img">
											<img
												src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/profile/${ findClassList.profilePath }"
												alt="user">
										</div>
										<h5 class="m-b-0"></h5>
										<p>${ findClassList.title}</p>
										<a href="javascript:void(0)"
											class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"
											style="margin-bottom: 16px;" data-abc="true"
											onclick="location.href='${ pageContext.servletContext.contextPath}/jandi/class/classRoom?classCode=${ findClassList.classCode }'">자세히보기</a>
										<div class="row text-center m-t-20">
											<div class="col-lg-1 col-md-4 m-t-20">
												<h3 class="m-b-0 font-light"></h3>
												<small> </small>
											</div>
											<div class="col-lg-10 col-md-4 m-t-20">
												<h3 class="m-b-0 font-light">₩ ${ findClassList.price } <br>등록일 : ${ findClassList.createDate }</h3>
												<small> 
													<c:if test="${ findClassList.avgStar == '0'}">
														☆
													</c:if>
													<c:if test="${ findClassList.avgStar != '0'}">
													<c:forEach begin="1" end="${ findClassList.avgStar }">
												    ★
													</c:forEach>  
												    </c:if>
													(${ findClassList.rvCount })
													/ ${ findClassList.categoryName }
												</small>
											</div>
											<div class="col-lg-1 col-md-4 m-t-20">
												<h3 class="m-b-0 font-light"></h3>
												<small> </small>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
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
							<button type="button" class="btn btn-default btnBD" id="closeBtn"
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
										$('#profileImage').val('');
										$('#closeBtn').click();
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
