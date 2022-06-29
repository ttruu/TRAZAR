<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- include summernote css/js -->
<!-- <script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css"
	integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js"
	integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ attribute name="current"%>

<c:url value="/sign/loginSuccess" var="loginSuccess"></c:url>
<c:url value="/sign/memberModifyLogin" var="memberLogin"></c:url>
<c:url value="/sign/signup" var="signupUrl"></c:url>
<c:url value="/sign/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>
<c:url value="/designBoard/insert" var="insertUrl"></c:url>
<c:url value="/sign/passwordModify" var="passwordModify"></c:url>
<c:url value="/designBoard/list" var="listUrl"></c:url>
<c:url value="/notice/list" var="noticeListUrl"></c:url>
<c:url value="/request/list" var="requestListUrl"></c:url>
<c:url value="/designBoard/search" var="searchUrl"></c:url>

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

<%-- 마이리스트 링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<c:url value="/request/myList" var="myListUrl">
		<c:param name="memberId" value="${principal.username }" />
	</c:url>
</sec:authorize>
<style>
header{
background-color: #303134;
}
#front-nav-font{
font-weight: 600;
color: #FFFFFF;
}
</style>

<header class="mb-3 border-bottom fixed-top"style="grid-template-columns: 1fr 2fr;">
    <div class="container-fluid d-grid gap-3 align-items-center">
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
      <div class="d-flex flex-wrap align-items-center justify-content-start">
       
        <a href="/trazar/designBoard/list" class="d-flex align-items-center mb-3 mb-lg-0 text-dark text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><img src="../resources/picture/logo/악.PNG" /></svg>
        </a>

        <ul id="front-nav-font" class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-start mb-md-0">
          <li><a href="${noticeListUrl }" class="nav-link px-2 link-light">공지사항</a></li>
          <li><a href="${requestListUrl }" class="nav-link px-2 link-light">의뢰</a></li>
          <sec:authorize access="isAuthenticated()">
          <li><a href="${insertUrl }" class="nav-link px-2 link-light">디자인 올리기</a></li>
         </sec:authorize>
        </ul>
        
        <c:url value="/designBoard/search" var="searchUrl"></c:url>
				<form action="${searchUrl }" class="float-start">
					<div class="input-group">
						<!-- select.form-select>option*3 -->
						<select name="type" id="" class="form-select"
							style="flex: 0 0 130px; text-align:center;">
							<option value="bodyTitle" style="width:100px;"
								${param.type != 'title' && param.type != 'body' ? 'selected' : '' }>제목+본문</option>
							<option value="title" ${param.type == 'title' ? 'selected' : '' }>제목</option>
							<option value="body" ${param.type == 'body' ? 'selected' : ''}>본문</option>
							<option value="writerNickName"
								${param.type == 'writerNickName' ? 'selected' : ''}>작성자</option>
						</select>

						<input type="search" class="form-control" name="keyword" />
						<button class="btn btn-outline-dark">
							<i class="fa-solid fa-magnifying-glass text-light"></i>
						</button>
					</div>
				</form>
				
<sec:authorize access="not isAuthenticated()">
        <ul class="nav nav-pills justify-content-end" id="front-nav-font">
          <li class="nav-item "><a href="${loginUrl }" class="nav-link link-light">로그인</a> </li>
       		<li class="nav-item "><a href="${signupUrl }" class="nav-link link-light">회원가입</a> </li>
        </ul>
</sec:authorize>
	<sec:authorize access="isAuthenticated()">
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle text-light" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
               <i class="fa-solid fa-circle-user text-light"></i>
          </a>
          <ul class="dropdown-menu text-small" id="front-nav-font"aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item"data-bs-toggle="modal"
                           data-bs-target="#modal3" href="${passwordModify }">비밀번호 변경</a></li>
            <li><a class="dropdown-item" href="${myListUrl }">내 의뢰목록</a></li>
            <li><a class="dropdown-item"data-bs-toggle="modal"
                           data-bs-target="#modal2" href="${memberInfoUrl }">회원정보수정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="${logoutUrl }">로그아웃</a></li>
          </ul>
        </div>
        </sec:authorize>
        <div class="d-none">
            <form action="${logoutUrl }" id="logoutform1" method="post" /></form>
         </div>
        
      </div>
    </div>
  </header>