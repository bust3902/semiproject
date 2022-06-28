<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String menu = request.getParameter("menu");

	User user = (User) session.getAttribute("LOGINED_USER");
	
	String redirect = request.getParameter("redirect");
%>

<style>
	.nav-item { font-size:14px; font-weight: bold; }
	.img-center { display: flex; justify-content:center;}
</style>

<nav class="bg-white border-bottom" style="min-width:1149px;">
	<div class="container d-flex flex-wrap p-0" style="min-width:1149px;">
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
				<li class="nav-item"><a href="/semiproject/login/registerform.jsp" class="nav-link" style="color:gray">회원가입</a></li>
				<li class="nav-item"><a href="/semiproject/login/loginform.jsp?<%=redirect %>" class="nav-link" style="color:gray">로그인</a></li>
			<%
				} else {
			%>
				<li class="nav-item"><a href="/semiproject/cash/chargingform.jsp" class="nav-link" style="color:gray">캐시충전</a></li>
				<li class="nav-item"><a href="/semiproject/login/logout.jsp" class="nav-link" style="color:gray">로그아웃</a></li>
			<%
				}
			%>	
		</ul>
	</div>
</nav>


<header class="py-2 px-0 mb-4 mt-2">
	<div class="container d-flex flex-wrap justify-content-center mt-1 px-3" style="min-width:1149px;">
		<a href="/semiproject/home.jsp" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-decoration-none" style="font-family: 'Kanit', sans-serif; font-size:34px;">
	    	<strong class="bi me-2" style="font-size:35px; color:#00AFFF;">HTA<span class="text-dark">BOOKS</span></strong>
	    </a>
	    
	    <form id="search-form" class="col-12 col-lg-auto my-3 me-5 mb-lg-0" method="get" action="/semiproject/list/searchbook.jsp">
	    	<div class="col-12">
	    		<input type="hidden" name="order" value="popularity" />
	    		<input type="text" class="form-control" name="keyword" placeholder="Search...">
				<input type="hidden" name="page" value="1" />
	    	</div>
	    </form>
	    
		<div class="mx-2 mt-3">
			<a href="/semiproject/cart/mycart.jsp">
				<img src="/semiproject/img/cart.svg" width="32" height="32" />
			</a>
		</div>
	    <%
	    	if (user == null){
	    %>
		<div class="mx-2 mt-3" >

			<a href="/semiproject/login/loginform.jsp">
				<img src="/semiproject/img/person.svg" width="32" height="32" />
			</a>
		</div>
		
		<%} else { %>

		<div class="mx-2 mt-3">
			<a href="/semiproject/user/mypage.jsp">
				<img src="/semiproject/img/person.svg" width="32" height="32" />
			</a>
		</div>
		
		<%
		} 
		%>
	</div>
</header>
    