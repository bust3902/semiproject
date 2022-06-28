<%@page import="com.htabooks.util.MultipartRequest"%>
<%@page import="com.htabooks.dao.AdminDao"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.vo.Book"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	// 상품 정보 변경페이지

	/* // 로그인 후 사용가능한 서비스(세션에 저장된 관리자정보 조회)
	User admin = (User) session.getAttribute("LOGINED_ADMIN");
	if(admin ==null){
		throw new RuntimeException("상품 수정은 관리자만 사용가능한 서비스 입니다.");
	} */
	

	// 요청 파라미터에서 도서 번호와 페이지 번호를 조회
	int bookNo = StringUtil.stringToInt(request.getParameter("no"));
	int currentPage = StringUtil.stringToInt(request.getParameter("page"));
	
	// 도서번호에 해당하는 게시글 정보 조회
	AdminDao adminDao = AdminDao.getInstance();
	BookDto book = adminDao.getBookbyNo(bookNo);
	
	MultipartRequest mr = new MultipartRequest(request, "C:\\eclipse\\workspace-web\\semiproject\\src\\main\\webapp\\img");
	
	// 상품 번호에 해당하는 게시글이 없으면 재요청 URL 보내기
		if(book == null){
			throw new RuntimeException("상품 정보가 존재하지 않습니다.");
		}
		
	
	// 요청파라미터에서 수정된 책제목,저자,설명,가격,수량, 업로드된 파일의 이름을 갱신한다.
	int categoryNo			= StringUtil.stringToInt(mr.getParameter("categoryNo"));
	int paperBookPrice		= StringUtil.stringToInt(mr.getParameter("paperBookPrice"));
	int bookPrice			= StringUtil.stringToInt(mr.getParameter("bookPrice"));
	String title 			= StringUtil.nullToBlank(mr.getParameter("title"));
	String writer 			= StringUtil.nullToBlank(mr.getParameter("writer"));
	String bookIntroduce 	= StringUtil.nullToBlank(mr.getParameter("bookIntroduce"));
	String bookPublisher 	= StringUtil.nullToBlank(mr.getParameter("bookPublisher"));
	String imgFileName 		= StringUtil.nullToBlank(mr.getFilename("imgFileName"));

	
	// 조회된 상품정보의 제목과 내용을 갱신
	book.setCategoryNo(categoryNo);
	book.setPaperBookPrice(paperBookPrice);
	book.setBookPrice(bookPrice);	
	book.setTitle(title);	
	book.setWriter(writer);	
	book.setIntroduce(bookIntroduce);	
	book.setBookPublisher(bookPublisher);
	book.setImgFileName(imgFileName);
	
	// 데이터베이스에 반영
	adminDao.updateBook(book);
	
	// 재요청 URL응답
	response.sendRedirect("(재요청받을 URL)");
%>