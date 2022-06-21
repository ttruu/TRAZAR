<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.css" integrity="sha512-ngQ4IGzHQ3s/Hh8kMyG4FC74wzitukRMIcTOoKT3EyzFZCILOPF0twiXOQn75eDINUfKBYmzYn2AA8DkAk8veQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-bs5.min.js" integrity="sha512-6F1RVfnxCprKJmfulcxxym1Dar5FsT/V2jiEUvABiaEiFWoQ8yHvqRM/Slf0qJKiwin6IDQucjXuolCfCKnaJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
$(document).ready(function() {
   
   // edit버튼 클릭됐을때 쓰기 가능하게함
   $("#edit-button1").click(function() {
      $("#input1").removeAttr("readonly");
      $("#summernote").summernote();
      $("#view").addClass("d-none");
      $("#textarea1").removeAttr("readonly");
      $("#input4").removeAttr("readonly");
      $("#modify-submit1").removeClass("d-none");
      $("#select1").removeClass("d-none");
   });
   
});
</script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
      <div class="row">
         <div class="col">
            <h1>
               글 본문
               <button id="edit-button1" class="btn btn-secondary">
                  <i class="fa-solid fa-pen-to-square"></i>
               </button>
            </h1>
            <form id="form" action="${appRoot }/request/modify" method="post">
               <input type="hidden" name="id" value="${request.id }" />
               <div>
                  <label class="form-label" for="input1">제목</label>
                  <input class="form-control mb-3" type="text" name="title" required
                     id="input1" value="${request.title }" readonly />
               </div> 
               
               <select id="select1" class="form-select d-none" aria-label="Default select example" name="state">
				  <option selected>상태 선택하기</option>
				  <option value="대기중">대기중</option>
				  <option value="진행중">진행중</option>
				  <option value="완료">완료</option>
			   </select>
               
               <div>
                  <label class="form-label" for="textarea1">본문</label>
					<div id="view" >${request.body }</div>
					<textarea class="form-control d-none" name="body" id="summernote">${request.body }</textarea>
               </div>
               
               <div>
                  <label for="input3" class="form-label">작성자</label>
                  <input id="input3" class="form-control mb-3" type="text"
                     value="${request.memberId }" readonly />
               </div>
               
               <div>
                  <label class="form-label" for="input4">예산</label>
                  <input class="form-control mb-3" type="text" name="price" required
                     id="input4" value="${request.price }" readonly />
               </div> 
                  
               <div>
                  <label for="input2" class="form-label">작성일시</label>
                  <input class="form-control mb-3" type="datetime-local"
                     value="${request.inserted }" readonly />
               </div>
               
               <div>
                  <label class="form-label" for="input5">연락처</label>
                  <input class="form-control mb-3" type="text" name="phoneNum"
                     id="input5" value="${request.phoneNum }" readonly />
               </div>
               
               <div>
                  <label class="form-label" for="input6">기간</label>
                  <input class="form-control mb-3" type="text" name="term"
                     id="input6" value="${request.term }" readonly />
               </div>
               
                <button id="modify-submit1" class="btn btn-outline-primary d-none">수정</button>
             </form>
         </div>
      </div>
   </div>
</body>
</html>