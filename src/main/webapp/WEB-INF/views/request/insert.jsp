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
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script
	 src="https://cdn.ckeditor.com/ckeditor5/10.1.0/classic/ckeditor.js"></script>
<style>
.ck-editor__editable {
	height: 400px;
}
</style>
<script>
	 $(document).ready(function() {
		 ClassicEditor	.create( document.querySelector( '#ckEditor' ), {		language:"ko"	})	.then(function (editor) {		editoro = editor;		editor.plugins.get("FileRepository").createUploadAdapter = function (loader) {			return new CustomUploadAdapter(loader, "/images/board/press", function (result) {				var fileSeq = isEmpty(result[0]) ? "noimage" : result[0];				var imageUrl = window.location.protocol + "//" + window.location.host + "/image/" + fileSeq;				return {"default" : imageUrl};			});		};	})	.catch(function (error) {		console.log( error );	} );
		
		 
		 var CustomUploadAdapter = function (loader, path, fn_resolve) {	this.constructor = function ( loader ) {		this.loader = loader;		this.path = path;		this.fn_resolve = fn_resolve;	};	this.upload = function () {		return new Promise(function (resolve, reject) {			this.xhr = ajax_file_upload({				loader: loader,				resolve: resolve,				reject: reject,				files: [loader.file],				path: path,				fn_progress: function (e) {					e.lengthComputable && (loader.uploadTotal = e.total, loader.uploaded = e.loaded);				},				fn_success: function (e) {					resolve(fn_resolve && fn_resolve(e));				},				fn_error: function (e) {					reject("upload fail =>" + `${loader.file.name}.`);				},				fn_abort: reject			});		});	};	this.abort = function () {		return this.xhr.abort && this.xhr.abort();	}};
		 
		 function ajax_file_upload(p) {	if (!p.files || !p.loader || !p.path) return new XMLHttpRequest;		var formData = new FormData();		for (var idx in p.files) {			formData.append("uploadfile", p.files[idx]);		}		formData.append("path", p.path);				return $.ajax({			url: '/request/Imageupload',			processData: false,			contentType: false,			data: formData,			type: 'POST',			onprogress: function (e) {				p.fn_progress && p.fn_progress(e);			},			success: function(e){				p.fn_success && p.fn_success(e);			},			error: function (e) {				p.fn_error && p.fn_error;			},			abort: function (e) {				p.fn_abort && p.fn_abort(e);			}		});	}
		 
		 /* $('#summernote').summernote({
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
			}); */
		});
	
	  /* function goWrite(frm) {
			var title = frm.title.value;
			
			
			if (title.trim() == ''){
				alert("제목을 입력해주세요");
				return false;
			}
			
			frm.submit();
		} */
  </script>

<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<h2 class="text-center">
				요청 사항
				<i class="fa-solid fa-pen-to-square"></i>
			</h2>

			<c:url value="/request/insert" var="writeLink" />

			<form action="${writeLink }" method="post">

				<div>
					<label class="form-label" for="input1">제목</label>
					<input class="form-control" type="text" name="title" required
						id="input1" />
				</div>

				기간
				<input type="text" name="term" />

				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox1" value="option1">
					<label class="form-check-label" for="inlineCheckbox1">웹디자인</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox2" value="option2">
					<label class="form-check-label" for="inlineCheckbox2">일러스트</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox3" value="option3">
					<label class="form-check-label" for="inlineCheckbox3">그외</label>
				</div>

				<div>
					<label class="form-label">내용</label>
					<textarea name="body" id="ckEditor"></textarea>
				</div>

				<div>
					<label class="form-label" for="input1">예산</label>
					<input class="form-control" type="text" name="price" required
						id="input2" />
				</div>
				<button class="btn btn-outline-secondary mt-3">등록</button>
			</form>
		</div>
	</div>
</body>
</html>