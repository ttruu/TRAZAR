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

			<h2 class="text-center"
				style="margin-bottom: 2%; margin-top: 10%;">댓글 작성</h2>

			<c:url value="/review/insert" var="writeLink" />

			<form action="${writeLink }" method="post">
				<div class="table table-responsive">
					<table class="table table-striped">

						<tr>
							<td style="text-align: center;" value="${dto.memerId }"></td>
							<td>
								<textarea class="form-control" name="content" id="textarea1"
									cols="20" rows="5"></textarea>
							</td>
						</tr>
					</table>
				</div>

				<div style="text-align: center;">
					<button type="submit" class="btn btn-outline-secondary" id="button">작성</button>
				</div>

			</form>
		</div>
	</div>
	
	<%-- 댓글 목록 --%>

	<!-- .container.mt-3>.row>.col -->
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<h3>댓글</h3>
				
				<ul id="replyList1" class="list-group">
					 
					<c:forEach items="${replyList }" var="reply">
						<li class="list-group-item">
							<div id="replyDisplayContainer${reply.id }">
								<div class="fw-bold">
									<i class="fa-solid fa-comment"></i>
									${reply.inserted}
									<span class="reply-edit-toggle-button badge bg-info text-dark"
										id="replyEditToggleButton${reply.id }"
										data-reply-id="${reply.id }">
										<i class="fa-solid fa-pen-to-square"></i>
									</span>
									<span class="reply-delete-button badge bg-danger"
										data-reply-id="${reply.id }">
										<i class="fa-solid fa-trash-can"></i>
									</span>
								</div>
								<c:out value="${reply.content }" />
							</div>
						</li>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>
















