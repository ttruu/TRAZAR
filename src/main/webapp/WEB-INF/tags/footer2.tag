<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
	#sticky-footer{
		bottom: 0;
		width: 100%;
	}
</style>
	<div id="sticky-footer"class="mt-auto">
  <section class="">
  <!-- Footer -->
  <footer class="text-center text-white" style="background-color: #303134">
    <!-- Grid container -->
    <div class="container p-4 pb-0">
      <!-- Section: CTA -->
      <section class="">
      	<sec:authorize access="not isAuthenticated()">
        <p class="d-flex justify-content-center align-items-center">
          <span class="me-3" style="color:white;">지금 바로!!</span>
          <button type="button" class="btn btn-outline-light btn-rounded">
          <c:url value="/sign/signup" var="signupUrl"></c:url>
           <a href="${signupUrl }" class="nav-link link-light">회원가입</a>
          </button>
        </p>
        	</sec:authorize>
        	<sec:authorize access="isAuthenticated()">
        	 <p class="d-flex justify-content-center align-items-center">
          <span class="me-3">환영합니다!</span>
        </p>
        	</sec:authorize>
      </section>
      <!-- Section: CTA -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: black;">
      © 2022 
      <a class="text-white" href="/trazar/designBoard/list">HYS:TRAZAR</a>
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->
</section>
  
</div>