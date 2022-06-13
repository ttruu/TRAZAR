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
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<my:navBar current="insert" />


	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
		    height: 500,                 // 에디터 높이
	          minHeight: null,             // 최소 높이
	          maxHeight: null,             // 최대 높이
	          focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	          lang: "ko-KR",					// 한글 설정
	         toolbar: [
	            // [groupName, [list of button]]
	            ['fontname', ['fontname']],
	            ['fontsize', ['fontsize']],
	            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	            ['color', ['forecolor','color']],
	            ['table', ['table']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['height', ['height']],
	            ['insert',['picture','link','video']],
	            ['view', ['fullscreen', 'help']]
	          ],
	        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			
		});
	});
		
	   
	</script>


	<div class="container">
		<div class="row">
			<div class="col">
				<h1>내용 작성</h1>
				<form action="${appRoot }/designBoard/insert" method="post">
					<div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control" type="text" name="title" required
							id="input1" />
					</div>

					<div>
						<label class="form-label" for="textarea1">본문</label>
						<textarea class="form-control" name="body" id="summernote"
							cols="30" rows="10"></textarea>
					</div>

					<div>
						<label class="form-label" for="input1">가격</label>
						<input class="form-control" type="text" name="price" id="input1" />
					</div>

					<button class="btn btn-primary">업로드</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>