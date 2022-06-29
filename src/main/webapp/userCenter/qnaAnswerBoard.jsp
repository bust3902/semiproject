<%@page import="com.htabooks.vo.QnaAnswer"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.dao.QnaAnswerDao"%>
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
</head>
<body>
	<%
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		int rows = StringUtil.stringToInt(request.getParameter("rows"), 5);	
		
		QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
		
		int totalRows = qnaAnswerDao.getTotalRwos("n");		
		Pagination pagination = new Pagination(rows, totalRows, currentPage);
		
		List<QnaAnswer>qnaAnswerList = qnaAnswerDao.getQnaAnswer("n", pagination.getBeginIndex(), pagination.getEndIndex());
	%>
<div class="container">
    <div class="mb-3">
    <%
	  	for (QnaAnswer qnaAnswer :  qnaAnswerList) {
	%>
		 <form method="post" action="answer.jsp" name="page" id="search-form">
		  <input type="hidden" name="no"  value="<%=qnaAnswer.getNo() %>">
		  <label for="formGroupExampleInput2" class="form-label mt-3">
		  	<ul class="list-group" id="search-form">
		  		<li>
				  <%=qnaAnswer.getName() %>│<%=qnaAnswer.getContents() %>
		  		</li>
		  	</ul>
		  </label>
		  <input type="<%=qnaAnswer.getAnswer() %>" class="form-control" name="answer" id="formGroupExampleInput2" placeholder="답변 내용을 입력하세요"></input>
		  <div class="col-3">
			<button type="submit" class="btn btn-primary mt-1">확인</button>
		  </div>
		  <br>
		  </form>
	<%
	  	}
	%>
	</div>
	<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="qnaAnswerBoard.jsp?page=<%=pagination.getCurrentPage() - 1 %>">이전</a>
				</li>
		<%
			for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
		%>
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == num ? "active" : "" %>" href="qnaAnswerBoard.jsp?page=<%=num %>"><%=num %></a>
				</li>
		<%
			}
		%>
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="qnaAnswerBoard.jsp?page=<%=pagination.getCurrentPage() + 1 %>">다음</a>
				</li>
			</ul>
		</nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">	
	
</script>
</body>
</html>