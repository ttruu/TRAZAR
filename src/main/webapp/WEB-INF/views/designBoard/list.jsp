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

	<my:navBar current="list" />
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="works-wrapper works-wrapper-top">
				<c:forEach items="${designBoardList }" var="designBoard">
		${designBoard.id}번 글 , 글쓴이 : ${designBoard.writerNickName }<br>
	
		썸네일 (썸네일을 누르면 해당 글로 이동) : <br>
		<c:url value="/designBoard/get" var="getUrl">
			<c:param name="id" value="${designBoard.id }"></c:param>
			<c:param name="memberId" value="${designBoard.memberId }"></c:param>
		</c:url>
		<a href="${getUrl }">
			<img src="${designBoard.imgthumbnail }" width="150px"
				height="150px">
		</a>
		<hr />
		</c:forEach>
				</div>
		</div>
	</div>
</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>메인페이지</h1>

				<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>

				<table class="table table-striped">
					<thead>
						<tr>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${designBoardList }" var="designBoard">
							<tr>
								<td>${designBoard.id }</td>
								<td>
									<c:url value="/designBoard/get" var="getUrl">
										<c:param name="id" value="${designBoard.id }"></c:param>
										<c:param name="memberId" value="${designBoard.memberId }"></c:param>
									</c:url>

									<a href="${getUrl }">
										<c:out value="${designBoard.title }"></c:out>
									</a>
								</td>
								<td>${designBoard.writerNickName }</td>
								<td>${designBoard.prettyInserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 광고 구현 (해당 이미지 클릭 시 url로 넘어감) -->
				<div class="card" style="width: 20rem; cursor: pointer;"
					onclick="location.href='https://www.google.com';">
					<img src="../resources/picture/ad/구글1.PNG" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">광고</h5>
						<ul class="fa-ul custom-list">
							<!--  
						<li>
							<i class="fa fa-check fa-fw"></i>
							광고내용
						</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
</body>
</html>