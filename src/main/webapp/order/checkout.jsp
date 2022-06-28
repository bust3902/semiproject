<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.htabooks.dao.CartItemDao"%>
<%@page import="com.htabooks.vo.CartItem"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문하기 - HTA</title>
<link href="/semiproject/img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/checkout.css"/>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="order"/>
	<jsp:param name="redirect" value="redirect=order/checkout.jsp"/>
</jsp:include>
<div class="container">

<%	
	UserDao userDao = UserDao.getInstance();
	// 로그인 여부 확인
	User savedUser = (User) session.getAttribute("LOGINED_USER");
	
	if (savedUser == null) {
		// 로그인 페이지로 리디렉션
		response.sendRedirect("../login/loginform.jsp?redirection=order/checkout.jsp");
		return;
	}
	// 유저 정보 최신화
	User user = userDao.getUserById(savedUser.getId());
	
	// 파라미터 획득
	String[] itemNoStr = request.getParameterValues("itemNo");
	List<Integer> itemNoList = new ArrayList<>();
	for(String str : itemNoStr) {
		itemNoList.add(StringUtil.stringToInt(str));
	}
	// 유저 카트 불러오기
	CartItemDao cartItemDao = CartItemDao.getInstance();
	List<CartItem> cart = cartItemDao.getCartItemsByUserNo(user.getNo());

	//System.out.println(user.getName());
	//System.out.println(user.getCash());
%>

