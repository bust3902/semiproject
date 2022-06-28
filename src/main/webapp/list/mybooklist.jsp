<%@page import="java.util.List"%>
<%@page import="com.htabooks.dto.UserDto"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.vo.User"%>
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
</head>
<body>
<div class="container p-0 ms-4"style="width:100vw;">
	<div class="row" style="height:70px; width:100vw; background-color:#fff;">

	<!-- 로그인 된 유저 정보를 불러온다 -->
	<%
		User user = (User) session.getAttribute("LOGINED_USER");
		
		UserDao userDao = UserDao.getInstance();
		
		String keyword = request.getParameter("keyword");
		
	%>
		<div class="row mt-0">
		<!-- 헤더부 -->
			<div class="col-1"></div>
			<div class="col-2 mt-3"><strong class="ms-4" style="font-size:20px;"> 내 서재</strong></div>
			<div class="col-7"></div>
			<div class="col-1 mt-3">
				<a href="/semiproject/home.jsp" style="text-decoration:none;">
					<strong style="color:gray; font-size:20px; text-decoration:none;">HTABooks </strong>
				</a>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<!-- 검색창, 유저명 -->
	<div class="row" style="height:55px; width:100vw; background-color:#eee; border-top:solid 1px lightgray;">
	    <div class="col-1"></div>
		    <div class="col-2">
			    <form id="search-form" class="col-12 col-lg-auto my-3 me-5 mb-lg-0" method="get" action="/semiproject/list/mybooklist.jsp">
			    	<div class="col-12">
			    		<input type="text" class="form-control" name="keyword" placeholder="Search...">
			    		<input type="hidden" class="form-control" name="page" value="1">
			    	</div>
			    </form>
		    </div>
	    <div class="col-6"></div>
	    <div class="col-2 text-center ms-3 mt-4"><strong style="font-size:15px;"><%=user != null ? user.getName() : "손님" %> 님의 서재</strong></div>
	    <div class="col-1"></div>
	</div>
	<%
		if (user != null) {
			
			// 페이징기능
			int rows = 25;
			int pages = 5;
			int records = 0;
			
			if (keyword.isEmpty()) {
				records = userDao.getUserBooksCnt(user.getNo()).size();
			} else {
				records = userDao.getUserBooksSearchCnt(user.getNo(), keyword).size();
			}
			if (records == 0) {
				records +=1;
			}
			int totalPages = (int) (Math.ceil((double) records/rows));
			int totalBlocks = (int) (Math.ceil((double) totalPages/pages));
			
			// 페이지 파라미터
			String pageNum = request.getParameter("page");
			if (pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(request.getParameter("page"));
			
			if (currentPage <= 0 || currentPage > totalPages) {
				response.sendRedirect("mybooklist.jsp?keyword=&page=1");
				return;
			}
			
			int currentBlock = (int) (Math.ceil((double) currentPage/pages));
			
			int beginPage = (currentBlock -1)*pages + 1;
			int endPage = (currentBlock == totalBlocks ? totalPages : currentBlock*pages);
			
			int beginIndex = (currentPage-1)*rows +1;
			int endIndex = currentPage*rows;

			// 사용자
			user = userDao.getUserById(user.getId());
			// 사용자 책 리스트
			List<UserDto> bookList = null;
			if (keyword.isEmpty()) {
				bookList = userDao.getUserBooks(user.getNo(), beginIndex, endIndex);
			} else {
				bookList = userDao.getSearchUserBooks(user.getNo(), keyword, beginIndex, endIndex);
			}
	%>
	<div class="row" style="height:100vh; width:100vw; border-top:solid 1px lightgray; ">
		<div class="row text-center">
		<div class="col-1"></div>
			<div class="col-10">
			<div class="row" style="height:40px;"></div>
				<!-- 사용자가 구매한 책 리스트 이미지로 출력 -->
				<div class="row">
				<%
					for (UserDto book : bookList) {
				%>
					<div class="col-2 mt-5">
						<a href="detail.jsp?bookNo=<%=book.getBookNo() %>"><img src="../img/<%=book.getImgFileName() %>" style="max-width:140px; height:auto;"></a>
					</div>
				<%
					}
				
				%>
				</div>
				<div class="row text-center">
					<!-- 페이지네이션 버튼기능 -->
					<nav>
						<ul class="pagination">
							<li class="page-item">
								<a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="mybooklist.jsp?keyword=<%=keyword %>&page=<%=currentPage -1 %>">이전</a>
							</li>
						<%
							for (int num = beginPage; num <= endPage; num++) {
						%>
							<li class="page-item <%=currentPage == num ? "active" : "" %>">
								<a class="page-link" href="mybooklist.jsp?keyword=<%=keyword %>&page=<%=num %>"><%=num %></a>
							</li>
						<%
							}
						%>
							<li class="page-item">
								<a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="mybooklist.jsp?keyword=<%=keyword %>&page=<%=currentPage + 1 %>">다음</a>
							</li>
						</ul>
					</nav>
				</div>
				<%
					}
				%>
			</div>
		<div class="col-1"></div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>