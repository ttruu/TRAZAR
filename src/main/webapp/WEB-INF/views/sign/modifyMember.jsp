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
</script>
</head>
<body>

<my:navBar current="memberInfo"></my:navBar>
	<div class="container">
	
		
		<div class="row justify-content-center">
			<div class="col-12 col-lg-6">
	
				<h1>회원 정보 보기</h1>
				
				<div>
					<label for="nameInput1" class="form-label">
					이름
					</label>
					<input id="nameInput1" class="form-control" type="text" value="${member.name }" readonly />
					<label for="nameInput1" class="form-label">
					아이디
					</label>
					<input id="idInput1" class="form-control" type="text" value="${member.id }" readonly />
					
					<label for="passwordInput1" class="form-label">
					암호
					</label>
					<input class="form-control" id="passwordInput1" type="text" value=""  />
					
					<label for="passwordInput2" class="form-label">
					암호확인
					</label>
					<input class="form-control" id="passwordInput2" type="text" value=""  />
					<p class="form-text" id="passwordMessage1"></p>
					
					<label for="emailInput1" class="form-label">
					이메일
					</label>
					<div class="input-group">
						<input class="form-control" id="emailInput1" type="email" value="${member.email }" /> 
						<button class="btn btn-secondary" id="emailCheckButton1" disabled>이메일중복확인</button>
					</div>
					<p class="form-text" id="emailMessage1"></p>
					
					<label for="nickNameInput1" class="form-label">
					닉네임
					</label>
					
					<div class="input-group">
						<input class="form-control" id="nickNameInput1" type="text" value="${member.nickName }" /> 
						<button class="btn btn-secondary" id="nickNameCheckButton1" disabled>닉네임중복확인</button>
					</div>
					<p class="form-text" id="nickNameMessage1"></p>
					
					<label for="phoneNum" class="form-label">
					휴대폰 번호
					</label>
					
					<div class="input-group">
						<input class="form-control" id="phoneNumInput1" type="number" value="${member.phoneNum}" readonly /> 
					</div>
					<p class="form-text" id="phoneNumMessage1"></p>
					
					<label for="introduceInput1" class="form-label">
					자기소개
					</label>
					<div class="input-group">
						<input class="form-control" id="introduceInput1" type="text" value="${member.introduce }" /> 
						<button class="btn btn-secondary" id="introduceCheckButton1" disabled>수정</button>
					</div>
					<p class="form-text" id="emailMessage1"></p>
					
					<label for="" class="form-label">
					가입일시
					</label>
					<input class="form-control" type="datetime-local" value="${member.inserted }" readonly />
				</div>
				
				<div class="mt-3">
					<button class="btn btn-secondary" id="modifySubmitButton1" data-bs-toggle="modal" data-bs-target="#modal2" disabled>수정</button>
					<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal1">삭제</button>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>