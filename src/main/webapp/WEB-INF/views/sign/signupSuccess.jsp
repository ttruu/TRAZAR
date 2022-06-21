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
<title>Insert title here</title>
</head>
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
				<div class="col-12 col-lg-5" style="text-align: center;">
					<h2>회원이 되신걸 축하합니다!</h2>
					<div style="text-align: center;">
					<a href="${appRoot }/sign/login">로그인 하러가기!</a>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	


	
</body>
</html>