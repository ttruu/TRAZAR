<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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


<link href="${appRoot }/resources/css/designBoard/style.css"
	rel="stylesheet" type="text/css">
<noscript>
	<link rel="stylesheet"
		href="${appRoot }/resources/css/designBoard/noscript.css" />
</noscript>

<style>
.list-group-item {
	border: none;
}
</style>



<title>modify jsp</title>

<script>
	 $(document).ready(function() {
		 
		 $('#summernote').summernote({
			 	maximumImageFileSize: 1024*1024,
				height : 500,
				placeholder: '최대 500자 작성 가능합니다.',
				lang: 'ko-KR',
				toolbar : [
					// 폰트랑 폰트사이즈 다시 넣어줘야함
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview','fullscreen', 'help']]
				  ],
				onImageUpload : function(files, editor, welEditable) {
					console.log(files);
					console.log( files[0] );
					data = new FormData();
					data.append("file", files[0]);
					var $note = $(this);
					$.ajax({
						data : data,
						type : "POST",
						url : '/designBoard/Imageupload',
						cache : false,
						contentType : false,
						processData : false,
						success : function(url) {
							alert(url);
							$note.summernote('insertImage', url);
						}
					});
				}
			}); 
		});
</script>

</head>

<body>

	<my:navBar />

	<c:if test="${not empty message }">
		<div class="alert alert-light">${message }</div>
	</c:if>

	<!-- Page Content -->

	<form id="form1" action="${appRoot }/designBoard/modify" method="post">
		<input type="hidden" name="id" value="${designBoardModify.id }" />

		<div class="container">
			<div class="row">
				<div class="col-lg-9">

					<!-- 게시물 보기 + 수정 -->
					<div class="card shadow mb-4">

						<div class="card-body">

							<div class="form-group row" style="text-align: center;">
								<div class="mb-3 mb-sm-2" style="text-align: left;">
									<!-- 권한설정 -->
									<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal" var="principal" />
										<c:if test="${principal.username == designBoardModify.memberId }">
											<button id="edit-button1" class="btn btn-light">
												수정하기</button>
										</c:if>
									</sec:authorize>

									<c:url value="/designBoard/remove" var="removeLink" />
									<form action="${removeLink }" method="post">
										<input type="hidden" name="id" value="${designBoardModify.id }" />
										<button id="delete-submit1" class="btn btn-danger">삭제하기</button>
									</form>

								</div>
								<div class="col-sm-6 mb-3 mb-sm-2" style="">
									<label class="form-label" for="input1"></label>
									<input class="form-control d-none" maxlength="50" type="text"
										name="title" required id="input1"
										value="${designBoardModify.title }" readonly />
								</div>
								<div class="col-sm-3 mt-3">
									<i class="fa-solid fa-heart"></i>
									<h6 class="like">좋아요</h6>
								</div>
								<div class="col-sm-3 mt-3">
									<i class="fa-solid fa-eye"></i>
									<h6 class="like">조회수</h6>
								</div>
							</div>

							<div class="col-sm-6 mb-3 mb-sm-2" style="text-align: center;">
								<!-- <label class="form-label" for="textarea1"></label> -->
								<textarea class="form-control d-none" name="body" rows="30"
									cols="10" id="summernote" readonly>${designBoardModify.body }</textarea>
							</div>

							<div>
								<label for="input3" class="form-label">작성자</label>
								<input class="form-control" type="text"
									value="${designBoardModify.memberId }" readonly />
							</div>

						</div>
						<button id="modify-submit1" class="btn btn-primary d-none">수정</button>

					</div>
				</div>
			</div>
		</div>
	</form>



	<!-- Scripts -->
	<script src="${appRoot }/resources/css/designBoard/jquery.min.js"></script>
	<script src="${appRoot }/resources/css/designBoard/browser.min.js"></script>
	<script src="${appRoot }/resources/css/designBoard/breakpoints.min.js"></script>
	<script src="${appRoot }/resources/css/designBoard/util.js"></script>
	<script src="${appRoot }/resources/css/designBoard/main.js"></script>


</body>
</html>





