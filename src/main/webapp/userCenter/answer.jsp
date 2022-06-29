<%@page import="com.htabooks.vo.QnaAnswer"%>
<%@page import="com.htabooks.dao.QnaAnswerDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// int 값으로 반환하고, request.getParameter로 요청"no"는 jsp에서 name값이다.
	int no = StringUtil.stringToInt(request.getParameter("no"));
	// Stirng 값으로 반환하고, request.getParameter로 요청"answer"는 jsp에서 name값이다.
	String answer = request.getParameter("answer");
	
	// dao 불러오기
	QnaAnswerDao dao = QnaAnswerDao.getInstance();
	QnaAnswer qnaAnswer = dao.getQnaAnswer(no);
	qnaAnswer.setAnswer(answer);
	
	// dao에서 updateAnswer 불러오기
	dao.updateAnswer(qnaAnswer);
	
	// 응답 주소
	response.sendRedirect("qnaAnswerBoard.jsp");
%>