<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<!-- <head> -->
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
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css"
	integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js"
	integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css"
	integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js"
	integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Post - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${appRoot }/resources/css/requestGet/styles.css" rel="stylesheet" />
</head>

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
						url : '/request/Imageupload',
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

 <body>
 		<my:navBar/>
 		<form id="form" action="${appRoot }/request/modify" method="post">
 		<input type="hidden" name="id" value="${request.id }" />
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <div>
								<label class="form-label" for="input1">제목</label>
								<input class="form-control" type="text" name="title" required
									id="input1" value="${request.title }" />
							</div>
                            <!-- Post meta content-->
                            <%-- <div class="text-muted fst-italic mb-2">${request.inserted }</div> --%>
                            <!-- Post categories-->
                            <%-- <a class="badge bg-secondary text-decoration-none link-light" >${request.memberId }</a> --%>
                        </header>
                        <!-- Preview image figure-->
                        <!-- <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure> -->
                        <!-- Post content-->
                        <section class="mb-5">
							<label class="form-label">내용</label>
							<textarea name="body" id="summernote">${request.body }</textarea>
                        </section>
                    </article>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Side widget-->
                    <div class="card mb-4">
	                    <select id="select1" class="form-select d-none"
							aria-label="Default select example" name="state">
							<option selected>상태 선택하기</option>
							<option value="대기중">대기중</option>
							<option value="진행중">진행중</option>
							<option value="완료">완료</option>
						</select>
					</div>
					
					<div class="card mb-4">
                        <div class="card-header">기간</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input name="term" class="form-control" type="text" value="${request.term }" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="card mb-4">
                        <div class="card-header">예산</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input name="price" class="form-control" type="text" value="${request.price }" />
                            </div>
                        </div>
                    </div>
                    <button id="modify-submit1" class="btn btn-outline-primary">수정</button>
                </div>
            </div>
        </div>
        </form>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${appRoot }/resources/css/requestGet/scripts.js"></script>
    </body>
    
    <%-- <title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>
					글 본문
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="principal" />
						<c:if test="${principal.username == request.memberId }">
							<button id="edit-button1" class="btn btn-secondary">
								<i class="fa-solid fa-pen-to-square"></i>
							</button>
						</c:if>
					</sec:authorize>
				</h1>
				<form id="form" action="${appRoot }/request/modify" method="post">
					<input type="hidden" name="id" value="${request.id }" />
					<div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control mb-3" type="text" name="title" required
							id="input1" value="${request.title }" readonly />
					</div>

					<select id="select1" class="form-select d-none"
						aria-label="Default select example" name="state">
						<option selected>상태 선택하기</option>
						<option value="대기중">대기중</option>
						<option value="진행중">진행중</option>
						<option value="완료">완료</option>
					</select>

					<div>
						<label class="form-label" for="textarea1">본문</label>
						<div id="view">${request.body }</div>
						<textarea class="form-control d-none" name="body" id="summernote">${request.body }</textarea>
					</div>

					<div>
						<label for="input3" class="form-label">작성자</label>
						<input id="input3" class="form-control mb-3" type="text"
							value="${request.memberId }" readonly />
					</div>

					<div>
						<label class="form-label" for="input4">예산</label>
						<input class="form-control mb-3" type="text" name="price" required
							id="input4" value="${request.price }" readonly />
					</div>

					<div>
						<label for="input2" class="form-label">작성일시</label>
						<input class="form-control mb-3" type="datetime-local"
							value="${request.inserted }" readonly />
					</div>

					<div>
						<label class="form-label" for="input5">연락처</label>
						<input class="form-control mb-3" type="text" name="phoneNum"
							id="input5" value="${request.phoneNum }" readonly />
					</div>

					<div>
						<label class="form-label" for="input6">기간</label>
						<input class="form-control mb-3" type="text" name="term"
							id="input6" value="${request.term }" readonly />
					</div>

					<button id="modify-submit1" class="btn btn-outline-primary d-none">수정</button>
					<button id="delete-submit1" class="btn btn-danger d-none">삭제</button>
				</form>
			</div>
		</div>
	</div>
</body> --%>
</html>