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

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<style>
.MainHome {
	display: grid;
	grid-template-columns: 5% 62% 4% 10% 10%;
	grid-template-rows: 45% 5% 60% 5% 90% 10%;
	height: 100%;
	grid-gap: 0.5%;
	grid-template-areas: 
		'left-side main main main right right-side'
		'left-side other other other other other'
		'left-side content content content content content'
		'footer footer footer footer footer footer';
}

.left-side {
	grid-area: left-side;
	padding-left: 10%;
}

.main1 {
	grid-area: main;	
	padding-top : 50px;
}

.right {
	grid-area: right;
	justify-content : space-around;
	padding-top : 100px;
}

.card {
	justify-content : space-around;
}

.right-side {
	grid-area : right-side;
	padding-right : 10%
}

.other {
	grid-area: other;
}

.content {
	grid-area: content;
}

.footer {
	grid-area: footer;
}

.totalLayout {
	justify-content: space-around;
}

.totalLayout-title {
	margin: 20px 0
}

.list-titles {
	color: black;
	font-size: 20px;
	font-stretch: normal;
	font-style: normal;
	letter-spacing: -0.4px;
	font-weight: 700;
	line-height: 19px;
	align-items: center;
	color: #161C1C;
}

.main-lists:after {
	content: "";
	display: block;
	clear: both;
}

.main-lists {
	display: flex;
	flex-wrap: wrap;
	gap: 60px;
}

.project-list-mini {
	max-width: 250px;
	margin-bottom: 55px;
	margin-right: 20px;
}

.design-name {
	margin-top: 15px;
	color: gray;
	text-align: center;
}

.main-lists .thumbnail-image img  {
	width: 270px;
	height: 270px;
	border: 1px solid #E1F6FA;
	border-radius: 30px;
}

.main-project-title {
	font-size: 11pt;
	font-weight: bold;
	height: 40px;
	margin: 8px 0;
	text-align: center;
}
</style>

<title>Insert title here</title>
</head>

<c:if test="${param.msg != null }">
	<script>
		alert("아이디와 패스워드를 확인 해주세요.")
	</script>
</c:if>


<body>
	<my:mainNav/>
	<div class="MainHome">

		<div class="left-side">
		
		</div>
		<div class="main1">
			<div class="totalLayout">
				<div class="totalLayout-title">
					<h3 class="list-titles">hot creator🔥</h3>
				</div>

				<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>

				<div class="main-lists">
					<c:forEach items="${designBoardList }" var="designBoard">
						<div class="project-list-mini">
							<c:url value="/designBoard/get" var="getUrl">
								<c:param name="id" value="${designBoard.id }"></c:param>
								<c:param name="memberId" value="${designBoard.memberId }"></c:param>
							</c:url>
							<a href="${getUrl }" class="list-thumbnail">
								<div class="thumbnail-image">
									<img src="${designBoard.imgthumbnail }">
								</div>
									</a>
									
								<c:url value="/designer/view" var="viewUrl">
								<c:param name="memberId" value="${designBoard.memberId }" ></c:param>
								</c:url>
								<a href="${viewUrl }" >
								<div class="design-name">${designBoard.id}ㅣ
									${designBoard.writerNickName }</div>
									</a>
								
								<div class="main-project-title">${designBoard.title }
									${designBoard.prettyInserted }</div>
						
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="card" style="padding-top : 50px; height: 35%; width: 130%; cursor: pointer;"
				onclick="location.href='https://www.google.com';">
				<img src="../resources/picture/ad/구글1.PNG" class="card-img-top">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<ul class="fa-ul custom-list">
						  
						<!-- <li>
							<i class="fa fa-check fa-fw"></i>
							광고내용
						</li> -->
					</ul>
				</div>
			</div>
			<div class="card" style="padding-top : 50px; height: 35%; width: 130%; cursor: pointer;"
				onclick="location.href='https://www.naver.com';">
				<img src="../resources/picture/ad/네이버.PNG" class="card-img-top">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<ul class="fa-ul custom-list">
						 
						<!-- <li>
							<i class="fa fa-check fa-fw"></i>
							광고내용
						</li> -->
					</ul>
				</div>
			</div> 
		</div>
		
		<div clss="right-side"></div>
		<div class="other">
			<div class="totalLayout-title ">
				<h3 class="list-titles " style="margin-top: 40px;">작품</h3>
				<c:url value="/designBoard/search" var="searchUrl"></c:url>
		  <form action="${searchUrl }" class=" float-start">
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
			</div>
		</div>
		<div class="content">
			<div class="totalLayout">
				<!-- <div class="totalLayout-title">
					<h3 class="list-titles">hot creator🔥</h3>
				</div>

				<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>  -->

				<div class="main-lists">
					<c:forEach items="${designBoardList }" var="designBoard">
						<div class="project-list-mini">
							<c:url value="/designBoard/get" var="getUrl">
								<c:param name="id" value="${designBoard.id }"></c:param>
								<c:param name="memberId" value="${designBoard.memberId }"></c:param>
							</c:url>
							<a href="${getUrl }" class="list-thumbnail">
								<div class="thumbnail-image">
									<img src="${designBoard.imgthumbnail }">
								</div>
								<div class="design-name">${designBoard.id}ㅣ
									${designBoard.writerNickName }</div>
								<div class="main-project-title">${designBoard.title }
									${designBoard.prettyInserted }</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="footer">
			<my:footer></my:footer>
		</div>
	</div>

</body>
</html>