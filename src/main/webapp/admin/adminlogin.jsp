<%@page import="com.htabooks.dao.AdminDao"%>
<%@page import="com.htabooks.util.PasswordUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청파라미터값을 조회한다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	AdminDao adminDao = AdminDao.getInstance();
	// 아이디로 관리자 정보를 조회한다.
	User saveAdmin = adminDao.getAdminById(id);
	if (saveAdmin == null) {
		response.sendRedirect("../login/loginform.jsp?fail=invalid");
		return;
	}
	
	String secretPassword = PasswordUtil.generateSecretPassword(id, password);
	// 비밀번호가 일치하는지 확인한다.
	if (!saveAdmin.getPassword().equals(secretPassword)) {
		response.sendRedirect("../login/loginform.jsp?fail=invalid");
		return;
	}
	
	
	// 세션객체에 사용자정보를 저장한다.
	session.setAttribute("LOGINED_ADMIN", saveAdmin);
	
	// 재요청URL을 응답으로 보낸다.
	response.sendRedirect("/semiproject/admin/admin.jsp");
%>