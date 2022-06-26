<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
   <div class="row">
   		<font class="col" size="8" color="#0d6efd"><strong>문의게시판</strong></font>
   		<input class="col mt-2" type="text" id="myInput" onkeyup="myFunction()" placeholder="검색" title="Type in a name">
   </div>
<div class="row mt-4">
	<div class="col-12 mt-3 bg-success bg-opacity-10 p-3">
	  <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1">
	  책을 구매했는데 할인가가 아닌 정상가로 구매가 되었어요1.
	  </a>
	  <div class="col">
    	<div class="collapse multi-collapse" id="multiCollapseExample1">
      		<div class="card card-body mt-3 mb-2">
        	로그인하지 않은 상태로 비회원 구매를 하실 경우 할인가가 아닌 정상가로 구입되는 점 양해 바랍니다.
      		</div>
    	</div>
  	  </div>
	</div>
	<div class="col-12 mt-3 bg-success bg-opacity-10 p-3">
	   <a class="text-dark text-decoration-none" data-bs-toggle="collapse" href="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample1">
	  책을 구매했는데 할인가가 아닌 정상가로 구매가 되었어요1.
	  </a>
	  <div class="col">
    	<div class="collapse multi-collapse" id="multiCollapseExample2">
      		<div class="card card-body mt-3 mb-2">
        	로그인하지 않은 상태로 비회원 구매를 하실 경우 할인가가 아닌 정상가로 구입되는 점 양해 바랍니다.
     		</div>
   		</div>
  	  </div>
	</div>
</div>
<div>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center mt-4">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>