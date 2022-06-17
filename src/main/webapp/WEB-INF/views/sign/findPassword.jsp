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

	<my:navBar></my:navBar>

	<div class="container">


		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<form action="${appRoot}/sign/findPassword" method="post">

					<label for="passwordInput1" class="form-label"
						style="position: absolute;"> </label>
					<input class="form-control" id="passwordInput1" type="text"
						name="id"
						style="border: none; border-bottom: 1px solid; border-radius: 0; left: 0; padding: 14px; width: 100%; box-sizing: border-box; line-height: 36px; padding: 14px;"
						placeholder="아이디를 입력하세요" /> <br /> <br />
						
						
					<label for="usernameInput1" class="form-label"
						style="position: absolute;"> </label>
					<input id="usernameInput1" class="form-control" type="text"
						value="아버지의 성함은?" readonly /> <br /> <br />


					<label for="passwordInput1" class="form-label"
						style="position: absolute;"> </label>
					<input class="form-control" id="passwordInput1" type="text"
						name="question" placeholder="답변" /> <br /> <br />

					<input class="btn btn-primary" type="submit" value="비밀번호 초기화" />
				</form>
			</div>
		</div>
	</div>


</body>
</html>