<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
<%
	String menu = request.getParameter("menu");

	User admin = (User) session.getAttribute("LOGINED_ADMIN");
%>

	<div class="bg-white border-bottom">
	    <div class="container d-flex flex-wrap">
	      	<ul class="nav me-auto">
				<li class="nav-item"><a href="#" class="nav-link link-dark px-2 active" aria-current="page"></a></li>
			    <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
			    <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
			    <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
			    <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
	      	</ul>
	      
	      	<ul class="nav">
			<%
				if (admin == null) {
			%>
		    	<li class="nav-item"><a href="/semiproject/admin/loginform.jsp" class="nav-link" style="color:gray">로그인</a></li>
			<%
				} else {
			%>
		        <li class="nav-item"><a href="/semiproject/login/logout.jsp" class="nav-link" style="color:gray">로그아웃</a></li>
			<%
				}
			%>	
		    </ul>
		</div> 
	</div>
</div>