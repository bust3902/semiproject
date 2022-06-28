<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.panel{padding:15px}
	.panel-heading {
		font-size:		25px;
		font-weight: 	bold;
		color: 			dark;
		align:			left;
      }
    .panel a:hover{color: blue}
    li{color:darkgray}
    a{
    text-decoration :	none;
    color:		 		inherit;
    }
</style>

<div>
	<div class="row">
		<div class="col">
			<a href="/semiproject/admin/admin.jsp" class="text-dark text-decoration-none">
		    	<strong class="fs-3 bi me-2"><span class="text-primary">HTA</span>BOOKS</strong>
		    </a>
		</div>
	</div>
	<div class="row">
		<div class="col" >
		<!-- 사이드 바 메뉴-->
		  <!-- 패널 타이틀0 홈 -->
			<div class="panel panel-info bg-white mt-5 ">
				<div class="panel-heading">
			    	<a href="/semiproject/admin/admin.jsp">
					<img src="/semiproject/img/home.png" width="35" height="35" align="left"/>
			   		<span>대시보드</span>
			    	</a>
				</div>
			</div>
				<hr>
			  <!-- 패널 타이틀1 -->
			<div class="panel panel-info bg-white ">
				<div class="panel-heading">
					<img src="/semiproject/img/person.svg" width="35" height="35" align="left"/>
			   		<span>회원</span>
			    </div>
			    <!-- 사이드바 메뉴목록1 -->
			    	<ul class="list-group ">
			      		<li class="list-group-item"><a href="/semiproject/admin/user/userlist.jsp" >회원정보 변경</a></li>
			    	</ul>
			</div>
			  <!-- 패널 타이틀2 -->
			<div class="panel panel-default bg-white">
				<div class="panel-heading">
					<img src="/semiproject/img/box.png" width="35" height="35" align="left"/>
			    	<span>상품</span>
			  </div>
			    <!-- 사이드바 메뉴목록2 -->
			      	<ul class="list-group">
			        	<li class="list-group-item"><a href="/semiproject/admin/product/productlist.jsp">상품정보</a></li>
			        	<li class="list-group-item"><a href="/semiproject/admin/product/addproductform.jsp">상품정보 등록</a></li>
			      </ul>
			</div>      
			<!-- 패널 타이틀3 -->
			<div class="panel panel-info bg-white">
				<div class="panel-heading">
			  		<img src="/semiproject/img/notification.png" width="35" height="35" align="left"/>
			   		<span>공지</span>
			  	</div>
			 <!-- 사이드바 메뉴목록3 -->
			      	<ul class="list-group">
			        	<li class="list-group-item"><a href="#">공지</a></li>
			        	<li class="list-group-item"><a href="/semiproject/admin/notice/addnoticeform.jsp">공지 등록</a></li>
			        	<li class="list-group-item"><a href="#">공지 삭제</a></li>
			        	<!-- 공지게시판으로 연결 삭제버튼추가할것(관리자일때만 활성) -->
			      </ul>
			</div>
			<!-- 패널 타이틀4 -->
			<div class="panel panel-info bg-white">
				<div class="panel-heading">
			  <img src="/semiproject/img/message.png" width="35" height="35" align="left"/>
			    <span>문의</span>
			  </div>
			      <!-- 사이드바 메뉴목록4 -->
			      <ul class="list-group  bg-primary">
			        <li class="list-group-item"><a href="#">문의 답변</a></li> 
			        <!-- 문의게시판으로 연결 삭제버튼추가할것(관리자일때만 활성) -->
			      </ul>
			</div>
			    
			    
			    <!-- 미구현에러페이지에 연결  --!>
			     
			  <!-- 패널 타이틀5 -->
			<div class="panel panel-info bg-white">
				<div class="panel-heading">
			  		<img src="/semiproject/img/advertisement.png" width="35" height="35" align="left"/>
			    	<span>광고</span>
			  	</div>
			      <!-- 사이드바 메뉴목록5 -->
				<ul class="list-group">
			    	<li class="list-group-item"><a href="#">광고 요청</a></li>
			       	<li class="list-group-item"><a href="#">광고 등록</a></li>
			    </ul>
			</div>
			  <!-- 패널 타이틀6 -->
			<div class="panel panel-info  bg-white">
			 	<div class="panel-heading">
			  		<img src="/semiproject/img/calendar.png" width="35" height="35" align="left"/>
			    	<span>일정</span>
			  	</div>
			      <!-- 사이드바 메뉴목록6 -->
				<ul class="list-group">
			 		<li class="list-group-item"><a href="#">일정 등록</a></li>
			 		<li class="list-group-item"><a href="#">일정 변경</a></li>
			  	</ul>
			</div>
		  <!-- 패널 타이틀6 -->
			<div class="panel panel-info  bg-white mb-5" >
			 	<div class="panel-heading">
			  		<img src="/semiproject/img/Hfavicon.ico" width="35" height="35" align="left"/>
			    	<span>홈페이지</span>
			  	</div>
			      <!-- 사이드바 메뉴목록6 -->
				<ul class="list-group">
			 		<li class="list-group-item"><a href="/semiproject/home.jsp">HTABooks</a></li>
			  	</ul>
			</div>
		
		</div> 
	</div>
</div>
