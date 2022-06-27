<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="http://bootstrapk.com/components/" rel="icon">
<style type="text/css">
	label{display:inline-block; width:100px; line-height:50px;}
</style>
</head>
<body>
<%
		UserDao userDao = UserDao.getInstance();
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		int rows = StringUtil.stringToInt(request.getParameter("rows"),15);	
		String keyword = StringUtil.nullToBlank(request.getParameter("keyword"));
		
		// 전체 데이터 갯수 조회
		int totalRows = userDao.getTotalRowsCount();
		// 페이징처리에 필요한 정보를 제공하는 객체 생성
		Pagination pagination = new Pagination(rows, totalRows, currentPage);
		
		
		List<User> userList = null; 
		if(keyword.isEmpty()){
			userList = userDao.getAllUsers(pagination.getBeginIndex(),pagination.getEndIndex());
		}else{
			userList = userDao.getAllUsers(pagination.getBeginIndex(), pagination.getEndIndex(), keyword);
		}
		%>

<div class="col-12">
	<jsp:include page="../../common/adminheader.jsp"></jsp:include>
</div>
<div class="container">
<div class="row">
	<div class="col-2">
		<jsp:include page="../../common/adminsidebar.jsp"></jsp:include>
	</div>
	<div class="col-10">
		<div class="row">
			<p class="invisible" style="width:135px;height:135px;"></p>
		</div>
		
		<div class="row">
			<div class="col">
				<h2>사용자 검색</h2>
				<div class="row mt-5">
					<span><strong>회원 등급</strong></span>
					<div class="col my-2">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="grade" class="custom-control-input" onClick="selectAll(this)" />
							<label class="custom-control-label" for="grade">전체</label>
							<input type="checkbox" name="grade" class="custom-control-input" onClick="checkSelectAll()">
							<label class="custom-control-label" for="grade">일반회원</label>
							<input type="checkbox" name="grade" class="custom-control-input" onClick="checkSelectAll()">
							<label class="custom-control-label" for="grade">차단된 회원</label>
							<input type="checkbox" name="grade" class="custom-control-input" onClick="checkSelectAll()">
							<label class="custom-control-label" for="grade">운영자</label>
						</div>
					</div>
				</div>
				<form id="search-form" class="row g-3" method="get" action="userlist.jsp">
					<input type="hidden" name="page" />
					<input type="hidden" name="rows" />
					
					<div class="col-6 mb-5">
					<div class="input-group">
						<button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">목록</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">번호</a></li>
							<li><a class="dropdown-item" href="#">이름</a></li>
							<li><a class="dropdown-item" href="#">아이디</a></li>
						</ul>
							<input class="form-control" type="text" name="keyword" value="<%=keyword %>" />
							<button class="btn btn-primary mx-1" type="button" onclick="searchKeyword()" style="float:right;">검색</button>
					</div>
					</div>
				</form>
		</div>
		<hr>
		<div class="row mb-5 bg-white">
			<div class="col">
	
				<h2>사용자 정보</h2>
				
			  	<table class="table table-hover">
				    <thead>
				      <tr class="table-primary">
				        <th>번호</th>
				        <th>이름</th>
				        <th>아이디</th>
				        <th>이메일</th>
				        <th>성별</th>
				        <th>차단상태</th>
				        <th>cash</th>
				        <th>소장책</th>
				        <th>생일</th>
				      </tr>
				    </thead>
			    	<tbody>
				    	<%
				    	if(userList.isEmpty()){
				    	%>
						<tr>
							<td colspan="6" class="text-center"><strong>검색결과가 없습니다.</strong></td>
						</tr>	
						<%
						}else{
							for(User user : userList){
						%>
						<tr class="table" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="button" style="cursor:pointer" >
							<td><%=user.getNo() %></td>
							<td><%=user.getName() %></td>
							<td><%=user.getId() %></td>
							<td><%=user.getEmail() %></td>
							<td><%=user.getGender() %></td>
							<td><%=user.getReject() %></td>
							<td><%=user.getCash() %></td>
							<td><%=user.getBookCount() %></td>
							<td><%=user.getBirthDate() %></td>
						</tr>
						<%
							}}
						%>
					</tbody>
				</table>
				<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link <%=pagination.getCurrentPage() == 1 ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() - 1 %>)">이전</a>
					</li>
			<%
				for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
			%>
					<li class="page-item">
						<a class="page-link <%=pagination.getCurrentPage() == num ? "active" : "" %>" href="javascript:clickPageNo(<%=num %>)"><%=num %></a>
					</li>
			<%
				}
			%>
					<li class="page-item">
						<a class="page-link <%=pagination.getCurrentPage() == pagination.getTotalPages() ? "disabled" : "" %>" href="javascript:clickPageNo(<%=pagination.getCurrentPage() + 1 %>)">다음</a>
					</li>
				</ul>
			</nav>
				
			</div>
					<!-- 회원정보변경(modal) -->
				<div class="modal fade modal-lg" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  	<div class="modal-dialog">
					    <div class="modal-content">
							<div class="modal-header">
							  <h5 class="modal-title mt-3" id="staticBackdropLabel"><strong>회원정보변경</strong></h5>
							</div>
							<div class="modal-body">
								<%
								for(User user : userList){
								%>
								<div class="text-center">
								  <img src="/semiproject/img/hong.jpg" style="height:200px; weight:200px;">
								</div>
								<div class="row my-3">
									<h5><strong>회원정보</strong></h5><hr>
									<div class="col-5">
										<p><strong>전화번호</strong></p>
											<input class="form-control my-1" type="text" value="<%=user.getNo() %>" disabled readonly>
										<p><strong>등록일</strong></p>
											<input class="form-control my-1" type="text" value="<%=user.getCreatedDate() %>" disabled readonly>
									</div>
									<div class="col">
										<div class="custom-control custom-checkbox my-1">
											<div class="user-group">
												<p><strong>회원 그룹</strong></p>
												<input type="radio" name="grade-checkbox" class="custom-control-input ">
												<label class="custom-control-label" for="grade-checkbox">일반회원</label>
												<input type="radio" name="grade-checkbox" class="custom-control-input ">
												<label class="custom-control-label" for="grade-checkbox">차단회원</label>
												<input type="radio" name="grade-checkbox" class="custom-control-input ">
												<label class="custom-control-label" for="grade-checkbox">운영자</label>
											</div>
										</div>
										<p><strong>세부사항</strong></p>
											<input class="form-control my-1" type="text" value="댓글 경고 1회">
									</div>
								</div>
								<div class="row">
									<div class="textbox mt-3">
											<p><strong>이름</strong></p>
										<div class="form-floating mb-3">
											<input type="text" class="form-control" id="userId" value="<%=user.getName() %>" placeholder="홍길동">
											<label for="userId" class="col-form-label mx-2">name</label>
										</div>
											<p><strong>이메일</strong></p>
										<div class="form-floating mb-3">
											<input type="text" class="form-control" id="userEmail" value="<%=user.getEmail() %>" placeholder="email@example.com">
											<label for="userEmail" class="col-form-label mx-2" >e-mail</label>
										</div>
									</div>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
									<a href="updateuser.jsp"><button type="submit" class="btn btn-primary">변경</button></a>
								</div>
							<%
							}
							%>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</div>
</div>
<jsp:include page="../../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function clickPageNo(pageNo){
	document.querySelector("input[name=page]").value = pageNo;
	document.getElementById("search-form").submit();
	
}
function searchKeyword(){
	document.querySelector("input[name=page]").value = 1;
	document.getElementById("search-form").submit();
	
}
function updateUser(){
	location.href="updateuser.jsp"
}
function checkSelectAll()  {
	  const checkboxes 
	    = document.querySelectorAll('input[name="grade"]');
	  const checked 
	    = document.querySelectorAll('input[name="grade"]:checked');
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}

function selectAll(selectAll)  {
  const checkboxes 
     = document.getElementsByName('grade');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

</script>
</html>