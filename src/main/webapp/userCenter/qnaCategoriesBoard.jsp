<%@page import="com.htabooks.dao.NoticeBoardDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.NoticeBoard"%>
<%@page import="com.htabooks.dao.QnaCategoriesDao"%>
<%@page import="com.htabooks.vo.OftenQuestions"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%
	QnaCategoriesDao categoriesDao = QnaCategoriesDao.getInstance();
	List<OftenQuestions> oftenQuestionsList = categoriesDao.getOftenQuestions();

	NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	List<NoticeBoard> noticeBoardList = noticeBoardDao.getNoticeBoard(1, 3);
	
	String keyword = StringUtil.nullToBlank(request.getParameter("keyword"));
	
	%>
	<div class="container">
		<div class="row bg-primary text-white">
			<div class="col-8">
				<div class="row mt-5 ps-3">
					<div class="col-12">
						<h1 class="fs-2">검색으로 문제를 빠르게 해결하세요!</h1>
					</div>
				</div>
				<div class="row mt-1 ps-3 pt-2">
					<form id="search-form" class="row g-3" method="get" action="qnaCategoriesBoard.jsp">
						<div class="col-9">
							<input type="text" class="form-control" name="keyword" value="<%=keyword %>" />
						</div>
						<div class="col-3">
							<button type="button" class="btn btn-secondary" onclick="searchKeyword()">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-4 p-3">
				<img src="../img/ridi.png" class="rounded float-end" height="200" width="200">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-2">
				<p class="fs-4"><a href="/semiproject/userCenter/noticeBoard.jsp"><strong>공지사항 ></strong></a></p>
			</div>
			<div class="row">
				<div class="col-12 mt-2">
					<table class="table col">
						<%
						for (NoticeBoard noticeBoard : noticeBoardList) {
						%>
						<tr>
							<th><a
								href="/semiproject/userCenter/NoticeBoardContents.jsp?no=<%=noticeBoard.getNo()%>">
									<%=noticeBoard.getTitle()%>
							</a></th>
						</tr>
						<%
						}
						%>
					</table>
				</div>
			</div>
			<div class="row mt-4 pt-4">
				<div class="col-2">
					<p class="fs-4"><strong>자주 묻는 질문</strong></p>
				</div>
				<div>
					<div class="col-12 mt-2">
						<table class="table col">
							<%
							for (OftenQuestions oftenQuestions : oftenQuestionsList) {
							%>
							<tr>
								<th>
									<a href="/semiproject/userCenter/oftenQuestionContents.jsp?no=<%=oftenQuestions.getNo()%>">
									<%=oftenQuestions.getTitle()%>
									</a>
								</th>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div>
			<div class="row">
				<div class="col mt-3">
					<button type="button" class="btn btn-outline-primary me-2"
						data-bs-toggle="modal" data-bs-target="#question-modal">
						1:1	문의하기
					</button>
					<a class="btn btn-outline-primary" href="a.jsp" role="button">문의게시판 보기</a>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" tabindex="-1" id="question-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">질문 작성폼</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form class="border bg-light p-3" action="qnaRightResult.jsp"
					method="post">
					<div class="modal-body">
						<div class="mb-3">
							<select class="form-control" name="category">
								<option value="" selected="selected" disabled="disabled">
									카테고리를 선택하세요</option>
								<option id="login" value="1">회원계정/로그인</option>
								<option id="payment" value="2">결제/영수증</option>
								<option id="refund" value="3">환불/해지</option>
								<option id="error" value="4">오류/문제해결</option>
								<option id="event" value="5">이벤트/혜택</option>
								<option id="select" value="6">셀렉트</option>
								<option id="paper" value="7">페이퍼</option>
							</select>
						</div>
						<div class="mb-3">
							<textarea rows="1" class="form-control" id="name" name="name"
								placeholder="이름을 입력하세요."></textarea>
							<textarea rows="4" class="form-control mt-2" id="contents" name="contents"
								placeholder="문의 내용을 입력하세요."></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

function searchKeyword() {
	document.querySelector("input[name=page]").value = 1;
	document.querySelector("input[name=rows]").value = document.querySelector("select[name=rows]").value;
	document.getElementById("search-form").submit();
}

</script>
</body>
</html>