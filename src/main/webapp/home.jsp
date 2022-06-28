<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="img/Hfavicon.ico" rel="icon" type="image/x-icon" />

<!-- slick CSS, JS -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- 팀 CSS -->
<link href="/semiproject/css/home.css" rel="stylesheet" />

</head>

<style>
	.container { width:72%; }
	
	img { border-radius: 5px; }
	
	p.title-name {
		font-size:12px;
		display: -webkit-box;
		text-overflow: ellipsis;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 1;
		overflow: hidden;
	}
	
	.img-wish{text-align: center !important;}

	.img-wish img{width: 100%;} 
</style>

<body>
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
	<div class="container border-bottom mb-5" style="min-width:1094px;">
		<div class="row">
			<%
				BookDao bookDao = BookDao.getInstance();
				// 카테고리 그룹 파라미터
				int categoryGroupNo = StringUtil.stringToInt(request.getParameter("categoryGroupNo"));
				
				// 베스트셀러 목록
				List<BookDto> books = bookDao.getHomeBest();
				// 신간 목록
				List<BookDto> newbooks = bookDao.getHomeNew();
			%>
			<div class="col-2 mb-3"><span class="fw-bolder" style="font-size:24px; color:#00AFFF;">도서</span></div>
			<div class="col-8 mb-3"></div>
			
			<!-- 카테고리 페이지 링크 -->
			<div class="col-2 mb-3"><a href="list/categories.jsp" class="nav-link text-muted mx-2 mt-3" style="float:right; font-weight:bold;"><img src="/semiproject/img/justify.svg" /> 전체 카테고리</a></div>
		</div>
	</div>

	<div id="carouselExampleCaptions" class="carousel slide container mb-5" data-bs-ride="carousel">
		<div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		
		<!-- 배너 캐러셀 -->
		<div class="carousel-inner">
		    <div class="carousel-item active">
				<a href="list/detail.jsp?bookNo=10"><img src="img/banner01.jpg" class="d-block w-100" alt="..." style="border-radius: 10px;"></a>
			</div>
			<div class="carousel-item">
				<a href="list/detail.jsp?bookNo=6"><img src="img/banner02.jpg" class="d-block w-100" alt="..." style="border-radius: 10px;"></a>
			</div>
			<div class="carousel-item">
				<a href="list/detail.jsp?bookNo=1"><img src="img/banner03.jpg" class="d-block w-100" alt="..." style="border-radius: 10px;"></a>
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

	<!-- 여유되면 메뉴 넣을 자리 -->
	<div style="width:100%; height:80px;"></div>
	
	<!-- 베스트셀러 구간 -->
	<div class="container mb-5">
		<div class="row mb-3">
			<a href="list/itbestsellerlist.jsp?categoryGroupNo=1100&order=week&view=list&page=1" class="nav-link text-muted mb-3"><span class="fs-2 text-dark fw-bold">베스트 셀러 ></span></a>
		</div>
		<div class="row multiple-items">
		<%
			int num = 0;
			for (BookDto book : books) {
				num++;
		%>
			<div class="col-1 px-1 mb-3 ">
				<a href="list/detail.jsp?bookNo=<%=book.getNo() %>"><img src="img/<%=book.getImgFileName() %>" style="max-width:100%; height:auto;"></a>
			</div>
			<div class="col-1 mb-3 text-center align-self-center"><p style="font-size:20px; font-weight:bold"><%=num %></p></div>
			<div class="col-2 ps-0 mb-3 text-center align-self-center">
				<p class="title-name" style="font-size:14px; font-weight:bold"><a href="list/detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:black;"><%=book.getTitle() %></a></p>
				<p class="title-name"><a href="list/detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:gray"><%=book.getWriter() %></a></p>
				<p class="title-name"><a href="list/detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:gray"><%=book.getBookPublisher() %></a></p>
			</div>
		<%
			}
		%>
		</div>
	</div>
	
	<!-- 화제의 신간 구간 -->
	<div class="container">
		<div class="row mb-3">
			<a href="list/itnewlist.jsp?categoryGroupNo=1100&order=best&view=list" class="nav-link text-muted mb-3"><span class="fs-2 text-dark fw-bold">화제의 신간 ></span></a>
		</div>
		<div class="row">
		<%
			int numb = 0;
			for (BookDto book : newbooks) {
				numb++;
		%>
			<div class="col-1 px-1 mb-3">
				<a href="list/detail.jsp?bookNo=<%=book.getNo() %>"><img src="img/<%=book.getImgFileName() %>" style="max-width:100%; height:auto;"></a>
			</div>
			<div class="col-1 mb-3 text-center align-self-center"><p style="font-size:20px; font-weight:bold"><%=numb %></p></div>
			<div class="col-2 ps-0 mb-3 text-center align-self-center">
				<p class="title-name" style="font-size:14px; font-weight:bold"><a href="list/detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:black;"><%=book.getTitle() %></a></p>
				<p class="title-name"><a href="list/detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:gray"><%=book.getWriter() %></a></p>
				<p class="title-name"><a href="list/detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:gray"><%=book.getBookPublisher() %></a></p>
			</div>
		<%
			}
		%>
		</div>
	</div>

	<div style="width:100%; height:80px;"></div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 풋터 -->
<jsp:include page="common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
</html>