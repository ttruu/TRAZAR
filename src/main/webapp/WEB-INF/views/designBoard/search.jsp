<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko-KR">
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


<link rel="stylesheet" href="${appRoot }/resources/search/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${appRoot }/resources/search/css/noscript.css" />
</noscript>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="is-preload">
	<my:mainNav />
	
	<div id="wrapper">
		<div id="main">
	
			<c:forEach items="${designBoardList }" var="designBoard">
				<c:url value="/designBoard/get" var="getUrl">
					<c:param name="id" value="${designBoard.id }"></c:param>
					<c:param name="memberId" value="${designBoard.memberId }"></c:param>
				</c:url>
				<article class="thumb">
					<a href="${getUrl }" class="image">
						<img src="${designBoard.imgthumbnail }" alt="" />
					</a>
					<h2>${designBoard.title }</h2>
				</article>
			</c:forEach>

		</div>
	</div>

	<!-- Scripts -->
	<script src="${appRoot }/resources/search/js/jquery.min.js"></script>
	
	<script src="${appRoot }/resources/search/js/browser.min.js"></script>
	<script src="${appRoot }/resources/search/js/breakpoints.min.js"></script>
	<script src="${appRoot }/resources/search/js/main.js"></script>
	
<my:footer2/>

</body>
</html>











