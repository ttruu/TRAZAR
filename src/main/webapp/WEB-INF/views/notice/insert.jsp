<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	 <script>
	  $(document).ready(function() {
	        $('#summernote').summernote({
	        	 // 에디터 높이
	      	  height: 150,
	      	  // 에디터 한글 설정
	      	  lang: "ko-KR",
	      	  focus : true,
	      	  toolbar: [
	      		    // 글꼴 설정
	      		    ['fontname', ['fontname']],
	      		    // 글자 크기 설정
	      		    ['fontsize', ['fontsize']],
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
	      		  // 추가한 글꼴
	      		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	      		 // 추가한 폰트사이즈
	      		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	       
	        });
	    });
	  function goWrite(frm) {
			var title = frm.title.value;
			var body = frm.body.value;
			
			if (title.trim() == ''){
				alert("제목을 입력해주세요");
				return false;
			}
			if (body.trim() == ''){
				alert("내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
  </script>


	<c:url value="/notice/insert" var="writeLink" />	
	
	<form action="${writeLink }" method="post">

			<div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control" type="text" name="title" required id="input1" />
					</div>
					
					<div>
						<label class="form-label" for="textarea1">본문</label>
						<textarea class="form-control" name="body" id="summernote" cols="30" rows="10"></textarea>
					
					</div>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</body>
</html>










