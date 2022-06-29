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
<title>상품등록 페이지</title>
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
		<h2>상품정보등록</h2>
		<div class="row my-5">
			<div class="text-center my-3">
			
			<%
			
			int bookNo =StringUtil.stringToInt(request.getParameter("no"));
			int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
			
			BookDao bookDao = BookDao.getInstance();
			BookDto book = bookDao.getBookByNo(bookNo); 
			
			%>
				<img src="#" id="img" style="height:200px; weight:200px; border:1px solid black;">
			</div>
			<hr>
		<form class="row mt-5" method="post" action="addproduct.jsp" enctype="multipart/form-data" onsubmit="return submitBoardForm()">
			<div class="col-4 mt-2 mb-2">
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="title" placeholder="도서명">
					<label for="title">도서명</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="writer" placeholder="저자">
					<label for="writer">저자</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookPublisher" placeholder="출판사">
					<label for="bookPublisher">출판사</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="paperBookPrice" placeholder="도서가격">
					<label for="paperBookPrice">도서 가격</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookPrice" placeholder="판매가격">
					<label for="bookPrice">판매 가격</label>
				</div>
				<div class="form-floating mb-2">
					<select class="form-select" id="OnSales">
						<option selected>판매상태를 설정하세요.</option>
						<option value="1">판매중</option>
						<option value="2">판매중지</option>
					</select>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col mt-2 mb-2">
						<select class="form-select" name="categoryGroupNo">
							<option selected="selected" disabled="disabled">대분류</option>
								<option value="100">소설</option>
								<option value="200">경영/경제</option>
								<option value="300">인문/사회/역사</option>
								<option value="400">자기계발</option>
								<option value="500">에세이/시</option>
								<option value="600">여행</option>
								<option value="700">종교</option>
								<option value="800">과학</option>
								<option value="900">과학</option>
								<option value="1000">진로/교육/교재</option>
								<option value="1100">컴퓨터/IT</option>
								<option value="1200">건강/다이어트</option>
						</select>
					</div>
					<div class="col mt-2 mb-2">
						<select class="form-select" name="categoryNo">
							<option selected="selected" disabled="disabled">소분류</option>
								<option value="1101">컴퓨터/IT전체</option>
								<option value="1102">IT 비즈니스</option>
								<option value="1103">개발/프로그래밍</option>
								<option value="1104">컴퓨터/앱 활용</option>
								<option value="1105">IT 자격증</option>
								<option value="1106">IT 해외원서</option>
						</select>
					</div>
					<div class="row">
						<div class="col">
							<div class="form-floating">
								<textarea class="form-control" placeholder="Leave a comment here" name="bookIntroduce" style="height: 340px;;" ></textarea>
								<label for="floatingTextarea2 ">상품설명</label>
							</div>
						</div>	
					</div>			
				</div>
			</div>
			<div class="row">
				<div class="col my-3">
					<input class="form-control form-control-sm" name="imgFileName" id="formFileSm" type="file" onchange="previewImage(event)">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function previewImage(event) {
	let file = document.getElementById("formFileSm").files[0];
	if (file) {
		document.getElementById("img").src = URL.createObjectURL(file);
	}
	
}

function submitBoardForm() {
	let titleField = document.querySelector("input[name=title]");
	if (titleField.value === '') {
		alert("제목은 필수입력값입니다.");
		titleField.focus();
		return false;
	}
	let contentField = document.querySelector("textarea[name=content]");
	if (contentField.value === '') {
		alert("내용은 필수입력값입니다.");
		contentField.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>