<%@page import="com.htabooks.dao.QnaAnswerDao"%>
<%@page import="java.util.Date"%>
<%@page import="com.htabooks.vo.QnaAnswer"%>
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
// 카테고리, 이름, 문의내용 저장하기
	String categoryType = request.getParameter("category");
	String name = request.getParameter("name");
	String contents = request.getParameter("contents");
	
	QnaAnswer reqVO = new QnaAnswer();
	reqVO.setCategory(Integer.valueOf(categoryType));
	reqVO.setName(name);
	reqVO.setContents(contents);
	reqVO.setCreated(new Date());
	
	QnaAnswerDao answerDAO = QnaAnswerDao.getInstance();
	answerDAO.insertQnaAnswer(reqVO);
%>

<!-- db로 넘기기 위한 안내페이지 -->
<div class="container">
	<h1>
		정상적으로 처리되었습니다.
		<div>
			<div class="row">
				<div class="col mt-3">
					<button type="button" class="btn btn-outline-primary"
						data-bs-toggle="modal" data-bs-target="#question-modal">
						<a href="a.jsp">문의게시판 보기</a>
					</button>
				</div>
			</div>
		</div>
	</h1>
</body>
</html>