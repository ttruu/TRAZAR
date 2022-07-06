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
		alert("아이디와 답변을 확인 해주세요.")
	</script>
</c:if>


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
	#usernameInput1{
		border: none;
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0; 
		padding: 14px; 
		width: 100%; 
		box-sizing: border-box; 
		line-height: 36px; 
		padding: 14px; 
		font-size: 1rem;
	}
	#passwordInput1{
		border: none; 
		border-bottom: 1px solid; 
		border-radius: 0; 
		left: 0; 
		padding: 14px; 
		width: 100%; 
		box-sizing: border-box; 
		line-height: 36px; 
		padding: 14px;"
	}
</style>
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
				<h1>비밀번호 찾기</h1>
				<form action="${appRoot}/sign/findPassword" method="post">

					<label for="idInput1" class="form-label"> 아이디 </label>
					<input class="form-control" id="idInput1" type="text" name="id" placeholder="아이디를 입력하세요" /> <br /> <br />
						
						
					<label for="questionInput1" class="form-label"> 비밀번호 초기화 질문 </label>
					<select id="usernameInput1"  name="question">
					<option value="내가 좋아하는 캐릭터는 ?">내가 좋아하는 캐릭터는 ?</option>
					<option value="기억에 남는 추억의 장소는 ?">기억에 남는 추억의 장소는 ?</option>
					<option value="인상 깊게 읽은 책 이름은 ?">인상 깊게 읽은 책 이름은 ?</option>
					<option value="아버지의 성함은 ?">아버지의 성함은 ?</option>
					</select>
					<br /><br /><br />


					<label for="answerInput1" class="form-label"> 비밀번호 초기화 답변 </label>
					<input class="form-control" id="passwordInput1" type="text"
						name="answer" placeholder="답변" /> <br /> <br />

					<input class="btn btn-dark" type="submit" value="비밀번호 초기화" style="width: 100%;" />
				</form>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>