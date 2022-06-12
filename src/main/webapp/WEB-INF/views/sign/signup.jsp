<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#idCheckButton").click(function(e) {
			e.preventDefault()
			const data = {
				id : $("#form1").find("[name=id]").val()
			}

			$.ajax({
				url : "${appRoot}/sign/check",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#idCheckMessage").text("사용 가능한 아이디 입니다.")
						$("#idCheckMessage").css("color", "blue")
						break;
					case "notok":
						$("#idCheckMessage").text("사용중인 아이디 입니다.")
						$("#idCheckMessage").css("color", "red")
						break;
					}
				},
				error : function(data) {
					$("#idCheckMessage").text("아이디 중복 확인 중 오류가 발생하였습니다.")
				}
			})
		})

		$("#emailCheckButton").click(function(e) {
			e.preventDefault()
			const data = {
				email : $("#form1").find("[name=email]").val()
			}
			$.ajax({
				url : "${appRoot}/sign/check",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#emailCheckMessage").text("사용 가능한 이메일 입니다.")
						$("#emailCheckMessage").css("color", "blue")
						break;
					case "notok":
						$("#emailCheckMessage").text("사용중인 이메일 입니다.")
						$("#emailCheckMessage").css("color", "red")
						break;
					}
				},
				error : function(data) {
					$("#emailCheckMessage").text("이메일 중복 확인 중 오류가 발생하였습니다.")
				}
			})
		})
		$("#nickNameCheckButton").click(function(e) {
			e.preventDefault()
			const data = {
				nickName : $("#form1").find("[name=nickName]").val()
			}

			$.ajax({

				url : "${appRoot}/sign/check",
				data : data,
				success : function(data) {
					switch (data) {
					case "ok":
						$("#nickNameCheckMessage").text("사용 가능한 닉네임 입니다.")
						$("#nickNameCheckMessage").css("color", "blue")
						break;
					case "notok":
						$("#nickNameCheckMessage").text("사용중인 닉네임 입니다.")
						$("#nickNameCheckMessage").css("color", "red")
						break;
					}
				},
				error : function(data) {
					$("#nickNameCheckMessage").text("닉네임 중복 확인 중 오류가 발생하였습니다.")
				}
			})
		})
		
		
	})
</script>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<h1>회원가입</h1>
				<form action="${appRoot }/sign/signup" method="post" id="form1">
					이름 :
					<input type="text" name="name" />
					<br />
					아이디 :
					<input type="text" name="id" />
					<br />
					<button class="btn btn-primary" id="idCheckButton" type="button">중복확인</button>
					<p id="idCheckMessage"></p>
					<br />
					패스워드 :
					<input type="password" name="password" id="pwCheck1" />
					<br />
					패스워드 확인 :
					<input type="password" id="pwCheck2"/>
					<p id="passwordCheck"></p>
					<br />
					이메일 :
					<input type="email" name="email" />
					<br />
					<button class="btn btn-primary" id="emailCheckButton" type="button">중복확인</button>
					<p id="emailCheckMessage"></p>
					<br />
					닉네임 :
					<input type="text" name="nickName" />
					<br />
					<button class="btn btn-primary" id="nickNameCheckButton"
						type="button">중복확인</button>
					<p id="nickNameCheckMessage"></p>
					<br />
					휴대폰 번호 :
					<input type="text" name="phoneNum" />
					<br />
					자기소개 :
					<textarea rows="" cols="" name="introduce"></textarea>
					<br />
					<button class="btn btn-secondary">회원가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>