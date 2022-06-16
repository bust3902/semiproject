<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String menu = request.getParameter("menu");

	User user = (User) session.getAttribute("LOGINED_USER");
%>

<style>
	.nav-item { font-size:14px; font-weight: bold; }
	.img-center { display: flex; justify-content:center;}
</style>

<nav class="bg-white border-bottom" style="min-width:1094px;">
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
				if (user == null) {
			%>
				<li class="nav-item"><a href="/semiproject/login/register.jsp" class="nav-link" style="color:gray">회원가입</a></li>
				<li class="nav-item"><a href="/semiproject/login/loginform.jsp" class="nav-link" style="color:gray">로그인</a></li>
			<%
				} else {
			%>
				<li class="nav-item"><a href="/semiproject/login/cash.jsp" class="nav-link" style="color:gray">캐쉬충전</a></li>
				<li class="nav-item"><a href="/semiproject/login/logout.jsp" class="nav-link" style="color:gray">로그아웃</a></li>
			<%
				}
			%>	
		</ul>
	</div>
</nav>


<header class="py-2 mb-4">
	<div class="container d-flex flex-wrap justify-content-center mt-1" style="min-width:1094px;">
		<a href="/semiproject/home.jsp" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-decoration-none" style="font-family: 'Kanit', sans-serif; font-size:34px;">
	    	<strong class="fs-3 bi me-2">HTA<span class="text-dark">BOOKS</span></strong>
	    </a>
	    <!-- 
	    <form class="col-12 col-lg-auto mb-3 mb-lg-0">
	    	<input type="search" class="form-control" placeholder="Search..." aria-label="Search">
	    </form>
		 -->
		<div class="mx-2 mt-1">
			<a href="/semiproject/cart/mycart.jsp">
				<img src="/semiproject/img/cart.svg" class="img-center" width="26" height="26" />
			</a>
		</div>
		<div class="mx-2 mt-1">
			<a href="/semiproject/user/mypage.jsp">
				<img src="/semiproject/img/person.svg" class="img-center" width="28" height="28" />
			</a>
		</div>
	</div>
</header>
</html>
    