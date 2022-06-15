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
</head>
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="cart"/>
</jsp:include>
<body>
<div class="container">
	<section class="px-auto">
	<h2 class="mb-2">카트</h2>
	<ul>
	<li><a>소장 가능</a></li> 
	<li><a>대여 가능</a></li>
	</ul>
	</section>
   
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>