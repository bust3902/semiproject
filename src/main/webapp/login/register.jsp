<%@page import="com.htabooks.util.PasswordUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");	
	String birthDate = request.getParameter("birthDate");	
	String gender = request.getParameter("gender");	
	UserDao userDao = UserDao.getInstance();
	
	User savedUser = userDao.getUserById(id);
	if(savedUser != null){
		response.sendRedirect("registerform.jsp?fail=id&id=" + id);
		return;
	}
	
	savedUser = userDao.getUserByEmail(email);
	if(savedUser !=null){
		response.sendRedirect("registerform.jsp?fail=email&email="+email);
		return;
	}
	
	//비밀번호 암호화 
	String secretPassword = PasswordUtil.generateSecretPassword(id, password);
//	System.out.println(secretPassword);
	
	User user = new User();
	user.setId(id);
	user.setPassword(secretPassword);
	user.setName(name);
	user.setEmail(email);
	user.setBirthDate(birthDate);
	user.setGender(gender);
	
	userDao.insertUser(user);
	
	response.sendRedirect("../home.jsp");
	
	
%>