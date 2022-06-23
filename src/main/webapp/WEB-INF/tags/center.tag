<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="current"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/trazar/designBoard/list" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><img src="../resources/picture/logo/로고.png" /></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="${noticeListUrl }" class="nav-link px-2 link-secondary">공지사항</a></li>
          <li><a href="${requestListUrl }" class="nav-link px-2 link-dark">의뢰</a></li>
          <sec:authorize access="isAuthenticated()">
          <li><a href="${insertUrl }" class="nav-link${current == 'insert' ? 'active' : '' } px-2 link-dark">글쓰기</a></li>
         </sec:authorize>
        </ul>
<sec:authorize access="not isAuthenticated()">
        <ul class="nav nav-pills">
          <li class="nav-item "><a href="${loginUrl }" class="nav-link">로그인</a> </li>
       		<li class="nav-item "><a href="${signupUrl }" class="nav-link">회원가입</a> </li>
        <ul>
</sec:authorize>
	<sec:authorize access="isAuthenticated()">
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <i src="../resources/picture/logo/로고.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div>
        </sec:authorize>
      </div>
    </div>
  </header>