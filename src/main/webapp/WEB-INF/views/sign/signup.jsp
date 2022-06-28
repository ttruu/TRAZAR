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
	$(document).ready(
			function() {
				$("#eye1").hide()
				$("#close1").on('click',function(){
					$("#close1").hide()
					$("#eye1").show()
					var passwordField = $("#pwCheck1")
					var passwordField1 = $("#pwCheck2")
					var passwordFieldType = passwordField.attr('type')
					var passwordFieldType1 = passwordField1.attr('type')
					if (passwordFieldType && passwordFieldType == 'password'){
						passwordField.attr('type', 'text')
						passwordField1.attr('type', 'text')
					} else {
						passwordField.attr('type','password')
						passwordField1.attr('type','password')
					}
				})
				$("#eye1").on('click',function(){
					$("#eye1").hide()
					$("#close1").show()
					var passwordField = $("#pwCheck1")
					var passwordField1 = $("#pwCheck2")
					var passwordFieldType = passwordField.attr('type')
					var passwordFieldType1 = passwordField1.attr('type')
					if (passwordFieldType && passwordFieldType == 'password'){
						passwordField.attr('type', 'text')
						passwordField1.attr('type', 'text')
					} else {
						passwordField.attr('type','password')
						passwordField1.attr('type','password')
					}
				})
				// 기본값 false, true시 수정버튼 활성화
				let idCheck = false;
				let emailCheck = false;
				let nickNameCheck = false;
				let pwCheck = false;
				let phoneNumCheck = false;

				// id중복확인 클릭 시
				$("#idCheckButton").click(
						function(e) {
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
										$("#idCheckMessage").text(
												"사용 가능한 아이디 입니다.")
										$("#idCheckMessage").css("color",
												"blue")
										idCheck = true;
										break;
									case "notok":
										$("#idCheckMessage").text(
												"사용중인 아이디 입니다.")
										$("#idCheckMessage")
												.css("color", "red")
										break;
									}
								},
								error : function(data) {
									$("#idCheckMessage").text(
											"아이디 중복 확인 중 오류가 발생하였습니다.")
								},
								complete : function(data) {
									enableSubmit()
								}
							})
						})

				// 이메일 중복확인 클릭 시
				$("#emailCheckButton").click(
						function(e) {
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
										$("#emailCheckMessage").text(
												"사용 가능한 이메일 입니다.")
										$("#emailCheckMessage").css("color",
												"blue")
										emailCheck = true;
										break;
									case "notok":
										$("#emailCheckMessage").text(
												"사용중인 이메일 입니다.")
										$("#emailCheckMessage").css("color",
												"red")
										break;
									}
								},
								error : function(data) {
									$("#emailCheckMessage").text(
											"이메일 중복 확인 중 오류가 발생하였습니다.")
								},
								complete : function(data) {
									enableSubmit()
								}
							})
						})

				// 닉네임 중복확인 버튼 클릭 시
				$("#nickNameCheckButton").click(
						function(e) {
							e.preventDefault()
							const data = {
								nickName : $("#form1").find("[name=nickName]")
										.val()
							}

							nickNameCheck = false;
							$.ajax({

								url : "${appRoot}/sign/check",
								data : data,
								success : function(data) {
									switch (data) {
									case "ok":
										$("#nickNameCheckMessage").text(
												"사용 가능한 닉네임 입니다.")
										$("#nickNameCheckMessage").css("color",
												"blue")
										nickNameCheck = true;
										break;
									case "notok":
										$("#nickNameCheckMessage").text(
												"사용중인 닉네임 입니다.")
										$("#nickNameCheckMessage").css("color",
												"red")
										break;
									}
								},
								error : function(data) {
									$("#nickNameCheckMessage").text(
											"닉네임 중복 확인 중 오류가 발생하였습니다.")
								},
								complete : function(data) {
									enableSubmit()
								}
							})
						})

				// 휴대폰번호 중복확인 버튼 클릭 시
				$("#phoneNumCheckButton").click(
						function(e) {
							e.preventDefault()
							const data = {
								phoneNum : $("#form1").find("[name=phoneNum]")
										.val()
							}

							phoneNumCheck = false;
							$.ajax({

								url : "${appRoot}/sign/check",
								data : data,
								success : function(data) {
									switch (data) {
									case "ok":
										$("#phoneNumCheckMessage").text(
												"번호가 확인 되었습니다.")
										$("#phoneNumCheckMessage").css("color",
												"blue")
										phoneNumCheck = true;
										break;
									case "notok":
										$("#phoneNumCheckMessage").text(
												"이미 가입한 번호 입니다.")
										$("#phoneNumCheckMessage").css("color",
												"red")
										break;
									}
								},
								error : function(data) {
									$("#phoneNumCheckMessage").text(
											"번호 확인 중 오류가 발생하였습니다.")
								},
								complete : function(data) {
									enableSubmit()
								}
							})
						})

				// 비밀번호, 비밀번호 확인 누를때 패스워드 일치, 불일치 확인
				$("#pwCheck1, #pwCheck2").keyup(function() {
					const pw1 = $("#pwCheck1").val()
					const pw2 = $("#pwCheck2").val()

					if (pw1 == pw2) {
						$("#passwordCheck").text("패스워드가 일치합니다.")
						$("#passwordCheck").css("color", "blue")
						pwCheck = true;
					} else {
						$("#passwordCheck").text("패스워드가 일치하지 않습니다.")
						$("#passwordCheck").css("color", "red")
					}
				})
				const enableSubmit = function() {
					if (idCheck && emailCheck && nickNameCheck && pwCheck
							&& phoneNumCheck) {
						$("#CreateButton").removeAttr("disabled")
					} else {
						$("#CreateButton").attr("disabled", "")
					}
					enableSubmit()
				}
				
			})
