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
<link href="/semiproject/img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/semiproject/css/list.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

	<style>
		.container { width:72%; }
		
		.book-info {
			font-size:12px;
		}
		
		p.book-introduction {
			font-size:13px;
			display: -webkit-box;
			text-overflow: ellipsis;
			-webkit-box-orient: vertical;
			-webkit-line-clamp: 3;
			overflow: hidden;
		}
		
		h6 {
			font-weight:bold;
		}
		
		span.partition {
			font-size:11px;
			color: lightgray;
		}
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

			String viewStyle  = request.getParameter("view");
			if (viewStyle == null) {
				viewStyle = "list";
			}
			
			String orderCategory = request.getParameter("order");
			
			List<BookDto> listBookList = null;
			List<BookDto> listBookGrid = null;
			
			if (orderCategory.equals("new")) {
				listBookList = bookDao.getNewBooks(categoryGroupNo);
				listBookGrid = bookDao.getNewBooks(categoryGroupNo);
			} else {
				listBookList = bookDao.getNewBestBooks(categoryGroupNo);
				listBookGrid = bookDao.getNewBestBooks(categoryGroupNo);
			}
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
			
			<div class="row mb-3 border-bottom">
				<ul class="nav justify-content-start">
					<li class="nav-item"><a href="itmainlist.jsp?categoryGroupNo=1100" class="nav-link p-2" style="color:gray">홈</a></li>
					<li class="nav-item border-bottom border-primary border-3"><a href="itnewlist.jsp?categoryGroupNo=1100&order=best&view=list" class="nav-link p-2" style="color:gray">신간</a></li>
					<li class="nav-item"><a href="itbestsellerlist.jsp?categoryGroupNo=1100&order=week&view=list" class="nav-link p-2" style="color:gray">베스트셀러</a></li>
					<li class="nav-item"><a href="italllist.jsp?categoryGroupNo=1100&page=1&view=list" class="nav-link p-2" style="color:gray">전체</a></li>
				</ul>
			</div>

			<div class="row">
				<div class="row">
					<div class="container d-flex flex-wrap p-0" style="width:100%;">
						<div class="col-10 p-0">
							<ul class="nav justify-content-start m-0">
								<li class="nav-item rank"><a href="itnewlist.jsp?categoryGroupNo=1100&order=best&view=<%=viewStyle %>" class="nav-link p-2" style="color:gray">인기순</a></li>
								<li class="nav-item rank"><a href="itnewlist.jsp?categoryGroupNo=1100&order=new&view=<%=viewStyle %>" class="nav-link p-2" style="color:gray">최신순</a></li>
							</ul>
						</div>
						<div class="col-2 position-relative">
							<div class="btn-group btn-group-sm position-absolute end-0" role="group">
								<a class="btn btn-default border" href="itnewlist.jsp?categoryGroupNo=1100&order=<%=orderCategory %>&view=list" role="button">
									<span class="glyphicon glyphicon-th-list"></span>
								</a>
								<a class="btn btn-default border" href="itnewlist.jsp?categoryGroupNo=1100&order=<%=orderCategory %>&view=grid" role="button">
									<span class="glyphicon glyphicon-th-large"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row <%="list".equals(viewStyle) ? "" : "d-none" %>" id="list">
					<%
						for (BookDto listBook: listBookList) {
					%>
					<div class="row mt-3 border-bottom">
						<div class="col-2">
							<a href="detail.jsp?bookNo=<%=listBook.getNo() %>">
								<img class="thumbnail" alt="" src="/semiproject/img/<%=listBook.getImgFileName() %>">
							</a>
						</div>
						<div class="col-10 ps-4">
							<h6><%=listBook.getTitle() %></h6>
							<p class="book-info"><%=listBook.getWriter() %><span class="partition"> | </span><%=listBook.getBookPublisher() %><span class="partition"> | </span><%=listBook.getCategoryName() %></p>
							<p class="book-introduction">&lt;책소개&gt; <%=listBook.getIntroduce() %>
							</p>
							<p class="book-introduction">구매 <span class="card-text"><%=listBook.getBookPrice() %>원</span></p>
						</div>
					</div>
					<%
						}
					%>
				</div>
					
				<div class="row  <%="grid".equals(viewStyle) ? "" : "d-none" %>" id="grid">
				<%
					for (BookDto gridBook: listBookGrid) {
				%>
			
					<div class="col mt-5">
						<div class="card border-0" style="height:auto; width:120px;">
							<a href="detail.jsp?bookNo=<%=gridBook.getNo() %>"><img src="../img/<%=gridBook.getImgFileName() %>" class="card-img-top" alt="..."></a>
							<div class="card-body p-0">
								<strong class="card-title"><%=gridBook.getTitle() %></strong>
								<p class="card-text m-0"><%=gridBook.getWriter() %></p>
								<p class="card-text m-0">구매 <span class="card-text m-0"><%=gridBook.getBookPrice() %>원</span></p>
								
							</div>
						</div>
					</div>
				<%
					}
				
				%>
		
				<div class="col-1"></div>
				</div>	
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<script>
/* function showGrid(event) {
   document.querySelector('#grid').classList.remove("visually-hidden");
   document.querySelector('#list').classList.add("visually-hidden");
};

function showList(event) {
    document.querySelector('#list').classList.remove("visually-hidden");
    document.querySelector('#grid').classList.add("visually-hidden");
}; */
</script>
</body>
</html>