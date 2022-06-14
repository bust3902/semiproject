<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String menu = request.getParameter("menu");

	User user = (User) session.getAttribute("LOGINED_USER");
%>

    <style>
      .nav-item {
      		color: darkgray !important;
			font-size:13.5px;
			font-weight: bold;
      }
    </style>

  <nav class="bg-white border-bottom">
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
        <li class="nav-item"><a href="../login/loginform.jsp" class="nav-link" style="color:gray">로그인</a></li>
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
    <div class="container d-flex flex-wrap justify-content-center">
	    <a href="/semiproject/home.jsp" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
	    	<Strong class="fs-3 bi me-2"><span class="text-primary">HTA</span>BOOKS</Strong>
	    </a>
	    <!-- 
	    <form class="col-12 col-lg-auto mb-3 mb-lg-0">
	    	<input type="search" class="form-control" placeholder="Search..." aria-label="Search">
	    </form>
		 -->
		<div class="mx-2">
			<a href="/semiproject/cart/mycart.jsp">
				<img src="/semiproject/img/cart.svg" width="32" height="32" />
			</a>
		</div>
		<div class="mx-2">
			<a href="/semiproject/user/mypage.jsp">
				<img src="/semiproject/img/person.svg" width="32" height="32" />
			</a>
		</div>
    </div>
  </header>


</html>
    