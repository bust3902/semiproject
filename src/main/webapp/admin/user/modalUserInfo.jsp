<%@page import="com.htabooks.vo.User"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = StringUtil.nullToBlank(request.getParameter("id"));

	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(userId);

	Gson gson = new Gson();
	String text = gson.toJson(user);
	out.write(text);
%>