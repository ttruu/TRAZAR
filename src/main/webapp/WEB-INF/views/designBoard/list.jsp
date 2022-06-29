<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko-KR">
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


<style>
.card .card-img-top {
   justify-content: space-around;
   margin-bottom: 34%;
}

.card-img-top {
   margin-bottom: 25%;
}

.totalLayout {
   justify-content: space-around;
   margin-top: 7%;
}

.totalLayout-title {
   margin: 0px 0
}

.list-titles {
   color: black;
   font-size: 20px;
   font-stretch: normal;
   font-style: normal;
   letter-spacing: -0.4px;
   font-weight: 700;
   line-height: 19px;
   align-items: center;
   color: #161C1C;
}

.main-lists:after {
   content: "";
   display: block;
   clear: both;
}

.main-lists {
   display: flex;
   flex-wrap: wrap;
   gap: 4%;
   padding-top: 1.5%;
}

.project-list-mini {
   max-width: 250px;
   margin-bottom: 55px;
   margin-right: 20px;
}

.design-name {
   margin-top: 15px;
   color: gray;
   text-align: center;
}

.main-lists .thumbnail-image img {
   width: 270px;
   height: 270px;
   border: 1px solid #E1F6FA;
   border-radius: 30px;
}

.main-project-title {
   font-size: 11pt;
   font-weight: bold;
   height: 40px;
   margin: 8px 0;
   text-align: center;
}
</style>

<title>Insert title here</title>
</head>

<c:if test="${param.msg != null }">
   <script>
      alert("아이디와 패스워드를 확인 해주세요.")
   </script>
</c:if>

<script>
   $(" .top").on("click", function(e) {

      $("html, body").animate({
         scrollTop : 0
      }, '500');

      return false;

   });
</script>
<body>
   <section>
      <my:mainNav />
   </section>

   <!-- hot creator -->
   <section>
      <div class="totalLayout row">
         <div class="totalLayout-title col-8">
            <h3 class="list-titles">hot creator🔥</h3>

            <c:if test="${not empty message }">
               <div class="alert alert-primary">${message }</div>
            </c:if>

            <div class="main-lists d-flex justify-content-center">
               <c:forEach items="${hotList }" var="hot">
                  <div class="project-list-mini">
                     <c:url value="/designBoard/get" var="getUrl">
                        <c:param name="id" value="${hot.id }"></c:param>
                        <c:param name="memberId" value="${hot.memberId }"></c:param>
                     </c:url>
                     <a href="${getUrl }" class="list-thumbnail">
                        <div class="thumbnail-image">
                           <img src="${hot.imgthumbnail }">
                        </div>
                     </a>

                     <c:url value="/designer/view" var="viewUrl">
                        <c:param name="memberId" value="${hot.memberId }"></c:param>
                     </c:url>
                     <a href="${viewUrl }">
                        <div class="design-name">${hot.id}ㅣ${hot.writerNickName }</div>
                     </a>

                     <div class="main-project-title">${hot.title }
                        ${hot.prettyInserted }</div>
                  </div>
               </c:forEach>
            </div>
         </div>
         <!-- 광고 -->
         <div class="col-4 d-flex justify-content-center">
            <div style="width: 60%; cursor: pointer;"
               onclick="location.href='https://notefolioacademy.com/products/7';">
               <img src="../resources/picture/ad/펜2.PNG" class="card-img-top">
            </div>
         </div>
      </div>
   </section>

   <!-- 카테고리 -->
   <section class="list-titles">
      <form action="${appRoot}/designBoard/list" method="get">
         <ul class="nav row justify-content-md-center"
            style="padding-bottom: 1%;">
            <!-- <li class="nav-item col-1 col-md-1" >
               <a class="nav-link active">작품</a>
            </li> -->
            <li class="nav-item col-1 col-md-1">
               <a style="color: black;" class="nav-link active"
                  aria-current="page" href="${appRoot }/designBoard/list">전체</a>
            </li>
            <li class="nav-item col-1 col-md-1">
               <a style="color: black;" class="nav-link active"
                  aria-current="page"
                  href="${appRoot }/designBoard/list?categoryName=illust">일러스트</a>
            </li>
            <li class="nav-item col-1 col-md-1">
               <a style="color: black;" class="nav-link active"
                  aria-current="page"
                  href="${appRoot }/designBoard/list?categoryName=web">웹디자인</a>
            </li>
            <li class="nav-item col-1 col-md-1">
               <a style="color: black;" class="nav-link active"
                  aria-current="page"
                  href="${appRoot }/designBoard/list?categoryName=interior">인테리어</a>
            </li>
         </ul>
      </form>
   </section>

   <!-- 메인 -->
   <section>
      <div class="main-lists d-flex justify-content-center">
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
                  <div class="design-name">${designBoard.id}ㅣ
                     ${designBoard.writerNickName }</div>
                  <div class="main-project-title">${designBoard.title }
                     ${designBoard.prettyInserted }</div>
               </a>
            </div>
         </c:forEach>
      </div>
   </section>

   <!-- 하단 -->
   <section>
      <my:footer2 />
   </section>

</body>
</html>