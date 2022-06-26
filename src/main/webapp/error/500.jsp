<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/500.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container">
   오류가 발생했습니다.
   <%exception.printStackTrace(); %>
   <p><%=exception.getMessage() %> </p>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>