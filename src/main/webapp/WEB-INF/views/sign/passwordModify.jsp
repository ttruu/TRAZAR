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

<script>
$(document).ready(function(){
	$("#passwordModify3, #passwordModify4").keyup(function() {
		const pw3 = $("#passwordModify3").val();
		const pw4 = $("#passwordModify4").val();
		
		if (pw3 === pw4) {
			$("#passwordMessageModify1").text("패스워드가 일치합니다.")
			$("#passwordMessageModify1").css("color","blue")
		} else {
			$("#passwordMessageModify1").text("패스워드가 일치하지 않습니다.")
			$("#passwordMessageModify1").css("color","red")
		}
	})
})
</script>
<body>
<body>
	<my:navBar current="passwordModify"></my:navBar>

	<div class="container">


		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
				<h1>패스워드 변경</h1>
				<form action="${appRoot }/sign/passwordUpdate" method="post">
				
					<label for="nameInput1" class="form-label">
					아이디
					</label>
					<input id="idInput1" class="form-control" type="hidden" name="id" value="${member.id }" readonly />

					<label for="passwordInput1" class="form-label">
					변경 할 암호
					</label>
					<input class="form-control" id="passwordModify3" name="password" type="password" value=""  />
					<label for="passwordInput2" class="form-label">
					변경 할 암호확인
					</label>
					<input class="form-control" id="passwordModify4" type="password" value=""  />
					<p class="form-text" id="passwordMessageModify1"></p>
					<br />
					<button class="btn btn-primary">비밀번호 변경</button>
				</form>

			</div>
		</div>
	</div>

</body>
</html>