<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="/semiproject/img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/semiproject/css/list.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

	<style>
		.container { width:72% !important; }
	</style>
</head>

<body>
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container mt-5" style="min-width:1094px;">
	<div class="row">
		<%	
			BookDao bookDao = BookDao.getInstance();
	
			int categoryGroupNo = StringUtil.stringToInt(request.getParameter("categoryGroupNo"));
			
			List<BookDto> bookNewList = bookDao.getNewBooks(categoryGroupNo);

			List<BookDto> bookBestList = bookDao.getBestSellerBooks(categoryGroupNo);
		%>
		<div class="col-3">
			<aside>
				<jsp:include page="../common/listsidebar.jsp">
					<jsp:param name="menu" value="board"/>
				</jsp:include>
			</aside>
		</div>
		<div class="col-8">
			<div class="row">
				<div class="col nav-item mb-2">
					<a href="itmainlist.jsp?categoryGroupNo=1100" class="link-dark nav-link">
						<img src="/semiproject/img/display.svg" width="20" height="20" class="mb-1"> <strong style="font-size:20px">컴퓨터/IT</strong>
					</a>
				</div>
			</div>
			
			<div class="row border-bottom">
				<ul class="nav justify-content-start">
					<li class="nav-item border-bottom border-primary border-3"><a href="itmainlist.jsp?categoryGroupNo=1100" class="nav-link p-2" style="color:gray">홈</a></li>
					<li class="nav-item"><a href="itnewlist.jsp?categoryGroupNo=1100&order=best&view=list" class="nav-link p-2" style="color:gray">신간</a></li>
					<li class="nav-item"><a href="itbestsellerlist.jsp?categoryGroupNo=1100&order=week&view=list&page=1" class="nav-link p-2" style="color:gray">베스트셀러</a></li>
					<li class="nav-item"><a href="italllist.jsp?categoryGroupNo=1100&order=best&view=list&page=1" class="nav-link p-2" style="color:gray">전체</a></li>
				</ul>
			</div>
			
			<div class="row mt-5">
				<div class="col-3 m-0 p-0"><strong style="font-size:17px;">컴퓨터/IT 인기 신간</strong></div>
				<div class="col-7 m-0"><hr></div>
				<div class="col-2"><a href="itnewlist.jsp?categoryGroupNo=1100&order=best" class="btn btn-dark" type="button"><strong>전체보기</strong></a></div>
			</div>
			
			
			<div class="row">
				<%
					for (BookDto newBook : bookNewList) {
				%>
				<div class="col mt-3">
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp?bookNo=<%=newBook.getNo() %>"><img src="../img/<%=newBook.getImgFileName() %>" class="card-img-top thumbnail" alt="..."></a>
						<div class="card-body p-0">
							<span class="card-title"><%=newBook.getTitle() %></span>
							<p class="card-text m-0"><%=newBook.getWriter() %></p>
							<p class="card-text m-0">구매 <span class="card-text m-0"><%=newBook.getBookPrice() %>원</span></p>
							
						</div>
					</div>
				</div>
				<%
					}
				%>
						
				<div class="row mt-5">
					<div class="col-3 m-0 p-0"><strong style="font-size:17px;">컴퓨터/IT 베스트셀러</strong></div>
					<div class="col-7 m-0"><hr></div>
					<div class="col-2"><a href="itbestsellerlist.jsp?categoryGroupNo=1100&order=week" class="btn btn-dark justify-content-end" type="button"><strong>전체보기</strong></a></div>
				</div>
				
					
			</div>
				
			<div class="row">
				<%
					for (BookDto bestBook : bookBestList) {
				%>
				<div class="col mt-5">
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp?bookNo=<%=bestBook.getNo() %>"><img src="../img/<%=bestBook.getImgFileName() %>" class="card-img-top thumbnail" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title"><%=bestBook.getTitle() %></strong>
							<p class="card-text m-0"><%=bestBook.getWriter() %></p>
							<p class="card-text m-0">구매 <span class="card-text m-0"><%=bestBook.getBookPrice() %>원</span></p>
							
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<div class="col-1"></div>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
</html>