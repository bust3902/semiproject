<%@page import="com.htabooks.dao.OftenQuestionsDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.OftenQuestions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
	<%
		int oftenQCno = StringUtil.stringToInt(request.getParameter("no"));
		
		OftenQuestionsDao oftenQuestionsDao = OftenQuestionsDao.getInstance();
		OftenQuestions oftenQuestions = oftenQuestionsDao.getOftenQuestionsContents(oftenQCno);

		if (oftenQuestions == null) {
			throw new RuntimeException("게시글 정보가 존재하지 않습니다.");
		}
	%>
<div class="container">
   <div class="row">
	   	<div class="col-12">
	   		<h1 class="font-left font-weight-bold mt-4 pt-4" id="title">
	   			<%=oftenQuestions.getTitle() %>
	   		</h1>
	   	</div>
   </div>
   <div class="row">
	   	<div class="col">
	   		<p class="col-12"><%=oftenQuestions.getHtmlContent() %></p>
	   	</div>
   </div>
</div>
<jsp:include page="../common/footer.jsp">
<jsp:param name="menu" value="board"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>