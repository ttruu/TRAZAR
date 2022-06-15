<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
$(document).ready(function() {
	$(".accept-submit1").click(function(e) {
		e.preventDefault();
	
		if (confirm("수락하시겠습니까?")) {
			let form1 = $(".form2");
			let actionAttr = "${appRoot}/chat";
			form1.attr("action", actionAttr);
	
			form1.submit();
		}
	
	});
	
	$(".reject-submit1").click(function(e) {
		e.preventDefault();
	
		if (confirm("거절하시겠습니까?")) {
			let form1 = $(".form2");
			let actionAttr = "${appRoot}/request/remove";
			form1.attr("action", actionAttr);
	
			form1.submit();
		}
	
	});
});
</script>

<title>Insert title here</title>
</head>
<body>
						<div class="container">
		<div class="row">
			<div class="col">
				<h1>글 목록</h1>
				
				<table class="table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>제목</th>
							<th>가격</th>
							<th>요청 시간</th>
							<th>요청 처리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestList }" var="req">
							<tr>
								<td>${req.memberId }</td>
								<td>
													
									<c:url value="/request/get" var="getUrl">
										<c:param name="id" value="${req.id }"></c:param>
									</c:url>
									
									<a href="${getUrl }">
										<c:out value="${req.title }" />
									</a>
									
									<%-- <c:if test="${board.numOfReply > 0 }">
										<span class="badge rounded-pill bg-light text-dark">
											<i class="fa-solid fa-comment-dots"></i>
											${board.numOfReply }
										</span>
									</c:if> --%>
									
								</td>
								<td>${req.price }</td>
								<td>${req.inserted }</td>
								<td>
									<form id="" class="form2" action="${appRoot }/request/remove" method="post">
										<input type="hidden" name="id" value="${req.id }" />
										<button id="" class="btn btn-primary accept-submit1">수락</button>
										<button id="" class="btn btn-primary reject-submit1">거절</button>
										<button id="" class="btn btn-danger delete-submit1">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>