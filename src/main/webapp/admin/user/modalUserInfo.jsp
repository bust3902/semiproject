<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="java.io.Console"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UserDao userDao = UserDao.getInstance();


String userId = StringUtil.nullToBlank(request.getParameter("userId"));

//요청파라미터에서 사용자 아이디를 조회한다.
User user = userDao.getUserById(userId);

//사용자아이디로 사용자 정보를 조회한다.
Gson gson = new Gson();
String text = gson.toJson(user);
//조회된 사용자정보를 JSON 텍스트로 제공한다.
out.write(text);
// '{"no":10, "name":"홍길동"}'


%>

<!-- 회원정보변경(modal) -->
<div class="modal fade modal-lg" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  	<div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title mt-3" id="staticBackdropLabel"><strong>회원정보변경</strong></h5>
			</div>
			<div class="modal-body">
				<div class="text-center">
				  <img id="" src="/semiproject/img/hong.jpg" style="height:200px; weight:200px;">
				</div>
				<div class="row my-3">
					<h5><strong>회원정보</strong></h5><hr>
					<div class="col-5">
						<p><strong>아이디</strong></p>
							<input class="form-control my-1" id="userId" type="text" value="" disabled readonly>
						<p><strong>전화번호</strong></p>
							<input class="form-control my-1" id="tel" type="text" value="" disabled readonly>
						<p><strong>등록일</strong></p>
							<input class="form-control my-1" id="createdDate" type="text" value="" disabled readonly>
					</div>
					<div class="col">
						<div class="custom-control custom-checkbox my-1">
							<div class="user-group" >
								<p><strong>회원 그룹</strong></p>
								<input type="radio" id="grade-user" name="grade" class="custom-control-input "  >
								<label class="custom-control-label" for="grade-checkbox">일반회원</label>
								
								<input type="radio" id="grade-reject" name="grade" class="custom-control-input"  >
								<label class="custom-control-label" for="grade-checkbox">차단회원</label>
								
								<input type="radio" id="grade-admin" name="grade" class="custom-control-input" >
								<label class="custom-control-label" for="grade-checkbox">운영자</label>
							</div>
						</div>
						<p><strong>세부사항</strong></p>
							<input class="form-control my-1" id="memo" type="text" value="댓글 경고 1회">
					</div>
				</div>
				<div class="row">
					<p><strong>이름</strong></p>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="userName" value="" >
						<label for="userId" class="col-form-label mx-2">name</label>
					</div>
						<p><strong>이메일</strong></p>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="userEmail" value="">
						<label for="userEmail" class="col-form-label mx-2" >e-mail</label>
					</div>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
					<a href="updateuser.jsp"><button type="submit" class="btn btn-primary">변경</button></a>
				</div>
			</div>
		</div>
	</div>
</div>