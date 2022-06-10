<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			
				<h2 class="text-center">요청 사항<i class="fa-solid fa-pen-to-square"></i></h2>
				
				<c:url value="/request/requestInsert" var="writeLink" />
				
				<form action="${writeLink }" method="post">
					
					
					<div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control" type="text" name="title" required id="input1" />
					</div>
					
					<div>
						<label class="form-label" for="textarea1">내용</label>
						<textarea class="form-control" name="body" id="textarea1" cols="20" rows="20" ></textarea>
					</div>
					
					<div>
						<label class="form-label" for="input1">가격</label>
						<input class="form-control" type="text" name="price" required id="input2" />
					</div>
						<button class="btn btn-outline-secondary mt-3">등록</button>
				</form>
			</div>
		</div>
</body>
</html>