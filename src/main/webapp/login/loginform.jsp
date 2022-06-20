<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="images/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="/common/navcenter.jsp">
		<jsp:param name="menu" value="login"/>
	</jsp:include>


<div class="container-fluid mb-5 bg-info" style="--bs-bg-opacity: .1;">

	<div class="row justify-content-center">
		<div class="col-6 p-5">
		
		
			<form class="" method="post" action="login.jsp" onsubmit="return submitLoginForm()">
				<div class="p-0 m-0">
					<input type="text" class="form-control rounded-0 " name="id" placeholder="아이디"/>
				</div>
				<div class="p-0 m-0 ">
					<input type="password" class="form-control rounded-0 " name="password" placeholder="비밀번호 "/>
				</div>
				
				<%
					String fail = request.getParameter("fail");
				%>
		
				<%
					if ("invalid".equals(fail)) {
				%>
			
			
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
				<symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    				<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  				</symbol>
			</svg>
			
			<div class=" text-danger d-flex align-items-center" role="alert">
  				<svg class="bi flex-shrink-0 me-2" width="22" height="22" role="img" aria-label="Danger:">
  					<use xlink:href="#exclamation-triangle-fill"/>
  				</svg>
  					<div><small>아이디 혹은 비밀번호를 다시 입력해보겠니!!!!!</small></div>
			</div>
			
				<%
					}
				%> 
				
				
			 	<div class="mb-3 border p-2 d-flex justify-content-between">
			 		<div class="form-check form-check-inline">
			 			<input class="form-check-input " type="checkbox" name="" value="" style="width:16px; height:16px; margin-top:7px;">
			 			<label class="form-check-label"><small style="font-size:15px;">로그인 상태 유지</small></label>
			 		</div>
			 		<div>
			 			<a href="" class="text-secondary text-decoration-none"><small style="font-size:15px;" class="pe-1 border-end">아이디 찾기</small></a>
			 			<a href="" class="text-secondary text-decoration-none"><small style="font-size:15px;">비밀번호 재설정</small></a>
			 		</div>
			 	</div>
			 	
			 	<div class="d-grid gap-2">
			 		<button type="submit" class="btn btn-primary">로그인</button>
			 		<a href="registerform.jsp" class="btn btn-outline-secondary">회원가입</a>
			 	</div>
			 	
			</form>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
	
		function submitLoginForm() {
			
			let idField = document.querySelector("input[name=id]");
			if (idField.value === '') {
				alert("아이디는 필수입력값입니다.");
				idField.focus();
				return false;
			}
			
			let passwordField = document.querySelector("input[name=password]");
			if (passwordField.value === '') {
				alert("비밀번호는 필수입력값입니다.");
				passwordField.focus();
				return false;
			}
			
			return true;
		}
	</script>

</html>