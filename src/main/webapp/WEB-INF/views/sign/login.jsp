<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$("#eye").hide()
		$("#close").on('click',function(){
			$("#close").hide()
			$("#eye").show()
			var passwordField = $("#passwordInput1")
			var passwordFieldType = passwordField.attr('type')
			if (passwordFieldType == 'password'){
				passwordField.attr('type', 'text')
			} else {
				passwordField.attr('type','password')
			}
		})
		$("#eye").on('click',function(){
			$("#eye").hide()
			$("#close").show()
			var passwordField = $("#passwordInput1")
			var passwordFieldType = passwordField.attr('type')
			if (passwordFieldType == 'password'){
				passwordField.attr('type', 'text')
			} else {
				passwordField.attr('type','password')
			}
		})
	})
</script>
</head>
<style>
	.form-control:focus {
		box-shadow : 0 0;
	}
	
	.main{
		display: flex;
		height: 100%;
		margin: 0;
		padding:0;
	}
	.main2{
		display: flex;
		flex:1 1;
	}
	.left-area{
		position: relative; 
		flex: 1 1; 
		background-color: #303134; 
		display: block;
	}
	.left{
		color: white; 
		text-decoration: none; 
		font-size: 500%; 
		left: 15%; 
		top: 30%; 
		z-index: 60; 
		position: fixed;
	}
	.a-left{
		text-decoration: none;
		color: white;
	}
	.team{
		padding-top: 48px; 
		color: white; 
		font-size: 25px; 
		text-align: center; 
		left: 15%; 
		top: 30%; 
		z-index: 60;
	}
	.left-under{
		position: absolute; 
		bottom: 42px; 
		left: 3%; 
		width: 90%;
	}
	.left-under-team{
		color: white; 
		font-size: 15px;
	}
	.right-area{
		position: relative; 
		align-items: center; 
		flex-basis: 55%; 
		display: flex; 
		padding: 120px 0;
		font-size: 1.4rem; 
		flex-direction: column;
	}
	h1{
		font-weight: 700; 
		font-size: 25px; 
		line-height: 130%; 
		margin-bottom: 12px; 
		padding-bottom: 14px;
		text-align: center;
		font-size: 150%;
	}
	#usernameInput1{
		border: none;
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0; 
		padding: 14px; 
		width: 100%;
		box-sizing: border-box; 
		line-height: 36px;
		padding: 17px;"
	}
	label{
		position: absolute;
	}
	#passwordInput1{
		border: none; 
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0;
		padding: 14px; 
		box-sizing: border-box; 
		line-height: 36px;
		padding: 17px; 
		outline-style: none;
	}
	#basic-addon1{
		background: none; 
		border-left: none; 
		border-right: none; 
		border-top: none; 
		border-bottom-color: black; 
		border-radius: 0;
	}
	.btn{
		margin-top: 37px; 
		position: relative; 
		display: block; 
		height: 58px; 
		text-align: center;
		font-size: 18px; 
		width: 100%; 
		font-weight: 500; 
		line-height: normal;
	}
	.form-check{
		position: relative; 
		font-size: 13px; 
		font-weight: 500; 
		padding-top: 15px; 
		padding-bottom: 18px;
	}
	.form-check-label{
		position: relative; 
		color:#979797;
	}
	.idFind{
		position: absolute; 
		right:42%; 
		text-decoration: none; 
		color: #979797;
	}
	.passwordFind{
		position: absolute; 
		right: 0; 
		text-decoration: none; 
		color: #979797;
	}
	.signup{
		color: black; 
		text-decoration: none;
	}
	.sign-form{
		padding: 20px; 
		text-align: center; 
		font-size: 16;
	}
</style>
<c:if test="${param.error != null }">
	<script>
	alert("아이디와 패스워드를 확인 해주세요.");
	</script>
</c:if>

<body>
	
	<div class="main">
	
	<div class="main2">
	
	
		<div class="left-area">
			<div class="left">
			<a href="${appRoot }/designBoard/list" class="a-left">TRAZAR</a>
			<div class="team">produce by HYS</div>
			</div>
		</div>
		
		<div class="left-under">
			<div class="left-under-team">TRAZAR</div>
		</div>
	
		<div class="right-area justify-content-center">
				<div class="col-12 col-lg-5">
					<h1>로그인 하기 </h1>
					<form action="${appRoot }/login" method="post">
					
						<%-- 아이디 --%>
						<label for="usernameInput1" class="form-label">
						</label>
						<div class="passwordInput">
						<input id="usernameInput1" class="form-control" type="text" name="username" 
						placeholder="아이디"/>
						</div>
						
						<%-- 패스워드 --%>
						<div class="passwordEye">
						<label for="passwordInput1" class="form-label">
						</label>	
							<div class="input-group mb-3">
								<input class="form-control" id="passwordInput1" type="password" name="password" placeholder="비밀번호" />
								<span class="input-group-text" id="basic-addon1">
									<i class="fa-solid fa-eye" id="eye"></i>
									<i class="fa-solid fa-eye-slash" id="close"></i>
								</span>
							</div>
						</div>
						
						
						<%-- 로그인 --%>
						<button class = "btn btn-dark" type="submit">로그인</button>
						
						
						
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="remember-me" id="rememberMeCheck1" />
							<label for="rememberMeCheck1" class="form-check-label">
								로그인유지
							</label>
							<a href="${appRoot}/sign/findId" class="idFind"> 아이디 찾기</a>
							<a href="${appRoot}/sign/findPassword" class="passwordFind">비밀번호 찾기</a>
						</div>
						
						
						
						
						<div class="sign-form">
							<a href="${appRoot}/sign/signup" class="signup">회원가입 하러가기</a>
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>