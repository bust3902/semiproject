<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SemiProject</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</head>

<body>
	<div class="container">
	<div class="row border-bottom">
		<div class="col-2 mb-2">회사로고</div>
		<div class="col-9 mb-2"></div>
		<div class="col-1 mb-2">카테고리</div>
	</div>
	
<div class="carousel slide m-5" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="..." class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
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
	
	
	<div class="row justify-content-md-center">
		<div class="col-6 d-flex justify-content-between mb-3">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
			<img src="images/sample.jpg" width="50">
		</div>
	</div>
</div>
<div class="container" style="min-width: 650px; max-width: 650px;">
	<div class="row">
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>
		<div class="col-3 mb-3">
			<div class="card">
				<img src="images/sample.jpg" class="card-img-top" />
				<div class="card-body">
					<p class="card-text"><small>우리 쌀로 빚은 정성을 담아 담근 우리 막걸리입니다.</small></p>
					<p class="card-text"><strong class="danger">45,000</strong>원</p>
					<h5 class="card-title"><small>정성가득 우리 막걸리</small></h5>
				</div>
			</div>
		</div>

	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>

<jsp:include page="common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</html>