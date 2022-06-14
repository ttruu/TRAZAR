<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="current" %>
<c:url value="/sign/loginSuccess" var="loginSuccess"></c:url>
<c:url value="/sign/signup" var="signupUrl" ></c:url>
<c:url value="/sign/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>



<%-- 회원정보링크 --%>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
	<c:url value="/sign/modifyMember" var="memberInfoUrl">
		<c:param name="id" value="${principal.username }" />
	</c:url>
</sec:authorize>

<nav class="navbar navbar-expand-md navbar-light bg-light mb-3">
  <div class="container">
    <a class="navbar-brand" href="${loginSuccess }"><i class="fa-solid fa-house"></i></a>
    
    <!-- button.navbar-toggler>span.navbar-toggler-icon -->
    <button class="navbar-toggler" 
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent">
    	<span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        	<a href="${signupUrl }" class="nav-link ${current == 'signup' ? 'active' : '' }">회원가입</a>
        </li>
        
       <sec:authorize access="isAuthenticated()">
       	<li class="nav-item">
       		<a href="${memberInfoUrl }" class="nav-link ${current == 'memberInfo' ? 'active' : '' }">회원정보수정</a>
       	</li>
       </sec:authorize>
        
        <sec:authorize access="not isAuthenticated()">
	        <li class="nav-item">
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











