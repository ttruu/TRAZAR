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

<script>
$(document).ready(function() {
	$("#edit-button1").click(function() {
		$("#input1").removeAttr("readonly");
		$("#textarea1").removeAttr("readonly");
		$("#input4").removeAttr("readonly");
		$("#modify-submit1").removeClass("d-none");
	});
});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col">
				<h1>글 본문
					<button id="edit-button1" class="btn btn-secondary">
						<i class="fa-solid fa-pen-to-square"></i>
					</button>
				</h1>

				<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>


				<!-- 게시물 보기 + 수정 -->
				<form id="form1" action="${appRoot }/notice/modify"
					method="post">
					<input type="hidden" name="id" value="${notice.id }" />

					<div>
						<label for="input3" class="form-label">작성자</label>
						<input class="form-control" type="text"
							value="${notice.writerNickName }" />
					</div>

					<div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control" type="text" name="title" required
							id="input1" value="${notice.title }" />
					</div>

					<div>
						<label class="form-label" for="textarea1">본문</label>
						<div class="form-control" id="summernoteView" cols="30"
							rows="10">${notice.body }</div>
						<textarea class="form-control d-none" name="body" id="summernote">${notice.body }</textarea>
					</div>
					
					<div>
						<label for="input2" class="form-label">작성일시</label>
						<input class="form-control" type="datetime-local"
							value="${notice.inserted }" />
					</div>

					<button id="modify-submit1" class="btn btn-primary d-none">수정</button>
				</form>

				<c:url value="/notice/remove" var="removeLink" />
				<form action="${removeLink }" method="post">
					<input type="hidden" name="id" value="${notice.id }" />
					<button id="delete-submit1" class="btn btn-danger d-none">삭제</button>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>