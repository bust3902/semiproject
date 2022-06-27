<%@page import="com.htabooks.vo.NoticeBoard"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* // 공지사항 등록 페이지

	// 로그인 후 사용가능한 서비스 (세션에 저장된 관리자정보 조회)
	User admin = (User) session.getAttribute("LOGINED_ADMIN");
	if(admin == null){
		response.sendRedirect("(사용자정보 오류 페이지)");
		return;
	
	// 공지게시판 파라미터조회
	int no 			= Integer.parseInt(request.getparameter("boardNo"));
	String title	= request.getParameter("boardTitle");
	String contents	= request.getParameter("boardContents");
	String deleted	= request.getParameter("boardDeleted");
	// 공지게시판 생성	
	NoticeBoard nB = new NoticeBoard();
	nB.setNo(no);
	nB.setTitle(title);
	nB.setContents(contents);
	nB.setDeleted(deleted);
	// 등록	
	// NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	// noticeBoardDao.insertBoard();
	
	// 재요청URL응답
	response.sendRedirect("");
		 */
%>