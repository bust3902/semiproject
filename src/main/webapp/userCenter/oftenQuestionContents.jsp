<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.OftenQuestions"%>
<%@page import="com.htabooks.dao.QnaCategoriesDao"%>
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
<%
int no = StringUtil.stringToInt(request.getParameter("no"));
QnaCategoriesDao qnaCategoriesDao = QnaCategoriesDao.getInstance();
OftenQuestions oftenQuestions = qnaCategoriesDao.getOftenQuestionsContents(no);
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
	   		<p class="col-12 fs-4" id="contents"><%=oftenQuestions.getContents() %></p>
	   	</div>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>