<section class="mx-auto mb-5">

	<div class="cart_wrapper mt-3">
		<h5 class="mb-2">주문 목록<span class="ms-2 fs-6 fw-bold opacity-50"><%=itemNoList.size() %></span></h5>
		
		<form method="post" action="order.jsp" onsubmit="return submitCheckout()">
		
			<!-- 결제 정보 -->
				<article id="cart_summary_wrapper">
				<h5 class="mb-2">결제 정보</h5>
					<div class="summary_info_wrapper">
						<div class="summary_info-data d-flex justify-content-between px-3 py-3 border-bottom border-opacity-75">
							<p>총 주문 금액</p>
							<span class="fw-bold fs-6 total-price"></span>
						</div>
						<div class="summary_info-data d-flex justify-content-between p-3 border-bottom border-opacity-75">
							<p>할인 쿠폰</p>
							<text>0개</text>
						</div>
						<div class="summary_info-data d-flex justify-content-between p-3 border-bottom border-opacity-75">
							<p>리디포인트</p>
							<text>0원</text>
						</div>
						<div class="summary_info-data d-flex justify-content-between p-3">
							<p>보유 리디캐시</p>
							<span class="fw-bold fs-6 user-cash" data-cash="<%=user.getCash() %>"><%=StringUtil.priceFormat(user.getCash()) %>원</span>
						</div>
						
						<div class="summary_total_wrapper d-flex d-flex justify-content-center align-items-center p-3">
							<p class="text-center">총 결제 금액<span class="total-price mx-2"></span></p>
						</div>
					</div>
					<div class="summary_info_wrapper border-top-0 mb-2">
						<p class="p-3">결제 수단</p>
						<ul>
							<li class="d-flex align-items-center mb-2">
								<input name="pay-type" value="ridi-cash" class="radio-button"type="radio" id="pay-type-0" checked>
								<label for="pay-type-0" class="mx-2">리디 캐시</label>
								<span class="tax-deduction px-1">소득공제</span>
							</li> 
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-1">
								<label for="pay-type-1" class="naver-pay-icon mx-2"></label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-2">
								<label for="pay-type-2" class="kakao-pay-icon mx-2"></label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-3">
								<label for="pay-type-3" class="samsung-pay-icon mx-2"></label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-4">
								<label for="pay-type-4" class="payco-icon mx-2"></label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-5">
								<label for="pay-type-5" class="mx-2">신용카드</label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-6">
								<label for="pay-type-6" class="mx-2">휴대폰</label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-7">
								<label for="pay-type-7" class="mx-2">계좌이체</label>
								<span class="tax-deduction px-1">소득공제</span>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-8">
								<label for="pay-type-8" class="mx-2">컬쳐랜드문화상품권</label>
							</li>
							<li class="d-flex align-items-center my-2">
								<input name="pay-type" class="radio-button"type="radio" id="pay-type-9">
								<label for="pay-type-9" class="mx-2">도서문화상품권</label>
							</li>
						</ul>
					</div>
					<p><span class="tax-deduction p-1 me-1">소득공제</span>표시된 결제 수단으로 결제 시 문화비 소득공제를 받을 수 있습니다.</p>				
					
					<h5 class="mt-4 mb-2">구매 동의</h5>
					<div class="d-flex align-items-center">
						<input type="checkbox" id="terms-and-conditions-check"/>
						<label for="terms-and-conditions-check" class="fw-bold">
							상품, 가격, 할인 정보, 유의 사항 등을 확인하였으며 구매에 동의합니다.
						</label>
					</div>
					<div class="buy_button_wrapper d-grid my-3">
						<button id="buy_button" class="btn btn-primary"><strong>결제하기</strong></button>
					</div>
					
					<p>결제 취소는 결제일로부터 7일 이내에만 할 수 있습니다.</p>
					<p>다운로드하거나 (다운로드 시작 포함) 스트리밍으로 이용한 책은 구매 취소하거나 환불받을 수 없습니다.</p>
					<p>문화비 소득공제는 주문 도서와 결제 수단에 따라 적용됩니다. <label class="ms-1 fw-bold"><a href="../home.jsp">자세히 알아보기 ></a></label></p>
					
					<div class="cash-info border border-3 border-success border-opacity-10 mt-4 p-3">
						<img src="../img/cash.png" width="25px" />
						<span class="fs-6">리디캐시란?</span>
						<p class="mt-2">HTA BOOKS에서 사용 가능한 <b>유일한 결제 수단</b>입니다.<br/>충전 금액에 따라 최대 0% 보너스 적립까지!</p>
							<table class="table my-2 text-center">
							<thead>
								<tr class="table-light">
									<th scope="col" >리디캐시 충전 금액</th>	
									<th scope="col" >보너스 리디포인트</th>	
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2,000원 ~ 20,000원</td>
									<td>0%</td>
								</tr>
								<tr>
									<td>30,000원 ~ 70,000원</td>
									<td>0%</td>
								</tr>
								<tr>
									<td>100,000원 ~ 500,000원</td>
									<td>0%</td>
								</tr>
							</tbody>
							</table>
						<p>1회 충전 최소 금액은 1000원, 최대 금액은 1,000,000원 입니다.</p>
						<button class="charge-cash btn btn-outline-secondary w-100 mt-2 py-2"type="button" onclick="location.href='../cash/chargingform.jsp'">리디캐시 충전</button>
					</div>
				</article>
				
			
			<!-- 주문 목록 -->
			<div class="cart_book_list border-top border-opacity-50">
				<%
				for (CartItem item : cart) {
					if (itemNoList.contains(item.getNo())) {
				%>
					<div class="cart_book d-flex py-4 border-bottom border-opacity-50">
						<input name="itemNo" type="hidden" value="<%=item.getNo() %>">
						<div class="thumbnail_with_checkbox me-3">
							<a href="../list/detail.jsp?bookNo=<%=item.getBookNo() %>"><img src="../img/book<%=StringUtil.bookImgNoFormat(item.getBookNo()) %>.webp" class="book_img" /></a>
						</div>
						<div class="cart_book_info w-100"> 
							<div class="cart_book_text w-100 d-flex justify-content-between">
								<div class="cart_book_metadata">
									<a href="../list/detail.jsp?bookNo=<%=item.getBookNo() %>">
										<p class="fw-bold" style="font-size:14px;"><%=item.getTitle() %></p>
									</a>
									<span style="font-size:12px;"><%=item.getWriter() %></span>
								</div>
								<div class="cart_book_price d-flex flex-column justify-content-end align-items-end">
									<div>
										<span class="text-danger"><%=item.getDiscountRate() > 0 ? item.getDiscountRate()+"%↓" : ""%></span>
										<span id="book_price_<%=item.getNo() %>" class="book-price fw-bold ps-1" style="color: var(--main-color)" data-book-price="<%=item.getBookPrice() %>"><%=StringUtil.priceFormat(item.getBookPrice())%>원</span>
									</div>
									<input name="bookPrice" type="hidden" value="<%=item.getBookPrice() %>" />
								</div> 
							</div>
							<div class="p-2 mt-2 pdf-warning">
								<img src="../img/pdf-warning.png" width="15px" />
								<span>PDF파일입니다.<b>독서노트</b> 기능과 <b>글자크기</b> 조정 기능이 제한됩니다.</span>
							</div>
						</div>
					</div>
				<%
					}
				}
				%>				
			</div>
			
		</form>
	</div>
	
</section>
<input class="is_logined" type="hidden" value="<%= user != null ? "y" : "" %>" />

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../script/checkout.js"></script> 
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="order"/>
</jsp:include>
</body>
</html>