<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dao.AdminDao"%>
<%@page import="com.htabooks.vo.Book"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//상품 정보 삭제페이지

	// 로그인 후 사용가능한 서비스 (세션에 저장된 관리자정보 조회)
	// User admin = (User) session.getAttribute("LOGINED_ADMIN");
	// 요청파라미터에서 상품정보번호를 조회
	int bookNo = StringUtil.stringToInt(request.getParameter("bookNo"));

	BookDao bookDao = BookDao.getInstance();
	AdminDao adminDao = AdminDao.getInstance();
	
	BookDto book = bookDao.getBookByNo(bookNo);	
	
	// 변경된정보를 데이터베이스에 반영
	 adminDao.deletebook(book);
	
	// 상품 리스트페이지로 돌아가기
	response.sendRedirect("productlist.jsp");
	

%>