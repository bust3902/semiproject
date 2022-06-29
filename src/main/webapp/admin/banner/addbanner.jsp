<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.htabooks.dao.BannerDao"%>
<%@page import="com.htabooks.vo.Banners"%>
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
	if(admin == null){
		response.sendRedirect("(사용자정보 오류 페이지)");
		return; 
} */
	// 요청 파라미터에서 책번호,책제목,저자,설명,가격의 이름을 조회
	
	MultipartRequest mr = new MultipartRequest(request, "C:\\eclipse\\workspace-web\\semiproject\\src\\main\\webapp\\img");
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	int no 				    	= StringUtil.stringToInt(mr.getParameter("no"));
	String imageName			= StringUtil.nullToBlank(mr.getFilename("imgFileName"));
	Date showBeginDate			= formatter.parse(mr.getParameter("showBeginDate"));
	Date showLastDate			= formatter.parse(mr.getParameter("showLastDate"));
	String address				= StringUtil.nullToBlank(mr.getParameter("address"));
	
	// 도서객체를 생성해서 도서리스트 테이블에 저장
	
	Banners banner = new Banners();
	banner.setNo(no);	
	banner.setImageName(imageName);	
	banner.setShowBeginDate(showBeginDate);
	banner.setShowLastDate(showLastDate);
	banner.setAddress(address);
	// 상품 정보를 데이터베이스에 반영
	
	BannerDao bannerDao = BannerDao.getInstance();
	bannerDao.insertBanner(banner);
	
	// 재요청 URL응답
	response.sendRedirect("/semiproject/admin/banner/addbannerform.jsp");
%> 