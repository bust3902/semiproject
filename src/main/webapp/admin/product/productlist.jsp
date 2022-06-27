<%@page import="java.io.Console"%>
<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.Book"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품리스트 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
		<%
		BookDao bookDao = BookDao.getInstance();
		
		int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);
		int rows = StringUtil.stringToInt(request.getParameter("rows"),15);	
		String keyword = StringUtil.nullToBlank(request.getParameter("keyword"));
		
		// 전체 데이터 갯수 조회
		int totalRows = bookDao.getTotalRowsCount();
		// 페이징처리에 필요한 정보를 제공하는 객체 생성
		Pagination pagination = new Pagination(rows, totalRows, currentPage);
		
		
		List<BookDto> bookList = null; 
		if(keyword.isEmpty()){
			bookList = bookDao.getAllBooks(pagination.getBeginIndex(),pagination.getEndIndex());
		}else{
			bookList = bookDao.getAllBooks(pagination.getBeginIndex(), pagination.getEndIndex(), keyword);
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
			<h2>상품 검색</h2>
				<div class="row mt-5">
					<div class="col-5">
						<span><strong>카테고리</strong></span>
						<div class="row">
							<div class="col my-2">
								<select class="form-select">
									<option selected>대분류</option>
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
							<div class="col mx-2 my-2">
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
						</div>
						<div class="row my-1">
							<span><strong>판매상태</strong></span>
						<div class="col">
							<div class="form-control text-center">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								<label class="form-check-label" for="flexRadioDefault1">판매중</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault2">판매중지</label>
							</div>
						</div>
						</div>
					</div>
					<div class="col-5">
						<span><strong>상품등록일</strong></span>
						<div class="row">
							<div class="form-control mx-2 my-2">
								<label>등록일</label>
								<input id="datepicker" type="text">
								<!--  강사님께 부트스트랩으로 날짜 표현가능한지 여쭙기 -->
							</div>
						</div>
					</div>
					
				</div>
				<div class="row">
					<form id="search-form" class="row g-3" method="get" action="productlist.jsp">
					<div class="col-6 my-5">
					<div class="input-group">
						<button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">목록</button>
						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button">도서 번호</button></li>
							<li><button class="dropdown-item" type="button">도서 명</button></li>
							<li><button class="dropdown-item" type="button">저자 명</button></li>
							<li><button class="dropdown-item" type="button">출판사 명</button></li>
						</ul>
						<input type="text" class="form-control" name="keyword" value="<%=keyword %>" aria-label="Text input with dropdown button">
						<div class="row">
							<div class="text-center">
								<input type="hidden" name="page" />
								<button class="btn btn-primary my-1" type="submit" style="float:center;" value="">검색</button>
							</div>
						</div>
					</div>
					</div>
					</form>
				</div>	
				<hr>
				<div class="row mb-5 bg-white">
					<div class="col">
						<h2>상품 정보</h2>
					  	<table class="table table-hover">
						    <thead>
						      <tr class="table-primary">
						        <th style="width:5%">번호</th>
						        <th>도서 명</th>
						        <th>저자</th>
						        <th>출판사</th>
						        <th>정가</th>
						        <th style="width:8%">판매가</th>
						        <th style="width:10%">판매 상태</th>
						        <th style="width:7%">대분류</th>
						        <th style="width:7%">소분류</th>
						        <th style="width:10%">등록일</th>
						      </tr>
						    </thead>
					    	<tbody>
								<%
								if(bookList.isEmpty()){ 
								%>
								<tr>
									<td colspan="6" class="text-center"><strong>검색결과가 없습니다.</strong></td>
								</tr>
								<%
								}else{
									for(BookDto book : bookList){
								%>
								<tr class="table" onclick="location.href='updateproductform.jsp?no=<%=book.getNo() %>&page=<%=pagination.getCurrentPage() %>'" style="cursor:pointer" >
									<td><%=book.getNo() %></td>
									<td><%=book.getTitle() %></td>
									<td><%=book.getWriter() %></td>
									<td><%=book.getBookPublisher() %></td>
									<td><%=book.getPaperBookPrice() %></td>
									<td><%=book.getBookPrice() %></td>
									<td>판매중</td>
									<td><%=book.getCategoryGroupNo() %></td>
									<td><%=book.getCategoryNo() %></td>
									<td><%=book.getCreatedDate() %></td>
								</tr>
								
								<%
									}}
								%>
							</tbody>
						</table>
					</div>
					<div class="row">
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

</script>
</html>