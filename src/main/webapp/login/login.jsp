<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="com.htabooks.util.PasswordUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String id = request.getParameter("id");
String password = request.getParameter("password");

UserDao userDao = UserDao.getInstance();

User savedUser = userDao.getUserById(id);

if(savedUser == null){
	response.sendRedirect("loginform.jsp?fail=invalid");
	return;
	
}

String secretPassword = PasswordUtil.generateSecretPassword(id, password);

if(!savedUser.getPassword().equals(secretPassword)){
	response.sendRedirect("loginform.jsp?fail=invalid");
	return;
}

session.setAttribute("LOGINED_USER", savedUser);

response.sendRedirect("../home.jsp");



%>