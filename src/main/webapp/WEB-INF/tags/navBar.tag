<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>
<c:url value="/sign/loginSuccess" var="loginSuccess"></c:url>
<c:url value="/sign/memberModifyLogin" var="memberLogin"></c:url>
<c:url value="/sign/signup" var="signupUrl"></c:url>
<c:url value="/sign/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>
<c:url value="/designBoard/list" var="listUrl"></c:url>
<c:url value="/designBoard/insert" var="insertUrl"></c:url>
<c:url value="/sign/passwordModify" var="passwordModify"></c:url>
<c:url value="/notice/list" var="noticeListUrl"></c:url>
<c:url value="/notice/insert" var="noticeInsertUrl"></c:url>


<%-- 회원정보링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<c:url value="/sign/selectMember" var="memberInfoUrl">
		<c:param name="id" value="${principal.username }" />
	</c:url>
</sec:authorize>

<%-- 비밀번호 수정 링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<c:url value="/sign/passwordModify" var="passwordModify">
		<c:param name="id" value="${principal.username }" />
	</c:url>
</sec:authorize>


<%-- 회원정보 암호 모달 --%>

<nav class="navbar navbar-expand-md navbar-light mb-3">
	<form>
		<a class="navbar-brand" href="/trazar/designBoard/list">
			<img src="../resources/picture/logo/로고.png" />
		</a>
	</form>
	<div class="container">
		<div class="modal fade" id="modal2" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel2">암호를 입력하세요.</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="form2" action="${appRoot }/sign/selectMember"
							method="post">
							<input type="hidden" value="${principal.username }" name="id" />

							<label for="passwordInput5" class="form-label"> 암호를
								입력하세요. </label>
							<input class="form-control" id="passwordInput1" type="password"
								name="oldPassword" />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>

						<button id="modifySubmitButton2" form="form2" type="submit"
							class="btn btn-primary">입력</button>
					</div>
				</div>
			</div>
		</div>


		<%-- 비밀번호 변경 페이지 모달 --%>
		<div class="modal fade" id="modal3" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel2">암호를 입력하세요.</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="form3" action="${appRoot }/sign/passwordModify"
							method="post">
							<input type="hidden" value="${principal.username }" name="id" />

							<label for="passwordInput4" class="form-label"> 암호를
								입력하세요. </label>
							<input class="form-control" id="passwordInput" type="password"
								name="oldPassword" />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>

						<button id="modifySubmitButton3" form="form3" type="submit"
							class="btn btn-primary">입력</button>
					</div>
				</div>
			</div>
		</div>




		<a class="navbar-brand" href="${listUrl }">
			<i class="fa-solid fa-house"></i>
		</a>

		<!-- button.navbar-toggler>span.navbar-toggler-icon -->
		<button class="navbar-toggler" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item">
					<a class="nav-link ${current == 'list' ? 'active' : '' }"
						href="${listUrl }">목록보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${current == 'insert' ? 'active' : '' }"
						href="${insertUrl }">글쓰기</a>
				</li>
				<li class="nav-item">
					<a href="${signupUrl }"
						class="nav-link ${current == 'signup' ? 'active' : '' }">회원가입</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${current == 'list' ? 'active' : '' }"
						href="${noticeListUrl }">공지사항보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${current == 'insert' ? 'active' : '' }"
						href="${noticeInsertUrl }">공지사항글쓰기</a>
				</li>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">

						<a href="${passwordModify }" data-bs-toggle="modal"
							data-bs-target="#modal3"
							class="nav-link ${current == 'passwordModify' ? 'active' : '' }">비밀번호
							변경</a>
					</li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">

						<a href="${memberInfoUrl }" data-bs-toggle="modal"
							data-bs-target="#modal2"
							class="nav-link ${current == 'memberInfo' ? 'active' : '' }">회원정보수정</a>
					</li>
				</sec:authorize>

				<sec:authorize access="not isAuthenticated()">
					<li class="nav-item" style="text-align: right;">
						<a href="${loginUrl }" class="nav-link">로그인</a>
					</li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<a href="${logoutUrl }" class="nav-link">로그아웃</a>
					</li>
				</sec:authorize>
			</ul>

			<div class="d-none">
				<form action="${logoutUrl }" id="logoutform1" method="post" /></form>
			</div>
		</div>
	</div>
</nav>