<%@page import="com.htabooks.vo.QnaAnswer"%>
<%@page import="com.htabooks.dao.QnaAnswerDao"%>
<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.vo.QuestionsBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dao.QuestionsBoardDao"%>
<%@page import="com.htabooks.dao.NoticeBoardDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../common/nav.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
	<%
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		int rows = StringUtil.stringToInt(request.getParameter("rows"), 10);	
		
		QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
		
		int totalRows = qnaAnswerDao.getTotalRwos();
		Pagination pagination = new Pagination(rows, totalRows, currentPage);
		
		List<QnaAnswer> qnaAnswerList = qnaAnswerDao.getQnaAnswer(pagination.getBeginIndex(), pagination.getEndIndex());
	%>

<div class="container mt-3">
  <div class="row">
   		<p class="col-9 pt-4 mt-4 fs-1 text-primary"><strong>문의 게시판</strong></p>
   </div>
   
  <div class="mt-4 pt-4 " id="collapse-content">
	  <%
	  	for (QnaAnswer qnaAnswer :  qnaAnswerList) {
	  %>
		  <div class="border mb-4 bg-primary bg-opacity-25">
			  <a href="#demo-<%=qnaAnswer.getNo() %>" class="text-dark text-decoration-none ms-2 mt-1" data-bs-toggle="collapse" onclick="hideOthers(event)">
	  			<%=qnaAnswer.getName() %> │ <%=qnaAnswer.getContents() %> <span class="badge bg-secondary"><%=qnaAnswer.getAnswerCheck() %></span>
			  </a>
			  <div id="demo-<%=qnaAnswer.getNo() %>" class="collapse ms-3 mt-3 me-3 pb-3">
			  <hr>
			  	<div class="p-3 mb-2 bg-white text-dark">
				  	<%=qnaAnswer.getAnswer() %>
			  	</div>
			  </div>
		  </div>
	  <%
	  	}
	  %>
  </div>
  
<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="qnaBoard.jsp?page=<%=pagination.getCurrentPage() - 1 %>">이전</a>
				</li>
		<%
			for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
		%>
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == num ? "active" : "" %>" href="qnaBoard.jsp?page=<%=num %>"><%=num %></a>
				</li>
		<%
			}
		%>
				<li class="page-item">
					<a class="page-link <%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="qnaBoard.jsp?page=<%=pagination.getCurrentPage() + 1 %>">다음</a>
				</li>
			</ul>
		</nav>
</div>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
<script type="text/javascript">
	// [a, a, a, a]
	let collapseLinks = document.querySelectorAll("#collapse-content a");
	
	function hideOthers(event) {
		// 지금 클릭한 링크 엘리먼트
		let clickedLink = event.target;	// 클릭한 a 태그'
		// 클릭한 a태그의 href 속성값
		let clickedLinkId = event.target.getAttribute("href");	// #demo1 혹은 #demo2		
		let clickedLinkDiv = document.querySelector(clickedLinkId);
		if (clickedLinkDiv.classList.contains("collapsed")) {
			return;
		}
	
		// 모든 a태그를 반복처리한다.
		for (let index = 0; index < collapseLinks.length; index++) {
			// a태그를 조회
			let link = collapseLinks[index];
			// 반복처리중인 a태그의 href 값을 조회
			let linkId = link.getAttribute("href");
			// 반복처리중인 a태그의 href값과 클릭한 a 태그의 href 값이 같으면 아무 동작없이 다음번 a태그를 검사하러 간다.
			if (link.getAttribute("href") === clickedLinkId) {
				continue;
			}
			
			//  반복처리중인 a태그의 href값과 클릭한 a 태그의 href 값이 서로 다르면,
			//  조회된 href값으로 div 엘리먼트를 조회한다.
			let div = document.querySelector(linkId);
			// div 엘리먼트가 show 클래스값을 가지고 있으면 해당 링크에서 클릭이벤트를 발생시켜서 닫게 만든다.
			if (div.classList.contains('show')) {
				link.click();
			}
		}
	}
</script>
</html>