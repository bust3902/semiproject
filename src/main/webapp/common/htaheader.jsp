<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 왼쪽 상단에 HTA만 나오는 mypage에 사용되는 nav이다. -->
<%
	String menu = request.getParameter("menu");

	User user = (User) session.getAttribute("LOGINED_USER");
%>

    <style>
      .nav-item {
      		color: darkgray !important;
			font-size:14px;
			font-weight: bold;
      }
    </style>

  <nav class="bg-white border-bottom" style="min-width:1170px;">
    <div class="container d-flex flex-wrap" style="min-width:1170px;">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2 active" aria-current="page"></a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2"></a></li>
      </ul>
      
      <ul class="nav ">
		<%
			if (user == null) {
		%>
        <li class="nav-item"><a href="/semiproject/login/registerform.jsp" class="nav-link" style="color:gray">회원가입</a></li>
        <li class="nav-item"><a href="/semiproject/login/loginform.jsp" class="nav-link" style="color:gray">로그인</a></li>
		<%
			} else {
		%>
		
        <li class="nav-item"><a href="/semiproject/cash/chargingform.jsp" class="nav-link" style="color:gray">캐시충전</a></li>
		<%
			}
		%>	
      </ul>

    </div>
  </nav>
  
 <header class="py-2 mb-4 mt-2 ">
	<div class="container d-flex flex-wrap justify-content-center mt-1" style="min-width:1150px;">
		<a href="/semiproject/home.jsp" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-decoration-none" style="font-family: 'Kanit', sans-serif; font-size:34px; font-weight:bold;">
	    	<strong class="bi me-2" style="font-size:35px; color:#00AFFF;">HTA</strong>
	    </a>
	   
		<%
		if (user== null){
		%>
		<div class="mx-2">
			<a href="/semiproject/login/loginform.jsp">
				<img src="/semiproject/img/cart.svg" width="32" height="32" />
			</a>
		</div>
		
		<div class="mx-2" >
			<a href="/semiproject/login/loginform.jsp">
				<img src="/semiproject/img/person.svg" width="32" height="32" />
			</a>
		</div>
		
		<%
		} else {
		%>
		
		<div class="mx-2">

			<a href="/semiproject/cart/mycart.jsp">
				<img src="/semiproject/img/cart.svg" width="32" height="32" />
			</a>
		</div>
		
		<div class="mx-2" >

			<a href="/semiproject/user/mypage.jsp">
				<img src="/semiproject/img/person.svg" width="32" height="32" />
			</a>
		</div>
		<%} %>
	</div>
</header>


</html>