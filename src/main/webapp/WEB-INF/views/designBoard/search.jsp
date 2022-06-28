F<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<noscript><link rel="stylesheet" href="${appRoot }/resources/search/css/noscript.css" /></noscript>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body class="is-preload pt-5">
<my:navBar/>
<c:url value="/designBoard/search" var="searchUrl"></c:url>
  <form action="${searchUrl }" class="center">
      	<div class="input-group">
	      	<!-- select.form-select>option*3 -->
	      	<select name="type" id="" class="form-select" style="flex:0 0 100px;">
	      		<option value="bodyTitle" ${param.type != 'title' && param.type != 'body' ? 'selected' : '' }>제목+본문</option>
	      		<option value="title" ${param.type == 'title' ? 'selected' : '' }>제목</option>
	      		<option value="body" ${param.type == 'body' ? 'selected' : ''}>본문</option>
	      		<option value="writerNickName" ${param.type == 'writerNickName' ? 'selected' : ''}>작성자</option>
	      	</select>
	      
	      	<input type="search" class="form-control" name="keyword"/>
	      	<button class="btn btn-outline-success"><i class="fa-solid fa-magnifying-glass"></i></button>
      	</div>
      </form>
<div id="wrapper">
			<div id="main">
				<!-- <div class="totalLayout-title">
					<h3 class="list-titles">hot creator🔥</h3>
				</div>

				<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>  -->

					<c:forEach items="${designBoardList }" var="designBoard">
							<c:url value="/designBoard/get" var="getUrl">
								<c:param name="id" value="${designBoard.id }"></c:param>
								<c:param name="memberId" value="${designBoard.memberId }"></c:param>
							</c:url>
							<article class="thumb">
							<a href="${getUrl }" class="image"><img src="${designBoard.imgthumbnail }" alt="" /></a>
							<h2>${designBoard.title }</h2>
						</article>
					</c:forEach>
				
			</div>
		</div>

	<!-- Scripts -->
			<script src="${appRoot }/resources/search/js/jquery.min.js"></script>
			<script src="${appRoot }/resources/search/js/jquery.poptrox.min.js"></script>
			<script src="${appRoot }/resources/search/js/browser.min.js"></script>
			<script src="${appRoot }/resources/search/js/breakpoints.min.js"></script>
			<script src="${appRoot }/resources/search/js/util.js"></script>
			<script src="${appRoot }/resources/search/js/main.js"></script>
		<div class="footer">
			<my:footer></my:footer>
		</div>
		
</body>
</html>











