<%@page import="com.htabooks.dao.AdminDao"%>
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
		AdminDao adminDao = AdminDao.getInstance();
		
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		int rows = StringUtil.stringToInt(request.getParameter("rows"),10);	
		String keyword = StringUtil.nullToBlank(request.getParameter("keyword"));
		
		// 전체 데이터 갯수 조회
		int totalRows = userDao.getTotalRowsCount();
		// 페이징처리에 필요한 정보를 제공하는 객체 생성
		Pagination pagination = new Pagination(rows, totalRows, currentPage);
		
		
		List<User> userList = null; 
		if(keyword.isEmpty()){
			userList = adminDao.getAllUsers(pagination.getBeginIndex(),pagination.getEndIndex());
		}else{
			userList = adminDao.getAllUsers(pagination.getBeginIndex(), pagination.getEndIndex(), keyword);
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
							<input type="checkbox" name="gradeCheck" class="custom-control-input" onClick="selectAll(this)" />
							<label class="custom-control-label" for="gradeCheck">전체</label>
							<input type="checkbox" name="gradeCheck" class="custom-control-input" onClick="checkSelectAll()">
							<label class="custom-control-label" for="gradeCheck">일반회원</label>
							<input type="checkbox" name="gradeCheck" class="custom-control-input" onClick="checkSelectAll()">
							<label class="custom-control-label" for="gradeCheck">차단된 회원</label>
							<input type="checkbox" name="gradeCheck" class="custom-control-input" onClick="checkSelectAll()">
							<label class="custom-control-label" for="gradeCheck">운영자</label>
						</div>
					</div>
				</div>
				<form id="search-form" class="row g-3" method="post" action="userlist.jsp">
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
						<tr onclick="openModal('<%=user.getId() %>')">
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
			<div>
			<jsp:include page="modalUserInfo.jsp">
				<jsp:param name="" value=""/>
			</jsp:include>
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
let modal = new bootstrap.Modal(document.getElementById('staticBackdrop'));

function openModal(id) {
	document.getElementById("userId").value = id;
	let xhr = new XMLHttpRequest();	
	
	xhr.onreadystatechange = function(){	
		if(xhr.readyState === 4 && xhr.status ===200){
			let Text = xhr.responseText;			
			let data = JSON.parse(Text); 
			
			document.getElementById("createdDate").value = data.createdDate;
			document.getElementById("tel").value = data.tel;
			document.getElementById("memo").value = data.memo;
			document.getElementById("userName").value = data.name;
			document.getElementById("userEmail").value = data.email;
		}
	xhr.open("GET", 'modalUserInfo.jsp?id=' + id,'name='+ name);	
	xhr.send();						
	
}
	modal.show();
	
}



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
	    = document.querySelectorAll('input[name="gradeCheck"]');
	  const checked 
	    = document.querySelectorAll('input[name="gradeCheck"]:checked');
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
     = document.getElementsByName('gradeCheck');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

</script>
</html>