<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<!-- <head> -->
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
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
							/* alert(url); */
							$note.summernote('insertImage', url);
						}
					});
				}
			}); 
		});
		
	 	// 이미지없을시에 alert 띄우기
	   function goWrite(frm) {
			let body = $("<div>" +  frm.body.value + "</div>");
			let imgElems = body.find("img");
			
			console.log(body);
			console.log("그림수", imgElems.length);
			
			if (imgElems.length <= 0) {
				alert("사진을 넣어주세요");
			} else {
				frm.submit();
			} 
			
			
			/* if (body.trim() == ''){
				alert("사진을 입력해주세요");
				return false;
			}
			
			frm.submit(); */
		}
</script>


<head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Home - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${appRoot }/resources/css/requestInsert/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${appRoot }/resources/css/requestInsert/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <my:navBar/>
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Welcome to Commission!</h1>
                    <p class="lead mb-0">Write your commission</p>
                </div>
            </div>
        </header>
        <form action="${appRoot }/request/insert" method="post">
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control" type="text" name="title" required
							id="input1" />
					</div>
                    <div>
						<label class="form-label">내용</label>
						<textarea name="body" id="summernote"></textarea>
					</div>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">예산</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input name="price" class="form-control" type="text" placeholder="예산을 입력해주세요." aria-label="예산을 입력해주세요."  />
                            </div>
                        </div>
                    </div>
                    
                    <div class="card mb-4">
                        <div class="card-header">기간</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input name="term" class="form-control" type="text" placeholder="기간을 입력해주세요." aria-label="기간을 입력해주세요."  />
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <select name="categoryName" >
							<option value="illust">일러스트레이션</option>
							<option value="web">웹 디자인</option>
							<option value="interior">인테리어</option>
						</select>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                    </div>
                    <button type="button" class="btn btn-outline-secondary mt-3" onclick="goWrite(this.form)">등록</button>
                </div>
            </div>
        </div>
        </form>
        <!-- Footer-->
	        <my:footer2/>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${appRoot }/resources/css/requestInsert/scripts.js"></script>
    </body>


</html>