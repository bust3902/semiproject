<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.vo.Book"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
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
		<div class="col">
		<%
		// 파라미터 조회
		int bookNo =StringUtil.stringToInt(request.getParameter("no"));
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		
		// 게시글 정보 조회
		BookDao bookDao = BookDao.getInstance();
		BookDto book = bookDao.getBookByNo(bookNo); 
		
		%>
		
		
			<div class="title">상품정보변경</div>
		</div>
		<form class="row my-5" method="post" action="updateproduct.jsp" enctype="multipart/form-data">
			<div class="text-center my-3">
				  <img src="/semiproject/img/<%=book.getImgFileName() %>" style="height:200px; weight:200px; border:1px solid black;">
			</div>
			<hr>
			<div class="col-4 mt-2 mb-2">
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookNo" id="bookNo" value="<%=book.getNo()%>" disabled readonly>
					<label for="bookNo">도서번호</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookTitle" id="bookTitle" value="<%=book.getTitle()%>">
					<label for="bookTitle">도서명</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookWriter" id="bookWriter" value="<%=book.getWriter()%>">
					<label for="bookWriter">저자</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="publisher" id="publisher" value="<%=book.getBookPublisher()%>">
					<label for="publisher">출판사</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookPrice" id="bookPrice" value="<%=book.getPaperBookPrice()%>">
					<label for="bookPrice">도서 가격</label>
				</div>
				<div class="form-floating mb-2">
					<input type="text" class="form-control" name="bookDiscountPrice" id="bookDiscountPrice" value="<%=book.getBookPrice()%>">
					<label for="bookDiscountPrice">판매 가격</label>
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
						<select class="form-select">
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
						<select class="form-select">
							<option selected>소분류</option>
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
								<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 400px"></textarea>
								<label for="floatingTextarea2 " ><%=book.getIntroduce() %></label>
							</div>
						</div>	
					</div>			
				</div>
			</div>
		<div class="row">
			<div class="col my-3">
				<input class="form-control form-control-sm" id="formFileSm" type="file">
				<div>
					<button class="btn btn-primary mx-3 mt-2" type="submit" style="float:right;" value="">변경</button>
					<button class="btn btn-outline-secondary  mt-2" type="submit"style="float:right;" value=""onclick="location.href='/semiproject/admin/product/productlist.jsp'">취소</button>
				</div>
			</div>			
		</div>
		</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">
function submitModifyForm() {
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