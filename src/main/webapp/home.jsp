<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</head>
<body>
<div class="container">
   <h1>hello world!</h1>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
<jsp:include page="common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</html>