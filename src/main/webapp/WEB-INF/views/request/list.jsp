<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>

<%-- <title>Insert title here</title>
</head>
<body>
<my:navBar/>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>의뢰 목록</h1>
				<table class="table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>제목</th>
							<th>예산</th>
							<th>요청 시간</th>
							<th>요청 처리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestList }" var="req" varStatus="status">
						<input type="hidden" name="memberId" value="${req.memberId }" />
							<tr>
								<td>${req.memberId }</td>
								<td>
													
									<c:url value="/request/get" var="getUrl">
										<c:param name="id" value="${req.id }"></c:param>
										<c:param name="memberId" value="${req.memberId }"></c:param>
										<c:param name="designBoardId" value="${req.designBoardId }"></c:param>
									</c:url>
									
									<a href="${getUrl }">
										<c:out value="${req.title }" />
									</a>
									
								</td>
								<td>${req.price }</td>
								<td>${req.inserted }</td>
								<td>${req.state }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<form action="${appRoot }/request/insert">
				<button id="requestAdd" class="btn btn-primary">의뢰 작성</button>
			</form>
		</div>
	</div>
</body> --%>

<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${appRoot }/resources/css/requestList/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${appRoot }/resources/css/requestList/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <my:navBar/>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Commission</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Write your commission here</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		        	<c:forEach items="${requestList }" var="req" varStatus="status">
						<input type="hidden" name="memberId" value="${req.memberId }" />
							<c:url value="/request/get" var="getUrl">
								<c:param name="id" value="${req.id }"></c:param>
								<c:param name="memberId" value="${req.memberId }"></c:param>
							</c:url>
		                    <div class="col mb-5">
		                        <div class="card h-100">
		                            <!-- Product image-->
		                            <img class="card-img-top" src="${req.imgthumbnail }" alt="..." />
		                            <!-- Product details-->
		                            <div class="card-body p-4">
		                                <div class="text-center">
		                                    <!-- Product name-->
		                                    <h5 class="fw-bolder">${req.title }</h5>
		                                    <!-- Product price-->
		                                    $40.00 - $80.00
		                                </div>
		                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${getUrl }">View options</a></div>
                            	</div>
                        	</div>
                    	</div>
            		</c:forEach>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${appRoot }/resources/css/requestList/scripts.js"></script>
        <form action="${appRoot }/request/insert">
				<button id="requestAdd" class="btn btn-primary">의뢰 작성</button>
			</form>
    </body>
</html>