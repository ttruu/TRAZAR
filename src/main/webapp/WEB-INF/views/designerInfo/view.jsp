<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
<h1>디자이너 정보</h1>
		
				<div>
				<input type="hidden" name="id" value="${member.id }"/>
					<label for="name" class="form-label">
					이름
					</label>
					<div id="name" class="form-control" name="name" value="${member.name }" />
		
					
					<label for="email class="form-label">
					이메일
					</label>
						<div class="form-control" name="email"  id="email" value="${member.email }" /> 
	
					<label for="nickName" class="form-label">
					닉네임
					</label>
						<div class="form-control" name="nickName" id="nickName" value="${member.nickName }"> </div>
		
		

					<label for="introduce" class="form-label">
					자기소개
					</label>
					<div class="input-group">
						<div name="introduce" value="${member.introduce }" size="74" id="introduce" > </div>
					</div>
				</div>

	
</body>
</html>