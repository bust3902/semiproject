<%@page import="java.util.ArrayList"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="java.util.List"%>
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
	
	p.book-introduction {
		font-size:13px;
		display: -webkit-box;
		text-overflow: ellipsis;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
		overflow: hidden;
		margin-bottom:3px;
	}	
		
	span.partition {
		font-size:11px;
		color: lightgray;
	}
	a {
		text-decoration: none !important;
		color:black;
	}
</style>
</head>

<body>
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container mt-5" style="min-width:984px; max-width:984px;">
	<div class="row">
	<%
		BookDao bookDao = BookDao.getInstance();

		String keyword = request.getParameter("keyword");
		if (keyword.isEmpty()) {
			out.println("<script>alert('검색어를 입력해주세요'); history.back();</script>");
			return;
		}
	
		String orderCategory = request.getParameter("order");
		if (orderCategory.isEmpty()) {
			orderCategory = "popularity";
		}
		
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		
		int rows = 5;		
		int pages = 5;
		
		int records = bookDao.getSearchKeywordCnt(keyword).size();	
		
		List<BookDto> searchBookList = new ArrayList<>();

		if (records > 0 ) {
			int totalPages = (int) (Math.ceil((double) records/rows));		
			int totalBlocks = (int) (Math.ceil((double) totalPages/pages));		
			int currentBlock = (int) (Math.ceil((double) currentPage/pages));
			
			int beginPage = (currentBlock -1)*pages + 1;
			int endPage = (currentBlock == totalBlocks ? totalPages : currentBlock*pages);
			
			int beginIndex = (currentPage-1)*rows +1;
			int endIndex = currentPage*rows;
			
			
			if ("popularity".equals(orderCategory)) {
				searchBookList = bookDao.getSearchKeywordPopularity(keyword, beginIndex, endIndex);
			} else if ("new".equals(orderCategory)) {
				searchBookList = bookDao.getSearchKeywordNew(keyword, beginIndex, endIndex);
			} else if ("rowprice".equals(orderCategory)) {
				searchBookList = bookDao.getSearchKeywordRowPrice(keyword, beginIndex, endIndex);
			}
		}
		
	%>
		<div class="row">
			<Strong class="fs-3">'<%=keyword %>' 도서 검색결과</Strong>
		</div>
		<div class="row">
		
		</div>
		<div class="row mt-3">
			<select class="form-select form-select-lg" style="width:105px; font-weight:bold;" id="orderCategory" onchange="changeOrder()">
				<option value="popularity" <%=orderCategory.equals("popularity") ? "selected" : "" %>>인기순</option>
				<option value="new" <%=orderCategory.equals("new") ? "selected" : "" %>>최신순</option>
				<option value="rowprice" <%=orderCategory.equals("rowprice") ? "selected" : "" %>>낮은가격순</option>
			</select>
		</div>
		
		
		
				<div class="row mt-5">
					<%
						for (BookDto book: searchBookList) {
					%>
					<div class="row mt-3 border-bottom">
						<div class="col-2 mt-3">
							<a href="detail.jsp?bookNo=<%=book.getNo() %>">
								<img class="thumbnail" alt="" src="../img/<%=book.getImgFileName() %>">
							</a>
						</div>
						<div class="col-10 ps-4 mt-3">
							<a href="detail.jsp?bookNo=<%=book.getNo() %>" class="mb-2" style="font-weight:bold;"><%=book.getTitle() %></a>
								<p class="book-introduction"><%=book.getWriter() %></span>
									<p class="book-introduction">
									<%=book.getBookPublisher() %><span class="partition"> | </span>
										<a href="itsubmainlist.jsp?categoryNo=<%=book.getCategoryNo() %>"><%=book.getCategoryName() %></a>
									</p>
								<p class="book-introduction">&lt;책소개&gt; <%=book.getIntroduce() %></p>
							
							<p class="book-introduction">구매 <span class="card-text"><%=book.getBookPrice() %>원</span></p>
						</div>
					</div>
					<%
						}
					%>
					<%
						if (records > 0) {
							int totalPages = (int) (Math.ceil((double) records/rows));		
							int totalBlocks = (int) (Math.ceil((double) totalPages/pages));		
							int currentBlock = (int) (Math.ceil((double) currentPage/pages));
							
							int beginPage = (currentBlock -1)*pages + 1;
							int endPage = (currentBlock == totalBlocks ? totalPages : currentBlock*pages);
					%>
					<div class="row text-center">
						<nav>
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="searchbook.jsp?order=<%=orderCategory %>&keyword=<%=keyword %>&page=<%=currentPage - 1 %>">이전</a>
								</li>
							<%
								for (int num = beginPage; num <= endPage; num++) {
							%>
								<li class="page-item <%=currentPage == num ? "active" : "" %>">
									<a class="page-link" href="searchbook.jsp?order=<%=orderCategory %>&keyword=<%=keyword %>&page=<%=num %>"><%=num %></a>
								</li>
							<%
								}
							%>
								<li class="page-item">
									<a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="searchbook.jsp?order=<%=orderCategory %>&keyword=<%=keyword %>&page=<%=currentPage + 1 %>">다음</a>
								</li>
							</ul>
						</nav>
					</div>
					<%
						}
					%>
				</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
<script type="text/javascript">
function changeOrder(){ 

	let keyword = '<%= request.getParameter("keyword") %>';
	let page = <%= request.getParameter("page") %>;
	
	let selectList = document.getElementById("orderCategory")
	
	if(selectList.options[selectList.selectedIndex].value == "popularity"){
		location.href = "/semiproject/list/searchbook.jsp?order=popularity&keyword="+keyword+"&page="+page+"";
	}
	if(selectList.options[selectList.selectedIndex].value == "new"){
		location.href = "/semiproject/list/searchbook.jsp?order=new&keyword="+keyword+"&page="+page+"";
	}
	if(selectList.options[selectList.selectedIndex].value == "rowprice"){
		location.href = "/semiproject/list/searchbook.jsp?order=rowprice&keyword="+keyword+"&page="+page+"";
	}
}
</script>
</html>