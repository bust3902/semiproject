<%@page import="com.htabooks.util.MultipartRequest"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dao.AdminDao"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.vo.Book"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 상품 추가페이지

	/* // 로그인 후 사용가능한 서비스 (세션에 저장된 관리자정보 조회)
	User admin = (User) session.getAttribute("LOGINED_ADMIN");
	if (admin == null) {
	throw new RuntimeException("관리자 페이지는 관리자 로그인 후 사용가능한 서비스 입니다.");
	}
} */
	// 요청 파라미터에서 책번호,책제목,저자,설명,가격의 이름을 조회
	
	MultipartRequest mr = new MultipartRequest(request, "C:\\eclipse\\workspace-web\\semiproject\\src\\main\\webapp\\img");
	
	int bookNo 				= StringUtil.stringToInt(mr.getParameter("bookNo"));
	int categoryNo			= StringUtil.stringToInt(mr.getParameter("categoryNo"));
	int paperBookPrice		= StringUtil.stringToInt(mr.getParameter("paperBookPrice"));
	int bookPrice			= StringUtil.stringToInt(mr.getParameter("bookPrice"));
	int categoryGroupNo		= StringUtil.stringToInt(mr.getParameter("categoryGroupNo"));
	String title 			= StringUtil.nullToBlank(mr.getParameter("title"));
	String writer 			= StringUtil.nullToBlank(mr.getParameter("writer"));
	String bookIntroduce 	= StringUtil.nullToBlank(mr.getParameter("bookIntroduce"));
	String bookPublisher 	= StringUtil.nullToBlank(mr.getParameter("bookPublisher"));
	String imgFileName 		= StringUtil.nullToBlank(mr.getFilename("imgFileName"));
	
	
	// 도서객체를 생성해서 도서리스트 테이블에 저장
	
	BookDto book = new BookDto();
	book.setNo(bookNo);	
	book.setTitle(title);	
	book.setCategoryNo(categoryNo);
	book.setCategoryGroupNo(categoryGroupNo);
	book.setWriter(writer);	
	book.setPaperBookPrice(paperBookPrice);
	book.setBookPrice(bookPrice);	
	book.setIntroduce(bookIntroduce);
	book.setBookPublisher(bookPublisher);
	book.setImgFileName(imgFileName);
	// 상품 정보를 데이터베이스에 반영
	
	AdminDao adminDao = AdminDao.getInstance();
	adminDao.insertBook(book);
	
	// 재요청 URL응답
	response.sendRedirect("/semiproject/admin/product/productlist.jsp");
%> 