<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko-KR">

<%-- <c:if test="${param.msg != null }">
	<script>
		alert("아이디와 패스워드를 확인 해주세요.")
	</script>
</c:if> --%>
<%-- <body>

		<div class="header">
			<my:navBar current="list" />
		</div>

		<div class="left-side">
			<my:sideNavBar></my:sideNavBar>
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
		<div class="right">
			<div class="card" style="height: 50%; width: 100%; cursor: pointer;"
				onclick="location.href='https://www.google.com';">
				<img src="../resources/picture/ad/구글1.PNG" class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">구글</h5>
					<ul class="fa-ul custom-list">
						<!--  
						<li>
							<i class="fa fa-check fa-fw"></i>
							광고내용
						</li> -->
					</ul>
				</div>
			</div>
			<div class="card" style="height: 50%; width: 100%; cursor: pointer;"
				onclick="location.href='https://www.naver.com';">
				<img src="../resources/picture/ad/네이버.PNG" class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">네이버</h5>
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
		<div class="other">
			<div class="totalLayout-title">
				<h3 class="list-titles" style="margin-top: 40px;">작품</h3>
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


</body> --%>
<head>
<title>Phantom by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${appRoot }/resources/css/main/main.css" />
<noscript>
	<link rel="stylesheet"
		href="${appRoot }/resources/css/main/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Logo -->
				<a href="/trazar/designBoard/list" class="logo">
					<span class="symbol">
						<img src="../resources/picture/logo/로고.png" alt="" />
					</span>
					<span class="title">TRAZAR</span>
				</a>

				<!-- Nav -->
				<nav>
					<ul>
						<li>
							<a href="#menu">Menu</a>
						</li>
					</ul>
				</nav>

			</div>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li>
					<a href="index.html">Home</a>
				</li>
				<li>
					<a href="generic.html">Ipsum veroeros</a>
				</li>
				<li>
					<a href="generic.html">Tempus etiam</a>
				</li>
				<li>
					<a href="generic.html">Consequat dolor</a>
				</li>
				<li>
					<a href="elements.html">Elements</a>
				</li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>It's a site that deals in designer's works.</h1>
				</header>
				<section class="tiles">
					<article class="style2">
						<div class="main-lists">
							<c:forEach items="${designBoardList }" var="designBoard">
								<span class="image">
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
								</span>
							</c:forEach>
						</div>
					</article>
				</section>
			</div>
		</div>

		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<!-- <section>
					<h2>Get in touch</h2>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<input type="text" name="name" id="name" placeholder="Name" />
							</div>
							<div class="field half">
								<input type="email" name="email" id="email" placeholder="Email" />
							</div>
							<div class="field">
								<textarea name="message" id="message" placeholder="Message"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li>
								<input type="submit" value="Send" class="primary" />
							</li>
						</ul>
					</form>
				</section> 
				<!-- <section>
					<h2>Follow</h2>
					<ul class="icons">
						<li>
							<a href="#" class="icon brands style2 fa-twitter">
								<span class="label">Twitter</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon brands style2 fa-facebook-f">
								<span class="label">Facebook</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon brands style2 fa-instagram">
								<span class="label">Instagram</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon brands style2 fa-dribbble">
								<span class="label">Dribbble</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon brands style2 fa-github">
								<span class="label">GitHub</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon brands style2 fa-500px">
								<span class="label">500px</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon solid style2 fa-phone">
								<span class="label">Phone</span>
							</a>
						</li>
						<li>
							<a href="#" class="icon solid style2 fa-envelope">
								<span class="label">Email</span>
							</a>
						</li>
					</ul>
				</section> -->
				<ul class="copyright">
					<li>&copy; Untitled. All rights reserved</li>
					<li>
						Design:
						<a href="http://html5up.net">HTML5 UP</a>
					</li>
				</ul>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="${appRoot }/resources/css/main/jquery.min.js"></script>
	<script src="${appRoot }/resources/css/main/browser.min.js"></script>
	<script src="${appRoot }/resources/css/main/breakpoints.min.js"></script>
	<script src="${appRoot }/resources/css/main/util.js"></script>
	<script src="${appRoot }/resources/css/main/main.js"></script>

</body>
</html>