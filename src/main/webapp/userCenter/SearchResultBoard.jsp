<%@page import="com.htabooks.vo.OftenQuestions"%>
<%@page import="com.htabooks.dao.OftenQuestionsDao"%>
<%@page import="com.htabooks.vo.QnaAnswer"%>
<%@page import="com.htabooks.dao.QnaAnswerDao"%>
<%@page import="com.htabooks.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
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

<style>
	a.result {
		text-decoration:none;
		font-weight:bold;
		font-size:17px;
		color:black;
	}
</style>
</head>
<body>
<div class="container">
   <div class="col-6 mt-5">
	<%	
		String keyword = StringUtil.nullToBlank(request.getParameter("keyword"));

		NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
		OftenQuestionsDao oftenQuestionsDao = OftenQuestionsDao.getInstance();
		
		List<NoticeBoard> noticeBoardList = noticeBoardDao.getSearchNoticeBoard(keyword);
		List<OftenQuestions> oftenQuestion = oftenQuestionsDao.getSearchOftenQuestions(keyword);
		
		int num = (int)noticeBoardList.size() + (int)oftenQuestion.size();
	%>
		<div class="row mt-1 ps-3 pt-2">
			<div class="row">
				<form id="search-form" class="row g-3" method="get" action="SearchResultBoard.jsp">
					<div class="col-4 px-0">
						<input type="text" class="form-control" name="keyword" value="<%=keyword %>" placeholder="검색" />
					</div>
						<div class="col-2">
							<button type="submit" class="btn btn-secondary">검색</button>
						</div>
				</form>
			</div>
		</div>
  	</div>
  	<div class="row">
	   	<div class="col-12 mt-3 mp-3">
	   		<font size="6" color="#0d6efd"><strong>검색 결과</strong></font>
	  	</div>
	  	<div>
	  		<font size="3">(<%=keyword %>)에 대한 (<%=num %>)개의 결과</font>
	  	</div>
	</div>
	<h4 class="mt-5">공지사항</h4>
	<%
		for (NoticeBoard notice : noticeBoardList) {
	%>
	<div class="search-result">
		<a class="result" href="/semiproject/userCenter/NoticeBoardContents.jsp?no=<%=notice.getNo() %>"><%=notice.getTitle() %></a>
	</div>
	<%
		}
	%>
	<h4 class="mt-5">자주 묻는 질문</h4>
	<%

		for (OftenQuestions often : oftenQuestion) {
	%>
	<div class="search-result">
		<a class="result" href="/semiproject/userCenter/NoticeBoardContents.jsp?no=<%=often.getNo() %>"><%=often.getTitle() %></a>
	</div>
	<%
		}
	%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>