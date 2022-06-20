<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<style>
.MainHome {
	display: grid;
	grid-template-columns: 5% 60% 0% 10% 10%;
	grid-template-rows: 30% 100% 30% 600% 150%;
	height: 100%;
	grid-gap: 1%;
	grid-template-areas: 'header header header header header header'
		'left-side main main main right right'
		'left-side other other other other other'
		'left-side content content content content content'
		'footer footer footer footer footer footer';
}

.header {
	grid-area: header;
	background-color: pink;
	display: flex;
	justify-content: center;
}

.left-side {
	grid-area: left-side;
	background-color: grey;
}

.main1 {
	grid-area: main;
}

.hot-creators-title {
	font-size: 16px;
	font-stretch: normal;
	font-style: normal;
	letter-spacing: -0.4px;
	font-weight: 700;
	line-height: 19px;
	align-items: center;
	color: #161C1C;
}

.card-box {
	display : inline-flex;
}

.right {
	grid-area: right;
}

.other {
	grid-area: other;
	background-color: grey;
}

.content {
	grid-area: content;
	background-color: purple;
}

.footer {
	grid-area: footer;
	background-color: green;
}
</style>

</head>
<body>
	<div class="MainHome">
		<div class="header">
			<my:navBar current="list" />
		</div>
		<div class="left-side">left-side</div>
		<div class="main1">
			<br />
			<div class="hot-creators-title">HOT 크리에이터🔥</div>
			<br />
			<div class="card-box">
				<div class="card" style="height: 100%; width: 100%; cursor: pointer;"
					onclick="location.href='/trazar/designBoard/get';">
					<img src="../resources/picture/main/sample.png"
						class="card-img-top">
					<div class="card-body" style="text-align: center;">
						<h5 class="card-title">디자이너1</h5>
					</div>
				</div>
			</div>
			<div class="card-box">
				<div class="card" style="height: 100%; width: 100%; cursor: pointer;"
					onclick="location.href='/trazar/designBoard/get';">
					<img src="../resources/picture/main/sample.png"
						class="card-img-top">
					<div class="card-body" style="text-align: center;">
						<h5 class="card-title">디자이너1</h5>
					</div>
				</div>
			</div>
			<div class="card-box">
				<div class="card" style="height: 100%; width: 100%; cursor: pointer;"
					onclick="location.href='/trazar/designBoard/get';">
					<img src="../resources/picture/main/sample.png"
						class="card-img-top">
					<div class="card-body" style="text-align: center;">
						<h5 class="card-title">디자이너1</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="card" style="height: 100%; width:100%; cursor: pointer;"
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
		<div class="other">Other</div>
		<div class="content">Content</div>
		<div class="footer">Footer</div>
	</div>
</body>
</html>






























