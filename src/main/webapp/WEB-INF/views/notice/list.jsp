<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/" %>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
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


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css" integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js" integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
<my:navBar current="list" />



	<div class="container">
		<div class="row">
			<div class="col">
				<h1>공지사항</h1>
				<sec:authorize access="hasRole('ADMIN')">
					<c:url value="/notice/insert" var="noticeInsertUrl"></c:url>
						<a id="insert-button1" href="${noticeInsertUrl }" class="btn btn-secondary">
							<i class="fa-solid fa-pen-to-square"></i>
						</a>					
						</sec:authorize>
				<c:if test="${not empty message }">
					<div class="alert alert-primary">
						${message }
					</div>
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
						<c:forEach items="${noticeList }" var="notice">
							<tr>
								<td>${notice.id }</td>
								<td>
									<c:url value="/notice/get" var="getUrl">
										<c:param name="id" value="${notice.id }"></c:param>
										<c:param name="memberId" value="${notice.memberId }"></c:param>
									</c:url>
									
									<a href="${getUrl }">
										<c:out value="${notice.title }"></c:out>
									</a>
								</td>
								<td>${notice.writerNickName }</td>
								<td>${notice.prettyInserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
		
</body>
</html>










