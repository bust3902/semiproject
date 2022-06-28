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

<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- 팀 CSS -->
<link href="/semiproject/css/list.css" rel="stylesheet" />

<style>
	.container { width:72%; }
	
	p.book-introduction {
		font-size:12px;
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
			
	span.card-title {
		font-size:13px;
		display: -webkit-box;
		text-overflow: ellipsis;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
		overflow: hidden;
	}
</style>
</head>

<body>
<!-- 헤더 -->
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container mt-5" style="min-width:1094px; max-width:1094px;">
	<div class="row">
		<%
			BookDao bookDao = BookDao.getInstance();

			// 카테고리 그룹 파라미터
			int categoryGroupNo = StringUtil.stringToInt(request.getParameter("categoryGroupNo"));
			
			// 책 출력방식 파라미터(리스트, 그리드 형식)
			String viewStyle  = request.getParameter("view");
			if (viewStyle == null) {
				viewStyle = "list";
			}
			
			// 페이징기능
			int rows = 10;
			int pages = 5;
			int records = bookDao.getTotalRowsCount();
			int totalPages = (int) (Math.ceil((double) records/rows));
			int totalBlocks = (int) (Math.ceil((double) totalPages/pages));
			
			// 페이지 파라미터
			String pageNum = request.getParameter("page");
			if (pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(request.getParameter("page"));
			
			if (currentPage <= 0 || currentPage > totalPages) {
				response.sendRedirect("italllist.jsp?categoryGroupNo=1100");
				return;
			}
			
			int currentBlock = (int) (Math.ceil((double) currentPage/pages));
			
			int beginPage = (currentBlock -1)*pages + 1;
			int endPage = (currentBlock == totalBlocks ? totalPages : currentBlock*pages);
			
			int beginIndex = (currentPage-1)*rows +1;
			int endIndex = currentPage*rows;
			
			// 인기순, 최신순 소분류
			String orderCategory = request.getParameter("order");
			if (orderCategory == null) {
				orderCategory = "best";
			}
			List<BookDto> booksSort= null;
			if ("best".equals(orderCategory)) {
				booksSort = bookDao.getSortBestAllBooks(categoryGroupNo, beginIndex, endIndex);
			} else if ("insert".equals(orderCategory)) {
				booksSort = bookDao.getSortInsertAllBooks(categoryGroupNo, beginIndex, endIndex);
			}
		%>
		<div class="col-3">
			<!-- 사이드바(카테고리 그룹) -->
			<aside>
				<jsp:include page="../common/listsidebar.jsp">
					<jsp:param name="menu" value="board"/>
				</jsp:include>
			</aside>
		</div>
		
		<div class="col-8">
			<div class="row">
				<!-- 메인 카테고리명 -->
				<div class="row mb-2" style="display: inline-block;">
					<a href="itmainlist.jsp?categoryGroupNo=1100" style="text-decoration:none; color:black;">
						<img src="/semiproject/img/display.svg" width="20" height="20" class="mb-2">
							<strong style="font-size:20px"> 컴퓨터/IT</strong>
					</a>
				</div>
			</div>
			
			<!-- 분류별 서브메뉴 -->
			<div class="row mb-3 border-bottom">
				<ul class="nav justify-content-start">
					<li class="nav-item">
						<a href="itmainlist.jsp?categoryGroupNo=1100" class="nav-link p-2" style="color:gray">홈</a>
					</li>
					<li class="nav-item">
						<a href="itnewlist.jsp?categoryGroupNo=1100&order=best&view=list" class="nav-link p-2" style="color:gray">신간</a>
					</li>
					<li class="nav-item">
						<a href="itbestsellerlist.jsp?categoryGroupNo=1100&order=week&view=list" class="nav-link p-2" style="color:gray">베스트셀러</a>
					</li>
					<li class="nav-item border-bottom border-primary border-3">
						<a href="italllist.jsp?categoryGroupNo=1100&page=1&view=list" class="nav-link p-2" style="color:gray">전체</a>
					</li>
				</ul>
			</div>

			<div class="row">
				<div class="row">
					<div class="container d-flex flex-wrap p-0" style="width:100%;">

						<!-- 전체상품 페이지 내 소분류 -->
						<div class="col-10 p-0">
							<ul class="nav justify-content-start m-0">
								<li class="nav-item rank">
									<a href="italllist.jsp?categoryGroupNo=1100&order=best&view=<%=viewStyle %>&page=1" 
										class="nav-link p-2 font-weight-bold" style="color:gray">인기순</a>
								</li>
								<li class="nav-item rank">
									<a href="italllist.jsp?categoryGroupNo=1100&order=insert&view=<%=viewStyle %>&page=1" 
										class="nav-link p-2" style="color:gray">최신순</a>
								</li>
							</ul>
						</div>
						
						<!-- 리스트 보기형식 선택 -->
						<div class="col-2 position-relative">
							<div class="btn-group btn-group-sm position-absolute end-0" role="group">
								<a class="btn btn-default border" href="italllist.jsp?categoryGroupNo=1100&order=<%=orderCategory %>&view=list&page=<%=pageNum %>" role="button">
									<span class="glyphicon glyphicon-th-list"></span>
								</a>
								<a class="btn btn-default border" href="italllist.jsp?categoryGroupNo=1100&order=<%=orderCategory %>&view=grid&page=<%=pageNum %>" role="button">
									<span class="glyphicon glyphicon-th-large"></span>
								</a>
							</div>
						</div>
						
					</div>
				</div>

				<!-- 상품 리스트 형식으로 출력 -->
				<div class="row <%="list".equals(viewStyle) ? "" : "d-none" %>" id="list">
					<%
						for (BookDto book: booksSort) {
					%>
					<div class="row mt-3 border-bottom">
						<div class="col-2 mt-3">
							<a href="detail.jsp?bookNo=<%=book.getNo() %>">
								<img class="thumbnail" alt="" src="../img/<%=book.getImgFileName() %>">
							</a>
						</div>
						<div class="col-10 ps-4 mt-3">
							<a href="detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:black;">
								<strong><%=book.getTitle() %></strong>
							</a>
							<p class="book-introduction mt-3"><%=book.getWriter() %>
								<span class="partition"> | </span><%=book.getBookPublisher() %>
								<span class="partition"> | </span><a href="itsubmainlist.jsp?categoryNo=<%=book.getCategoryNo() %>" style="text-decoration:none; color:black;"><%=book.getCategoryName() %></a>
							</p>
							<p class="book-introduction">&lt;책소개&gt; <%=book.getIntroduce() %>
							</p>
							<p class="book-introduction">구매 <span class="card-text"><%=book.getBookPrice() %>원</span></p>
						</div>
					</div>
					<%
						}
					%>
					<div class="row text-center">
						<!-- 페이지네이션 버튼기능 -->
						<nav>
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="italllist.jsp?categoryGroupNo=<%=categoryGroupNo%>&order=<%=orderCategory %>&view=<%=viewStyle %>&page=<%=currentPage -1 %>">이전</a>
								</li>
							<%
								for (int num = beginPage; num <= endPage; num++) {
							%>
								<li class="page-item <%=currentPage == num ? "active" : "" %>">
									<a class="page-link" href="italllist.jsp?categoryGroupNo=<%=categoryGroupNo%>&order=<%=orderCategory %>&view=<%=viewStyle %>&page=<%=num %>"><%=num %></a>
								</li>
							<%
								}
							%>
								<li class="page-item">
									<a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="italllist.jsp?categoryGroupNo=<%=categoryGroupNo%>&order=<%=orderCategory %>&view=<%=viewStyle %>&page=<%=currentPage + 1 %>">다음</a>
								</li>
							</ul>
						</nav>
					</div>

				</div>
				
				<!-- 상품그리드 형식으로 출력 -->
				<div class="row <%="grid".equals(viewStyle) ? "" : "d-none" %>" id="grid">
					<%
						for (BookDto book: booksSort) {
					%>
					<div class="col mt-5">
						<div class="card border-0" style="height:auto; width:120px;">
							<a href="detail.jsp?bookNo=<%=book.getNo() %>"><img src="../img/<%=book.getImgFileName() %>" class="card-img-top thumbnail" alt="..."></a>
							<div class="card-body p-0">
								<a href="detail.jsp?bookNo=<%=book.getNo() %>" style="text-decoration:none; color:black;">
									<span class="card-title"><%=book.getTitle() %></span>
								</a>
								<p class="card-text m-0"><%=book.getWriter() %></p>
								<p class="card-text m-0">구매 <span class="card-text m-0"> <%=book.getBookPrice() %>원</span></p>
								
							</div>
						</div>
					</div>
					<%
						}
					%>
					<div class="row text-center">
						<!-- 페이지네이션 버튼기능 -->
						<nav>
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="italllist.jsp?categoryGroupNo=<%=categoryGroupNo%>&order=<%=orderCategory %>&view=<%=viewStyle %>&page=<%=currentPage -1 %>">이전</a>
								</li>
							<%
								for (int num = beginPage; num <= endPage; num++) {
							%>
								<li class="page-item <%=currentPage == num ? "active" : "" %>">
									<a class="page-link" href="italllist.jsp?categoryGroupNo=<%=categoryGroupNo%>&order=<%=orderCategory %>&view=<%=viewStyle %>&page=<%=num %>"><%=num %></a>
								</li>
							<%
								}
							%>
								<li class="page-item">
									<a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="italllist.jsp?categoryGroupNo=<%=categoryGroupNo%>&order=<%=orderCategory %>&view=<%=viewStyle %>&page=<%=currentPage + 1 %>">다음</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>	
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<script>
/* function showGrid() {
    document.querySelector('#grid').classList.remove("hidden");
    document.querySelector('#list').classList.add("hidden");
};

function showList() {
    document.querySelector('#list').classList.remove("hidden");
    document.querySelector('#grid').classList.add("hidden");
}; */
</script>
</body>
</html>