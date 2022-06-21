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
</head>
<style>
	.form-control:focus {
		box-shadow : 0 0;
	}
</style>
<body>
	
	<div class="main" 
	style="display: flex; height: 100%; margin: 0; padding:0; ">
	
	<div class="main2" style="display: flex; flex:1 1;">
	
	
		<div class="left-area" 
		style="position: relative; flex: 1 1; background-color: #303134; display: block;">
			<div style="color: white; text-decoration: none; font-size: 500%; left: 15%; top: 30%; z-index: 60; position: fixed;">
			<a href="${appRoot }/designBoard/list" style="text-decoration: none; color: white;">TRAZAR</a>
			<div style="padding-top: 48px; color: white; font-size: 25px; text-align: center; left: 15%; top: 30%; z-index: 60;">produce by HYS</div>
			</div>
		</div>
		
		<div class="left-under" style="position: absolute; bottom: 42px; left: 3%; width: 90%;">
			<div style="color: white; font-size: 15px;">TRAZAR</div>
		</div>
	
		<div class="right-area justify-content-center" 
		style=" position: relative; align-items: center; flex-basis: 55%; display: flex; padding: 120px 0;
		font-size: 1.4rem; flex-direction: column;">
				<div class="col-12 col-lg-5">
					<h1 
					style="font-weight: 700; font-size: 25px; line-height: 130%; margin-bottom: 12px; padding-bottom: 14px;
					text-align: center; font-size: 150%;">로그인하기 </h1>
					<form action="${appRoot }/login" method="post">
						<label for="usernameInput1" class="form-label" style="position: absolute;">
						</label>
						<input id="usernameInput1" class="form-control" type="text" name="username"
						style="border: none; border-bottom: 1px solid; border-radius: 0; left: 0; padding: 14px; width: 100%; box-sizing: border-box; line-height: 36px;
						 padding: 17px;" 
						placeholder="아이디"/>
						
						<label for="passwordInput1" class="form-label" style="position: absolute;">
						</label>
						<input class="form-control" id="passwordInput1" type="password" name="password" 
						style="border: none; border-bottom: 1px solid; border-radius: 0; left: 0; padding: 14px; width: 100%; box-sizing: border-box; line-height: 36px;
						 padding: 17px; outline-style: none;"
						placeholder="비밀번호" />
						
						
						<button class = "btn btn-dark" type="submit" style="margin-top: 37px; position: relative; display: block; height: 58px; text-align: center;
						font-size: 18px; width: 100%; font-weight: 500; line-height: normal;">로그인</button>
						
						
						
						<div class="form-check" style="position: relative; font-size: 13px; font-weight: 500; padding-top: 15px; padding-bottom: 18px;">
							<input class="form-check-input" type="checkbox" name="remember-me" id="rememberMeCheck1" />
							<label for="rememberMeCheck1" class="form-check-label" style="position: relative; color:#979797">
								로그인유지
							</label>
							<a href="${appRoot}/sign/findPassword" style="position: absolute; right: 0; text-decoration: none; color: #979797;">비밀번호 찾기></a>
						</div>
						
						<div style="padding: 20px; text-align: center; font-size: 16;">
							<a href="${appRoot}/sign/signup" style="color: black; text-decoration: none;">회원가입 하러가기</a>
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>