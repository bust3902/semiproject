<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
    	//세션에서 로그인된 관리자정보를 조회한다.
	User admin = (User) session.getAttribute("LOGINED_ADMIN");
	if (admin == null) {
		throw new RuntimeException("관리자 페이지는 관리자 로그인 후 사용가능한 서비스 입니다.");
	}
%>   --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배너 등록 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.title{
	font-size:35px;
	font-weight:bold;
}

</style>
</head>
<body>
<div class="col-12">
	<jsp:include page="/common/adminheader.jsp"></jsp:include>
</div>
<div class="container">
	<div class="row">
		<div class="col-2">
			<jsp:include page="/common/adminsidebar.jsp"></jsp:include>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="invisible" style="width:135px;height:135px;">여백</div>
			</div>
			<h2>배너등록</h2>
			<div class="row my-5">
			
				<div class="text-center my-3">
					<img src="/semiproject/img/nofile.png" id="img" style="height:200px; weight:200px; border:1px solid black;">
				</div>
				<hr>
				<form class="row mt-5" method="post" action="addbanner.jsp" enctype="multipart/form-data" onsubmit="return submitBoardForm()">
					<div class="col-4 mt-2 mb-2">
						<div class="form-floating mb-2">
							<input type="date" class="form-control" name="showBeginDate" placeholder="배너 시작일">
							<label for="showBeginDate">배너 시작일</label>
						</div>
						<div class="form-floating mb-2">
							<input type="date" class="form-control" name="showLastDate" placeholder="배너 종료일">
							<label for="showLastDate">배너 종료일</label>
						</div>
						<div class="form-floating mb-2">
							<input type="text" class="form-control" name="address" placeholder="링크 주소">
							<label for="address">링크 주소</label>
						</div>
					</div>
		
					<div class="row">
						<div class="col my-3">
							<input class="form-control form-control-sm" name="imgFileName" id="formFileSm" type="file">
							<div>
								<button class="btn btn-primary mx-3 mt-2" type="submit" style="float:right;" value="">등록</button>
								<button class="btn btn-outline-secondary  mt-2" type="reset"style="float:right;" value="" >초기화</button>
							</div>
						</div>			
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>