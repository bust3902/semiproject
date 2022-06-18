<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/semiproject/css/home.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</head>

<style>
	.container { width:72%; }
	
	img { border-radius: 5px; }
</style>

<body>
	<div class="container border-bottom mb-5" style="min-width:1094px;">
		<div class="row">
			<div class="col-2 mb-1"><span class="text-primary fw-bolder" style="font-size:24px;">도서</span></div>
			<div class="col-8 mb-1"></div>
			<div class="col-2 mb-1"><a href="list/categories.jsp" class="nav-link p-0 text-muted mx-2" style="float:right;"><img src="/semiproject/img/justify.svg"/> 카테고리</a></div>
		</div>
	</div>

	<div id="carouselExampleCaptions" class="carousel slide container mb-5" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="img/banner01.jpg" class="d-block w-100" alt="..." style="border-radius: 10px;">
	</div>
	<div class="carousel-item">
		<img src="img/banner02.jpg" class="d-block w-100" alt="..." style="border-radius: 10px;">
	</div>
	<div class="carousel-item">
		<img src="img/banner03.jpg" class="d-block w-100" alt="..." style="border-radius: 10px;">
	</div>
	</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container mb-5">
		<a href="" class="nav-link text-muted"><span class="fs-5 text-dark fw-bold">베스트 셀러 ></span></a>
		<div class="row">
			<div class="col-1 px-0 mb-1"><img src="img/testBook02.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook02.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
		</div>
		<div class="row">
			<div class="col-1 px-0 mb-1"><img src="img/testBook02.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook02.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
		</div>
		<div class="row">
			<div class="col-1 px-0 mb-1"><img src="img/testBook02.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook02.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
		</div>
	</div>

	<div class="container mb-5 mb-5">
		<a href="" class="nav-link text-muted"><span class="fs-5 text-dark fw-bold">MD's PICK ></span></a>
		<div class="row">
			<div class="col-2 pr-1 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-2 pr-1 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-2 pr-1 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-2 pr-1 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-2 pr-1 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-2 pr-1 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
		</div>
	</div>

	<div class="container mb-5">
		<a href="" class="nav-link text-muted"><span class="fs-5 text-dark fw-bold">베스트 셀러 ></span></a>
		<div class="row">
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
		</div>
		<div class="row">
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
		</div>
		<div class="row">
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
			<div class="col-1 px-0 mb-1"><img src="img/testBook01.jpg" style="max-width:100%; height:auto;"></div>
			<div class="col-3 mb-1"></div>
		</div>
	</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
</html>