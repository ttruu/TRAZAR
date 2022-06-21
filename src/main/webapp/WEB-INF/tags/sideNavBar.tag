<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="/designBoard/list" var="listUrl"></c:url>
<c:url value="/notice/list" var="noticeListUrl"></c:url>
<c:url value="/request/list" var="requestListUrl"></c:url>

<%--사이드 nav 바 --%>

<ul class="nav flex-column position-fixed">
	<li class="nav-item">
		<a class="nav-link ${current == 'list' ? 'active' : '' }"
			aria-current="page" href="${listUrl }">
			<i class="fa-solid fa-square-list"></i>
		</a>
		<p>Trazar</p>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="${noticeListUrl }">
			<i class="fa-solid fa-bullhorn"></i>
		</a>
		<p>공지사항</p>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="${requestListUrl }">
			<i class="fa-solid fa-comments-question-check"></i>
		</a>
		<p>의뢰</p>
	</li>
	<li class="nav-item">
		<i class="fa-solid fa-chevron-down"></i>
	</li>
</ul>