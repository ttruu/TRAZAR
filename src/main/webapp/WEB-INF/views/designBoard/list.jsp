<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.MainHome {
   display: grid;
   grid-template-columns: 5% 60% 0% 10% 10%;
   grid-template-rows: 50% 200% 30% 600% 150%;
   height: 100%;
   grid-gap: 1%;
   grid-template-areas: 'header header header header header header'
      'left-side main main main right right'
      'left-side other other other other other'
      'left-side content content content content content'
      'footer footer footer footer footer footer';
}

.header {
   grid-area: header;
   background-color: pink;
}

.left-side {
   grid-area: left-side;
   background-color: grey;
}

.main1 {
   grid-area: main;
   background-color: yellow;
}

.right {
   grid-area: right;
   background-color: red;
}

.other {
   grid-area: other;
   background-color: grey;
}

.content {
   grid-area: content;
   background-color: purple;
}

.footer {
   grid-area: footer;
   background-color: green;
}


.totalLayout{
   justify-content : space-around;
   margin-top: 45px;
}
.totalLayout-title{
   margin: 20px 0
}
.list-titles {
   color: black;
   font-size: 20px;
}
.main-lists:after {
   content:"";
   display:block;
   clear:both;
}
.main-lists{
   display: flex;
   flex-wrap: wrap;
}
.project-list-mini{
   max-width: 250px;
   margin-bottom: 55px;
   margin-right: 20px;
}
.design-name{
   margin-top: 15px;
   color: gray;
}
.main-lists .thumbnail-image img {
   width: 270px;
   height: 270px;
}
.main-project-title{
   font-size: 11pt;
   font-weight: bold;
   height: 40px;
   margin: 8px 0;
}
</style>

<title>Insert title here</title>
</head>
<body>
   <my:navBar current="list" />



   <!--  
<div class="MainHome"></div>
      <div class="header"></div>
   <div class="left-side">left-side</div>
      <div class="main1">Main</div>
      <div class="right">Right</div>
      <div class="other">Other</div>
      <div class="content">Content</div>
      <div class="footer">Footer</div>
 -->


   <div class="totalLayout">
      <div class="totalLayout-title">
         <h3 class="list-titles">hot creator</h3>
      </div>
      
      <c:if test="${not empty message }">
         <div class="alert alert-primary">${message }</div>
      </c:if>

      <div class="main-lists">
         <c:forEach items="${designBoardList }" var="designBoard">
            <div class="project-list-mini">
               <c:url value="/designBoard/get" var="getUrl">
                  <c:param name="id" value="${designBoard.id }"></c:param>
                  <c:param name="memberId" value="${designBoard.memberId }"></c:param>
               </c:url>
               <a href="${getUrl }" class="list-thumbnail">
                  <div class="thumbnail-image">
                     <img src="${designBoard.imgthumbnail }">
                  </div>
                  <div class="design-name">
                     ${designBoard.id} ㅣ
                     ${designBoard.writerNickName }
                  </div>
                  <div class="main-project-title">
                     ${designBoard.title }
                     ${designBoard.prettyInserted }
                  </div>
               </a>
            </div>
         </c:forEach>
      </div>
   </div>
   

   <hr />


   <!-- 광고 구현 (해당 이미지 클릭 시 url로 넘어감) -->
   <div class="card right" style="width: 20rem; cursor: pointer;"
      onclick="location.href='https://www.google.com';">
      <img src="../resources/picture/ad/구글1.PNG" class="card-img-top">
      <div class="card-body">
         <h5 class="card-title">광고</h5>
         <ul class="fa-ul custom-list">
            <!--  
            <li>
               <i class="fa fa-check fa-fw"></i>
               광고내용
            </li> 
            -->
         </ul>
      </div>
   </div>


</body>
</html>