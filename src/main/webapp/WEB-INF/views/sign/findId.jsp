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


<c:if test="${param.msg != null }">
	<script>
		alert("이름과 이메일, 휴대폰번호를 확인 해 주세요.")
	</script>
</c:if>


</head>

<style>
	.form-control:focus {
		box-shadow: 0 0;
	}

	input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
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
	#idInput1{
		border: none; 
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0; 
		padding: 14px; 
		width: 100%; 
		box-sizing: border-box; 
		line-height: 36px; 
		padding: 14px;
	}
	#phoneInput1{
		border: none; 
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0; 
		padding: 14px; 
		width: 100%; 
		box-sizing: border-box; 
		line-height: 36px;
		padding: 14px;
	}
	#emailInput1{
		border: none; 
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0; 
		padding: 14px; 
		width: 100%; 
		box-sizing: border-box; 
		line-height: 36px; 
		padding: 14px;
	}
</style>
<body>

	<div class="main">
	
	<div class="main2">
	
	
		<div class="left-area">
			<div class="left">
			<a href="${appRoot }/designBoard/list" style="text-decoration: none; color: white;">TRAZAR</a>
			<div class="team">produce by HYS</div>
			</div>
		</div>
		
		<div class="left-under">
			<div class="left-under-team">TRAZAR</div>
		</div>

			<div class="right-area justify-content-center">
				<div class="col-12 col-lg-5">
					<h1>아이디 찾기</h1>
					<form action="${appRoot}/sign/findId" method="post">

						<%-- 이름 입력  --%>
						<label for="nameInput1" class="form-label"> 이름 </label>
						<input class="form-control" id="idInput1" type="text" name="name" placeholder="이름을 입력하세요" />
						<br />
						<br />


						<%-- 휴대폰 번호 입력 --%>
						<label for="phoneInput1" class="form-label">휴대폰 번호 </label>
						<input class="form-control" id="phoneInput1" type="number" name="phoneNum" placeholder="휴대폰 번호를 입력하세요 ( - 빼고 입력)" />
						<br />
						<br />

						<%-- 이메일 입력 --%>
						<label for="emailInput1" class="form-label"> 이메일 </label>
						<input class="form-control" id="emailInput1" type="email" name="email" placeholder="이메일을 입력하세요" />
						<br />
						<br />
						<input class="btn btn-dark" type="submit" value="아이디 찾기"
							style="width: 100%;" />
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>