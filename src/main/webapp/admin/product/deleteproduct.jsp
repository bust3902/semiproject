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
	User admin = (User) session.getAttribute("LOGINED_ADMIN");
	// 요청파라미터에서 상품정보번호를 조회
	int bookNo = StringUtil.stringToInt(request.getParameter("bookNo"));

	if(admin == null){
		response.sendRedirect("(사용자정보 오류 페이지)");
		return; 
}
	BookDao bookDao = BookDao.getInstance();
	AdminDao adminDao = AdminDao.getInstance();
	
	BookDto book = bookDao.getBookByNo(bookNo);	
	
	
	// 게시글 정보의 삭제여부 Y로 변경
	/*  book.setDeleted("Y"); */
		// book.vo에 private String deleted 추가
		// book DB에 Deleted 추가 (char(1), "Y","N" 기본값 "N")
	
	/*
		deleteBook로 완전히 삭제하지않는이유 
			전자책시장에서는 자주 삭제되었다가 재등록되는 경우가 많기때문에.
	
	*/
	
	// 변경된정보를 데이터베이스에 반영
	 adminDao.updateBook(book);
	
	// 상품 리스트페이지로 돌아가기
	response.sendRedirect("productlist.jsp");
	

%>