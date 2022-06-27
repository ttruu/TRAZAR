<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" 
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

    
    
    <!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css" integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js" integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
	<my:navBar current="insert" />
	 <script>
	 $(document).ready(function() {
			
			$('#summernote').summernote({
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
						url : '/notice/imageupload',
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
	
	  function goWrite(frm) {
			var title = frm.title.value;
			
			
			if (title.trim() == ''){
				alert("제목을 입력해주세요");
				return false;
			}
			
			frm.submit();
		}
  </script>
<div class="container">
		<div class="row">
			<div class="col">
				<h1>내용 작성</h1>
				<form action="${appRoot }/notice/insert" method="post" enctype="multipart/form-data">
						<div>	
						<input class="form-control" type="hidden" value="${notice.writerNickName }" />
					</div>
					<div>
						<label class="form-label" for="inputNoticeTitle">제목</label>
						<input class="form-control" type="text" name="title" required
							id="input1" />
					</div>

					<div>
						<label class="form-label" >본문</label>
						<textarea name="body" id="summernote"></textarea>
					</div>

					

					<button class="btn btn-primary" onclick="goWrite(this.form)">업로드</button>
				</form>
			</div>
		</div>
	</div>

		
				

</body>
</html>










