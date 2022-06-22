<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
		<title>Strata by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${appRoot}/resources/css/designer/main.css" />
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<!--<a href="#" class="image avatar"><img src="images/avatar.jpg" alt="" /></a> -->
					<h1><strong>DisignerName</strong><br>
							<h2> ${member.id }</h2><br>
						<h1><strong>Email</strong><br />
							<h2> ${member.email }</h2><br>
							<h1><strong>NickName</strong><br />
								<h2> ${member.nickName }</h2><br>
			
				</div>
			</header>

		<!-- Main -->
			<div id="main">

				<!-- One -->
					<section id="one">
						<header class="major">
							<h2>자기소개</h2>
						</header>
						<p>${member.introduce }</p>
						
					</section>

				<!-- Two -->
					<section id="two">
						<h2>Recent Work</h2>
						<div class="row">
							<article class="col-6 col-12-xsmall work-item">
								<a href="images/fulls/01.jpg" class="image fit thumb"><img src="images/thumbs/01.jpg" alt="" /></a>
								<h3>Magna sed consequat tempus</h3>
								<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
							</article>
							<article class="col-6 col-12-xsmall work-item">
								<a href="images/fulls/02.jpg" class="image fit thumb"><img src="images/thumbs/02.jpg" alt="" /></a>
								<h3>Ultricies lacinia interdum</h3>
								<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
							</article>
							<article class="col-6 col-12-xsmall work-item">
								<a href="images/fulls/03.jpg" class="image fit thumb"><img src="images/thumbs/03.jpg" alt="" /></a>
								<h3>Tortor metus commodo</h3>
								<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
							</article>
							<article class="col-6 col-12-xsmall work-item">
								<a href="images/fulls/04.jpg" class="image fit thumb"><img src="images/thumbs/04.jpg" alt="" /></a>
								<h3>Quam neque phasellus</h3>
								<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
							</article>
							<article class="col-6 col-12-xsmall work-item">
								<a href="images/fulls/05.jpg" class="image fit thumb"><img src="images/thumbs/05.jpg" alt="" /></a>
								<h3>Nunc enim commodo aliquet</h3>
								<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
							</article>
							<article class="col-6 col-12-xsmall work-item">
								<a href="images/fulls/06.jpg" class="image fit thumb"><img src="images/thumbs/06.jpg" alt="" /></a>
								<h3>Risus ornare lacinia</h3>
								<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
							</article>
						</div>
						<ul class="actions">
							<li><a href="#" class="button">Full Portfolio</a></li>
						</ul>
					</section>

		
			</div>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<ul class="copyright">
						<li>&copy; TRAZAR</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="${appRoot}/resources/css/designer/jquery.min.js"></script>
			<script src="${appRoot}/resources/css/designer/jquery.poptrox.min.js"></script>
			<script src="${appRoot}/resources/css/designer/browser.min.js"></script>
			<script src="${appRoot}/resources/css/designer/breakpoints.min.js"></script>
			<script src="${appRoot}/resources/css/designer/util.js"></script>
			<script src="${appRoot}/resources/css/designer/main.js"></script>

	</body>

<%-- 
					<div>
					<input type="hidden" name="id" value="${member.id }">
					<label for="name" class="form-label">
					이름
					</label>
					<input id="name" class="form-control" type="text" name="name" value="${member.name }" />
		
					
					<label for="email class="form-label">
					이메일
					</label>
						<input class="form-control" type="text" name="email"  id="email" value="${member.email }" /> 
	
					<label for="nickName" class="form-label">
					닉네임
					</label>
						<input class="form-control" type="text" name="nickName" id="nickName" value="${member.nickName }"/>  --%>
		
		
<%-- 
					<label for="introduce" class="form-label">
					자기소개
					</label>
					<div class="input-group">
						<input type="text" name="introduce" value="${member.introduce }" size="74" id="introduce" /> 
					</div> --%>
	