<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

		<c:url value="/notice/insert" var="writeLink" />

	<h1><a href="${writeLink }">글 쓰기</a></h1>

	<h1>글 목록</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>inserted</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noticeList }" var="notice">
				<tr>
					<td>${notice.id }</td>
					<td>
					
					<c:url value="/notice/${notice.id }" var="link"></c:url>
					
					<a href="${link }">
						${notice.title }
					</a>
					
	
					</td>
					<td>${notice.inserted }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>










