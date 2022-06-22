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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css"
	integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js"
	integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>	
<link href="${appRoot }/resources/css/style.css" rel="stylesheet"
	type="text/css">

<style>
.list-group-item {
	border: none;
}
.row {
	background-color: rgb(245, 245, 245);
}

.form-control {
	border-radius : 5px;
}
</style>
<script>
$(document).ready(function() {

CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
    width:'100%',
    height:'400px',
    filebrowserUploadUrl:  "fileupload.do"
});
)};
</script>


<title>modify jsp 임 !!!!!!!!!!!!!!!!!!!!!!!!!!</title>


</head>
<body>

	<my:navBar />


		<div class="container">
			<div class="row">
				<div class="col">
					
					<c:if test="${not empty message }">
						<div class="alert alert-primary">${message }</div>
					</c:if>


					<!-- 게시물 보기 + 수정 -->
					<form id="form1" action="${appRoot }/designBoard/modify"
						method="post">
						<input type="hidden" name="id" value="${designBoard.id }" />

						<div>
							<label class="form-label" for="input1"></label>
							<input class="form-control" maxlength="50" placeholder="제목을 입력하세요" type="text" name="title" required
								id="input1" value="${designBoard.title }" />
						</div>

						<div style="background-color: rgb(255, 255, 255);">
							<label class="form-label" for="textarea1"></label>
						 	<div class="form-control" id="textarea" >${designBoard.body }</div>
						</div>
						
						<div>
							<label for="input3" class="form-label">작성자</label>
							<input class="form-control" type="text"
								value="${designBoard.writerNickName }" />
						</div>

						<button id="modify-submit1" class="btn btn-primary">수정</button>
					</form>

					<c:url value="/designBoard/remove" var="removeLink" />
					<form action="${removeLink }" method="post">
						<input type="hidden" name="id" value="${designBoard.id }" />
						<button id="delete-submit1" class="btn btn-danger">삭제</button>
					</form>

					<a href="${appRoot }/request/insert">요청</a>
				</div>
			</div>
		</div>

</body>
</html>





