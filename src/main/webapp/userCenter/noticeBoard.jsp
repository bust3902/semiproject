<%@page import="com.htabooks.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.dao.NoticeBoardDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css"> 
	a { text-decoration:none } 
</style> 
</head>
<body>
	<%

		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		int rows = StringUtil.stringToInt(request.getParameter("rows"), 5);	
		String keyword = StringUtil.nullToBlank(request.getParameter("keyword"));
		
		NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
		// 전체 데이터 갯수 조회
		int totalRows = 0;
		if (keyword.isEmpty()) {
			totalRows = noticeBoardDao.getTotalRows();
		} else {
			totalRows = noticeBoardDao.getTotalRows(keyword);
		}
		// 페이징처리에 필요한 정보를 제공하는 객체 생성
		Pagination pagination = new Pagination(rows, totalRows, currentPage);
		
		// 요청한 페이지번호에 맞는 데이터 조회하기
		List<NoticeBoard> noticeBoardList = null;
		if (keyword.isEmpty()) { 
			noticeBoardList = noticeBoardDao.getNoticeBoard(pagination.getBeginIndex(), pagination.getEndIndex());
		} else {
			noticeBoardList = noticeBoardDao.getNoticeBoard(pagination.getBeginIndex(), pagination.getEndIndex(), keyword);
		}
	%>
<div class="container">

   	<div class="row">
   		<div class="col-8 mt-4 pt-4">
   			<h1 class="text-primary">공지사항</h1>
  		</div>
  		<div class="col-4 mt-4 pt-4">
        	<nav class="navbar">
        		<div class="container-fluid" style="justify-content:end">
		    		<form class="row row-cols-lg-auto g-3 align-items-center" id="search-form" action="noticeBoard.jsp">
		    			<div class="col-12">
							<input type="hidden" name="page" />
			      			<input class="form-control" type="search" placeholder="검색" aria-label="검색">
		    			</div>
		    			<div class="col-12">
		      				<button class="btn btn-outline-success" type="submit">검색</button>
		    			</div>
		    		</form>
		  		</div>
			</nav>
  		</div>
		<div>
			<ul class="list-group list-group-flush mt-5">
				<%
					for (NoticeBoard noticeBoard : noticeBoardList) {
				%>
				  <li class="list-group-item">
				  	<a class="link-dark" href="/semiproject/userCenter/NoticeBoardContents.jsp?no=<%=noticeBoard.getNo() %>" ><strong><%=noticeBoard.getTitle() %></strong></a>
				  </li>
				<%
					}
				%>
			</ul>		
	   	</div>
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() - 1 %>)">이전</a>
				</li>
		<%
			for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
		%>
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == num ? "active" : "" %>" href="javascript:clickPageNo(<%=num %>)"><%=num %></a>
				</li>
		<%
			}
		%>
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() + 1 %>)">다음</a>
				</li>
			</ul>
		</nav>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">	
	function clickPageNo(pageNo) {
		document.querySelector("input[name=page]").value = pageNo;
		document.getElementById("search-form").submit();
	}
</script>
</body>
</html>