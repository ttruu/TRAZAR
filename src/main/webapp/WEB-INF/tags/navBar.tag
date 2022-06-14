<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="current"%>

<c:url value="/designBoard/list" var="listUrl"></c:url>
<c:url value="/designBoard/insert" var="insertUrl"></c:url>
<c:url value="/notice/list" var="noticeListUrl"></c:url>
<c:url value="/notice/insert" var="noticeInsertUrl"></c:url>

<nav class="navbar navbar-expand-md navbar-light bg-light mb-3">
	<div class="container">
		<a class="navbar-brand" href="${listUrl }">
			<i class="fa-solid fa-house"></i>
		</a>


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
					<a class="nav-link ${current == 'list' ? 'active' : '' }"
						href="${noticeListUrl }">공지사항보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${current == 'insert' ? 'active' : '' }"
						href="${noticeInsertUrl }">공지사항글쓰기</a>
				</li>
			</ul>
		</div>
	</div>
</nav>