<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" 
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
<title>Strata by HTML5 UP</title>
 
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${appRoot }/resources/css/designer/main.css" />
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
						
							<h2>	<a href="/trazar/designBoard/list"><img src="${appRoot }/resources/picture/logo/자기소개.png" /></a>자기소개</h2> 
						</header>
						<p>${member.introduce }</p>
						
					</section>

				<!-- Two -->
					<section id="two">
						<h2>Recent Work</h2>
			
						<div class="row">
						<c:forEach items="${designerBoardList}" var="designBoard" varStatus="status">
							<input type="hidden" name="memberId" value="${designBoard.memberId }" />
							<article class="col-6 col-12-xsmall work-item">
								<a href="" class="image fit thumb"><img src="images/thumbs/01.jpg" alt="" /></a>
							
								<c:url value="/designBoard/get" var="designBoardUrl">
									<c:param name="id" value="${designBoard.id }"></c:param>
									<c:param name="memberId" value="${designBoard.memberId }"></c:param>
									</c:url>
							
							<a href="${designBoardUrl }"><h3>${designBoard.title }</h3></a>
								<p>${designBoard.inserted }</p>
							</article>
							</c:forEach>						
						</div>
					
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
</html>