</script>
</head>

<style>
	.form-control:focus {
	box-shadow: 0 0;
	
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
  }
</style>
<body>


	<div class="main"
		style="display: flex; height: 110%; margin: 0; padding: 0;">

		<div class="main2" style="display: flex; flex: 1 1;">



			<div class="left-area"
				style="position: relative; flex: 1 1; background-color: #303134; display: block;">
				<div
					style="color: white; text-decoration: none; font-size: 500%; left: 15%; top: 30%; z-index: 60; position:fixed;">
					<a href="${appRoot }/designBoard/list"
						style="text-decoration: none; color: white;">TRAZAR</a>
					<div
						style="padding-top: 48px; color: white; font-size: 25px; text-align: center; left: 15%; top: 30%; z-index: 60;">produce
						by HYS</div>
				</div>
			</div>

			<div class="left-under"
				style="position: fixed; bottom: 42px; left: 3%; width: 90%;">
				<div style="color: white; font-size: 15px;">TRAZAR</div>
			</div>

			<div class="right-area justify-content-start"
				style="position: relative; align-items: center; flex-basis: 55%; display: flex; padding: 30px 0; font-size: 1.4rem; flex-direction: column;">
				<div class="col-12 col-lg-5">
					<div
						style="position: absolute; top: 20px; right: 8%; font-size: 14px; color: #aeaeae; font-weight: 500; line-height: 36px;">
						이미 계정이 있으신가요 ?
						<button class="btn btn-outline-primary" type="button"
							onclick="location.href='${appRoot}/sign/login';"
							style="margin-left: 8px; display: inline-block; border-radius: 13px; box-sizing: border-box; height: 30px; padding: 0 12px;">로그인</button>
					</div>
					<h1
						style="font-weight: 700; font-size: 25px; line-height: 130%; margin-bottom: 12px; padding-bottom: 14px; text-align: center; font-size: 150%;">TRAZAR
						가입하기</h1>

					<form id="form1" action="${appRoot}/sign/signup" method="post"
						style="font-size: 15px;">

						<%-- 이름 --%>
						<label for="idInput1" class="form-label"> 이름 </label>
						<div class="input-group">
							<input id="idInput1" class="form-control" type="text" name="name" />
						</div>

						<%-- 아이디 --%>
						<label for="idInput1" class="form-label"> 아이디 </label>
						<div class="input-group">
							<input id="idInput1" class="form-control" type="text" name="id" />
							<button class="btn btn-secondary" id="idCheckButton"
								type="button">아이디 중복 확인</button>
						</div>

						<div class="form-text" id="idCheckMessage"></div>

						<%-- 패스워드 --%>
						<label for="passwordInput1" class="form-label"> 패스워드 </label>
						<div class="input-group mb-3">
							<input class="form-control" id="pwCheck1" type="password" name="password" style="border-right: none;" />
							<span class="input-group-text" id="basic-addon1" style="background: white; border-left: none;">
								<i class="fa-solid fa-eye" id="eye1"></i>
								<i class="fa-solid fa-eye-slash" id="close1"></i>
							</span>
						</div>

						<%-- 패스워드 확인 --%>
						<label for="passwordInput2" class="form-label"> 패스워드확인 </label>
						<input class="form-control" id="pwCheck2" type="password" name="passwordConfirm" />
						<div class="form-text" id="passwordCheck"></div>

						<%-- 이메일 --%>
						<label for="emailInput1" class="form-label"> 이메일 </label>
						<div class="input-group">
							<input id="emailInput1" class="form-control" type="email"
								name="email" />
							<button class="btn btn-secondary" id="emailCheckButton"
								type="button">이메일 중복 확인</button>
						</div>
						<div class="form-text" id="emailCheckMessage"></div>

						<%-- 닉네임 --%>
						<label for="nickNameInput1" class="form-label"> 닉네임 </label>
						<div class="input-group">
							<input id="nickNameInput1" class="form-control" type="text"
								name="nickName" />
							<button class="btn btn-secondary" id="nickNameCheckButton"
								type="button">닉네임 중복 확인</button>
						</div>
						<div class="form-text" id="nickNameCheckMessage"></div>

						<%-- 휴대폰 번호 --%>
						<label for="phoneInput1" class="form-label"> 휴대폰 번호 ( - 빼고
							입력) </label>
						<div class="input-group">
							<input id="idInput1" class="form-control" type="number"
								name="phoneNum" style="" />
							<button class="btn btn-secondary" id="phoneNumCheckButton"
								type="button">휴대폰 번호 확인</button>
						</div>
						<div class="form-text" id="phoneNumCheckMessage"></div>

						<%-- 비밀번호 초기화 질문 --%>
						<label for="questionInput1" class="form-label"> 비밀번호 초기화 질문 </label>
							<select id="usernameInput1" class="form-control" name="question" class="arrow" >
								<option value="내가 좋아하는 캐릭터는 ?">내가 좋아하는 캐릭터는 ?</option>
								<option value="기억에 남는 추억의 장소는 ?">기억에 남는 추억의 장소는 ?</option>
								<option value="인상 깊게 읽은 책 이름은 ?">인상 깊게 읽은 책 이름은 ?</option>
								<option value="아버지의 성함은 ?">아버지의 성함은 ?</option>
							</select>

						<%-- 비밀번호 초기화 답변 --%>
						<label for="answerInput1" class="form-label"> 답변 </label>
						<div class="input-group">
							<input id="answer" class="form-control" type="text" name="answer" />
						</div>

						<button class="btn btn-dark" type="submit"
							style="margin-top: 37px; position: relative; display: block; height: 58px; text-align: center; font-size: 18px; width: 100%; font-weight: 500; line-height: normal;"
							id="CreateButton" disabled>회원가입</button>
					</form>

				</div>
			</div>
		</div>
	</div>


</body>
</html>