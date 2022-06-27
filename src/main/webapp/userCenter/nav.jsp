<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="com.htabooks.vo.User"%>
<%
	String menu = request.getParameter("menu");
	User user = (User) session.getAttribute("LOGINED_USER");
%>
<style>
   .nav-item {
	font-size:13.5px;
	font-weight: bold;
   }
</style>
  <nav class="bg-info border-bottom fixed-top">
    <div class="container d-flex flex-wrap">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="home.jsp" class="nav-link link-dark px-0"><Strong class="text-white" style="font-size:20px">HTA</strong></a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-1"><Strong class="text-white" style="font-size:17px">|</Strong></a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-0"><Strong class="text-white" style="font-size:20px">고객센터</Strong></a></li>
      </ul>
      
      <ul class="nav">
		<%
			if (user == null) {
		%>
        <li class="nav-item"><a href="/semiproject/login/loginform.jsp" class="btn btn-outline-light btn-sm m-2" role="button">로그인</a></button></li>
		<%
			} else {
		%>
        <li class="nav-item"><a href="/semiproject/login/cash.jsp" class="btn btn-outline-light btn-sm m-2" role="button">문의내역</a></li>
        <li class="nav-item"><a href="/semiproject/login/logout.jsp" class="btn btn-light btn-sm m-2 text-info" role="button">문의등록</a></li>
		<%
			}
		%>	
      </ul>
    </div>
  </nav>