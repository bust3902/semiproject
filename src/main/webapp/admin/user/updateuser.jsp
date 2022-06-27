<%@page import="com.htabooks.dao.AdminDao"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 유저 정보 변경페이지

	// 로그인 후 사용가능한 서비스(세션에 저장된 관리자정보 조회)
	User adminAccess = (User) session.getAttribute("LOGINED_ADMIN");
	if(adminAccess ==null){
		throw new RuntimeException("상품 수정은 관리자만 사용가능한 서비스 입니다.");
	}
	
	// 요청 파라미터에서 사용자 아이디와 페이지 번호를 조회
	String id = request.getParameter("userId");
	int currentPage = Integer.parseInt(request.getParameter("page"));

	// 사용자 아이디에 해당하는 사용자 정보 조회
	UserDao userDao = UserDao.getInstance();
	AdminDao adminDao = AdminDao.getInstance();
	
	User user = userDao.getUserById(id);
	// 사용자 아이디에 해당하는 사용자정보가 없으면 재요청 URL 보내기
	if(user ==null){
		throw new RuntimeException("사용자 정보가 존재하지 않습니다.");
	}

	// 요청파라미터에서 수정된 사용자정보를 갱신
	id = request.getParameter("userId");
	String email = request.getParameter("userEmail");
	int cash = Integer.parseInt(request.getParameter("userCash"));
	String admin = request.getParameter("admin");
	String reject = request.getParameter("userReject");
	
	// 조회된 사용자정보를 갱신
	user.setId(id);
	user.setEmail(email);
	user.setCash(cash);
	user.setAdmin(admin);
	user.setReject(reject);
	
	// 데이터베이스에 반영
	adminDao.updateUser(user);
	
	// 재요청 URL응답
	response.sendRedirect("/semiproject/admin/user/userlist.jsp");
%>