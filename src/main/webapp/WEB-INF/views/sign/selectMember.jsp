<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>

$(document).ready(function() {
	
	let emailModify= false;
	let nickNameModify = false;
	let pwModify = false;
	let introduce = true;
	
	const oldEmail = $("#emailId").val()
	const oldNickName = $("#nickNameId").val()
	
	$("#introduce").keyup(function(){
		enableSubmitModify()
		introduce = true;
	})
	
	// 중복확인 버튼 활성화 
	$("#emailId").keyup(function(){
		const newEmail = $("#emailId").val()
		
		if(oldEmail === newEmail){
			$("#emailCheckButtonModify").attr("disabled","")
			$("#emailMessageModify").text("")
			emailModify = true;
		} else {
			$("#emailCheckButtonModify").removeAttr("disabled")
			emailModify = true;
		}
		enableSubmitModify()
		
	})
	
	// 중복확인 버튼 활성화 
	$("#nickNameId").keyup(function(){
		const newNickName = $("#nickNameId").val()
		
		if(oldNickName === newNickName){
			$("#nickNameCheckButtonModify").attr("disabled","")
			$("#nickNameMessageModify").text("")
			nickNameModify = true;
		} else {
			$("#nickNameCheckButtonModify").removeAttr("disabled")
			nickNameModify = true;
		}
		enableSubmitModify()
		
	})
	
	
	// 중복확인 버튼
	$("#emailCheckButtonModify").click(function(e) {
		e.preventDefault()
		const data = {
			email : $("#formModify").find("[name=email]").val()
		}
		emailModify = false;
		$.ajax({
			url : "${appRoot}/sign/modify",
			data : data,
			success : function(data) {
				switch (data) {
				case "ok":
					$("#emailMessageModify").text("사용 가능한 이메일 입니다.")
					$("#emailMessageModify").css("color", "blue")
					emailModify = true;
					break;
				case "notok":
					$("#emailMessageModify").text("사용중인 이메일 입니다.")
					$("#emailMessageModify").css("color", "red")
					break;
				}
			},
			error : function(data) {
				$("#emailMessageModify").text("이메일 중복 확인 중 오류가 발생하였습니다.")
			},
			complete : function(data){
				enableSubmitModify()
			}
		})
	})
	$("#nickNameCheckButtonModify").click(function(e) {
		e.preventDefault()
		const data = {
			nickName : $("#formModify").find("[name=nickName]").val()
		}

		nickNameModify = false;
		$.ajax({

			url : "${appRoot}/sign/modify",
			data : data,
			success : function(data) {
				switch (data) {
				case "ok":
					$("#nickNameMessageModify").text("사용 가능한 닉네임 입니다.")
					$("#nickNameMessageModify").css("color", "blue")
					nickNameModify = true;
					break;
				case "notok":
					$("#nickNameMessageModify").text("사용중인 닉네임 입니다.")
					$("#nickNameMessageModify").css("color", "red")
					break;
				}
			},
			error : function(data) {
				$("#nickNameMessageModify").text("닉네임 중복 확인 중 오류가 발생하였습니다.")
			},
			complete : function(data){
				enableSubmitModify()
			}
		})
	})
	
	$("#passwordModify1, #passwordModify2").keyup(function() {
		const pw1 = $("#passwordModify1").val();
		const pw2 = $("#passwordModify2").val();
		
		if (pw1 === pw2) {
			$("#passwordMessageModify").text("패스워드가 일치합니다.");
			$("#passwordMessageModify").css("color","blue")
			pwModify = true;
		} else {
			$("#passwordMessageModify").text("패스워드가 일치하지 않습니다.");
			$("#passwordMessageModify").css("color","red")
			pwModify = false;
		}
		
		enableSubmitModify()

	});
	const enableSubmitModify = function(){
		if( emailModify || nickNameModify || pwModify || introduce){
			$("#modifyButton").removeAttr("disabled")
		} else {
			$("#modifyButton").attr("disabled","")
		}
	}
	
})
</script>
</head>
<body>

<my:navBar current="memberInfo"></my:navBar>
	<div class="container">
	
		
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
	
				<h1>회원 정보</h1>
				<form action="${appRoot }/sign/modify" id="formModify" method="post">
				<div>
				<input type="hidden" name="oldPassword" />
					<label for="nameInput1" class="form-label">
					이름
					</label>
					<input id="nameInput1" class="form-control" name="name" type="text" value="${member.name }" readonly />
					<label for="nameInput1" class="form-label">
					아이디
					</label>
					<input id="idInput1" class="form-control" type="text" name="id" value="${member.id }" readonly />
					
					<label for="passwordInput1" class="form-label">
					암호
					</label>
					<input class="form-control" id="passwordModify1" name="password" type="text" value=""  />
					<label for="passwordInput2" class="form-label">
					암호확인
					</label>
					<input class="form-control" id="passwordModify2" type="text" value=""  />
					<p class="form-text" id="passwordMessageModify"></p>
					<label for="emailInput1" class="form-label">
					이메일
					</label>
					<div class="input-group">
						<input class="form-control" name="email" type="email" id="emailId" value="${member.email }" /> 
						<button class="btn btn-secondary" id="emailCheckButtonModify" disabled>이메일중복확인</button>
					</div>
					<p class="form-text" id="emailMessageModify"></p>
					
					<label for="nickNameInput1" class="form-label">
					닉네임
					</label>
					
					<div class="input-group">
						<input class="form-control" name="nickName" id="nickNameId" type="text" value="${member.nickName }" /> 
						<button class="btn btn-secondary" id="nickNameCheckButtonModify" disabled>닉네임중복확인</button>
					</div>
					<p class="form-text" id="nickNameMessageModify"></p>
					
					<label for="phoneNum" class="form-label">
					휴대폰 번호
					</label>
					
					<div class="input-group">
						<input class="form-control" id="phoneNumInput1" name="phoneNum" type="number" value="${member.phoneNum}" readonly /> 
					</div>
					<p class="form-text" id="phoneNumMessage1"></p>
					
					<label for="introduceInput1" class="form-label">
					자기소개
					</label>
					<div class="input-group">
						<input type="text" name="introduce" value="${member.introduce }" size="74" id="introduce" />
					</div>
					
					<label for="" class="form-label">
					가입일시
					</label>
					<input class="form-control" name="inserted" type="datetime-local" value="${member.inserted }" readonly />
				</div>
				
				<div class="mt-3">
					<button class="btn btn-secondary" id="modifyButton" disabled> 수정</button>
					<button class="btn btn-danger" >탈퇴</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	

</body>
</html>