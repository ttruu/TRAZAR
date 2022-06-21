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
	
	// 요청 수락시 chat열리게함
	$(".accept-submit1").click(function(e) {

		e.preventDefault();
	
		if (confirm("수락하시겠습니까?")) {
			let form1 = $(".form2");
			let methodAttr = "get";
			let actionAttr = "${appRoot}/chat";
			form1.attr("action", actionAttr);
			form1.attr("method", methodAttr);
	
			form1.submit();
		}
	
	});

      e.preventDefault();
   
      if (confirm("수락하시겠습니까?")) {
         let form1 = $(".form2");
         let methodAttr = "get";
         let actionAttr = "${appRoot}/chat";
         form1.attr("action", actionAttr);
         form1.attr("method", methodAttr);
   
         form1.submit();
      }
   
   });

	
	// 요청 거절시 해당index에 따라 삭제되게함
	$(".reject-submit1").click(function(e) {
		e.preventDefault();
	
		if (confirm("거절하시겠습니까?")) {
			let idx = $(this).attr("data-index");
			let form1 = $("#processForm" + idx);
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
						<input type="hidden" name="designBoardId" value="" />
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
</body>
</html>