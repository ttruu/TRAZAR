<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
		
	
		
</script>

<title>Insert title here</title>
</head>
<body>


	

	
	<form action="${appRoot }/notice/modify" method="post">
	<input type="hidden" name="id" value="${notice.id }" />
	
	제목 : <input type="text" value="${notice.title }" name="title" /> <br />
	
	본문 : <textarea cols="30" rows="10" name="body" >${notice.body }</textarea> <br />
	
	작성일시 : <input type="datetime-local" value="${notice.inserted }" readonly /> <br />
	
	<button>수정</button>
	</form>
	
	<c:url value="/notice/remove" var="removeLink" />
	<form action="${removeLink }" method="post">
		<input type="hidden" name="id" value="${notice.id }"/>
		<button>삭제</button>
	</form>
	
	<hr />
	
	
	
</body>
</html>


	
				








