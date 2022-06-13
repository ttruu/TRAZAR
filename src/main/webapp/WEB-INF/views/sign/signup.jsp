<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
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
	
		let idCheck = false;
		let emailCheck = false;
		let nickNameCheck = false;
		let pwCheck = false;
		
		$("#idCheckButton").click(function(e) {
			e.preventDefault()
			const data = {
				id : $("#form1").find("[name=id]").val()
			}
			
			idCheck = false;
			$.ajax({
				url : "${appRoot}/sign/check",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#idCheckMessage").text("사용 가능한 아이디 입니다.")
						$("#idCheckMessage").css("color", "blue")
						idCheck = true;
						break;
					case "notok":
						$("#idCheckMessage").text("사용중인 아이디 입니다.")
						$("#idCheckMessage").css("color", "red")
						break;
					}
				},
				error : function(data) {
					$("#idCheckMessage").text("아이디 중복 확인 중 오류가 발생하였습니다.")
				},
				complete : function(data){
					enableSubmit()
				}
			})
		})

		$("#emailCheckButton").click(function(e) {
			e.preventDefault()
			const data = {
				email : $("#form1").find("[name=email]").val()
			}
			emailCheck = false;
			$.ajax({
				url : "${appRoot}/sign/check",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#emailCheckMessage").text("사용 가능한 이메일 입니다.")
						$("#emailCheckMessage").css("color", "blue")
						emailCheck = true;
						break;
					case "notok":
						$("#emailCheckMessage").text("사용중인 이메일 입니다.")
						$("#emailCheckMessage").css("color", "red")
						break;
					}
				},
				error : function(data) {
					$("#emailCheckMessage").text("이메일 중복 확인 중 오류가 발생하였습니다.")
				},
				complete : function(data){
					enableSubmit()
				}
			})
		})
		$("#nickNameCheckButton").click(function(e) {
			e.preventDefault()
			const data = {
				nickName : $("#form1").find("[name=nickName]").val()
			}

			nickNameCheck = false;
			$.ajax({

				url : "${appRoot}/sign/check",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#nickNameCheckMessage").text("사용 가능한 닉네임 입니다.")
						$("#nickNameCheckMessage").css("color", "blue")
						nickNameCheck = true;
						break;
					case "notok":
						$("#nickNameCheckMessage").text("사용중인 닉네임 입니다.")
						$("#nickNameCheckMessage").css("color", "red")
						break;
					}
				},
				error : function(data) {
					$("#nickNameCheckMessage").text("닉네임 중복 확인 중 오류가 발생하였습니다.")
				},
				complete : function(data){
					enableSubmit()
				}
			})
		})
		$("#pwCheck1, #pwCheck2").keyup(function(){
			const pw1 = $("#pwCheck1").val()
			const pw2 = $("#pwCheck2").val()
			
			if(pw1 == pw2){
				$("#passwordCheck").text("패스워드가 일치합니다.")
				$("#passwordCheck").css("color","blue")
				pwCheck = true;
			} else {
				$("#passwordCheck").text("패스워드가 일치하지 않습니다.")
				$("#passwordCheck").css("color","red")
			}
		})
		const enableSubmit = function(){
			if(idCheck && emailCheck && nickNameCheck && pwCheck){
				$("#CreateButton").removeAttr("disabled")
			} else {
				$("#CreateButton").attr("disabled","")
			}
			enableSubmit()
		}
		
	})
</script>
</head>
<body>
<my:navBar current="signup"></my:navBar>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<h1>회원가입</h1>
				<form action="${appRoot }/sign/signup" method="post" id="form1">
					이름 :
					<input type="text" name="name" maxlength = "5" placeholder = "이름을 입력하세요." required />
					<br />
					아이디 :
					<input type="text" name="id" maxlength = "10" placeholder = "아이디를 입력하세요." required/>
					<br />
					<button class="btn btn-primary" id="idCheckButton" type="button">중복확인</button>
					<p id="idCheckMessage"></p>
					패스워드 :
					<input type="password" name="password" id="pwCheck1" required />
					<br />
					패스워드 확인 :
					<input type="password" id="pwCheck2" required/>
					<p id="passwordCheck"></p>
					이메일 :
					<input type="email" name="email" placeholder = "이메일을 입력하세요." required />
					<br />
					<button class="btn btn-primary" id="emailCheckButton" type="button">중복확인</button>
					<p id="emailCheckMessage"></p>
					닉네임 :
					<input type="text" name="nickName" maxlength = "10" placeholder = "닉네임을 입력하세요." required/>
					<br />
					<button class="btn btn-primary" id="nickNameCheckButton"
						type="button">중복확인</button>
					<p id="nickNameCheckMessage"></p>
					휴대폰 번호 :
					<input type="number" name="phoneNum" maxlength = "13" placeholder = "휴대폰 번호를 입력하세요." required/>
					<br />
					자기소개 :
					<textarea rows="" cols="" name="introduce"></textarea>
					<br />
					<button class="btn btn-secondary" disabled id="CreateButton">회원가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>