<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

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

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<h3 style="margin-top: 10%;">댓글 작성</h3>

			<c:url value="/review/insert" var="write" />

			<form action="${write }" method="post">

				<div class="mb-3">
					<label for="textarea1" class="form-label"></label>
					<textarea name="content" class="form-control" id="textarea1"
						rows="3"></textarea>
				</div>

				<div style="text-align: center;">
					<button type="submit" class="btn btn-outline-secondary" id="button">작성</button>
				</div>
			</form>
		</div>
	</div>

	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<br />

				<h3>댓글

				</h3>

				<ul id="replyList1" class="list-group">

					<c:forEach items="${reviewList }" var="review">
						
						<li class="list-group-item">
							<div id="replyDisplayContainer${review.id }">
								<div class="fw-bold">
									<i class="fa-solid fa-circle-user fa-2x"></i>
								</div>
								
								<c:out value="${review.content }" />
								<button id="edit-button" class="btn btn-secondary">
								<i class="fa-solid fa-pen-to-square"></i>
								</button>
							</div>
							<!--  ${review.inserted} -->
						</li>
					</c:forEach>
					<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>

					<form id="form1" action="${appRoot }/review/modify" method="post">
						<input type="hidden" name="id" value="${review.id }" />
	
						<div>
							<label class="form-label" for="textarea1">본문</label>
							<textarea class="form-control" name="content" id="textarea1"
								cols="30" rows="10" readonly>${review.content }</textarea>
						</div>
						<button id="modify-submit1" class="btn btn-primary d-none">수정</button>
						<button id="delete-submit1" class="btn btn-danger d-none">삭제</button>
					</form>	
					
				</ul>
			</div>
		</div>
	</div>

</body>
</html>
















