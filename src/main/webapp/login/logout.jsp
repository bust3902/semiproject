<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
session.invalidate();

response.sendRedirect("../home.jsp");


%>