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
   <div class="col-6 mt-5">
  		<nav class="navbar">
		  <div class="container-fluid">
		    <form class="d-flex">
		      <input class="form-control" type="search" placeholder="검색" aria-label="검색">
		      <button class="btn btn-outline-success" type="submit">search</button>
		    </form>
		  </div>
		</nav>
  	</div>
  	<div class="row">
	   	<div class="col-12 mt-3 mp-3">
	   		<font size="6" color="#0d6efd"><strong>검색 결과</strong></font>
	  	</div>
	  	<div>
	  		<font size="3">(로그인)에 대한 (42)개의 결과</font>
	  	</div>
	</div>
	<div class="search-result">
		<ul class="search-result-list">
			<li> [공지] 첫번째 공지입니다.
				<a></a>
			</li>
			<li> [공지] 두번째 공지입니다.
				<a></a>
			</li>
		</ul>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>