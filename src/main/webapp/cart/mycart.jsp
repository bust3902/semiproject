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
<title>내 카트 - HTA</title>
<link href="/semiproject/img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/semiproject/css/mycart.css"/>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="cart"/>
	<jsp:param name="redirect" value="redirect=cart/mycart.jsp"/>
</jsp:include>
<div class="container">

<%! @SuppressWarnings("unchecked") %>
<%	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	// 로그인 여부 확인
	User user = (User) session.getAttribute("LOGINED_USER");
	// 파라미터 받아오기
	String type = request.getParameter("type");
	
	List<CartItem> cart;
	/*
	세션 장바구니
	*/
	if (user == null) {
		// 기존 세션 카트 불러오기
		cart = (List<CartItem>) session.getAttribute("cart");
		// 기존 세션 카트 없으면 생성
		if (cart == null) {
			cart = new ArrayList<CartItem>();
			session.setAttribute("cart", cart);
		}
	}
	/*
	유저 장바구니
	*/
	else {
		// 유저 카트 불러오기
		cart = cartItemDao.getCartItemsByUserNo(user.getNo());
	}
	
%>

<section class="mx-auto mb-5">
	<h4 class="mb-2"><strong>카트</strong></h4>
	
	<div class="cart_wrapper mt-3">
		<!-- 카트 네비게이션 -->
		<div class="cart_nav d-flex border border-bottom-0 border-opacity-50 fs-6 fw-semibold">
		<%
			if (type == null || "buy".equals(type)) {
		%>
			<div class="flex-fill d-flex justify-content-center border-opacity-50 border-end">
				<a href="mycart.jsp?type=buy" class="py-2 text-dark text-decoration-none w-100 h-100 text-center">소장 가능<span class="ms-1 fw-normal nav-count"><%=cart.size() %></span></a>
			</div>
			<div class="flex-fill d-flex justify-content-center border-opacity-50 border-bottom bg-light opacity-75">
				<a href="mycart.jsp?type=rent" class="py-2 text-muted text-decoration-none w-100 h-100 text-center">대여 가능</a>
			</div>
		<%
			} else if ("rent".equals(type)) {
		%>
			<div class="flex-fill d-flex justify-content-center border-opacity-50 border-end border-bottom bg-light opacity-75">
				<a href="mycart.jsp?type=buy" class="py-2 text-muted text-decoration-none w-100 h-100 text-center">소장 가능<span class="ms-1 fw-normal nav-count"><%=cart.size() %></span></a>
			</div>
			<div class="flex-fill d-flex justify-content-center border-opacity-50">
				<a href="mycart.jsp?type=rent" class="py-2 text-dark text-decoration-none w-100 h-100 text-center">대여 가능</a>
			</div>		
		<%
			}
		%>
		</div>
		
		<form method="post" action="../order/checkout.jsp" onsubmit="return submitCartForm()" class="border border-top-0 border-opacity-50">
		
			<!-- 비어있을 때 -->
			<%
			if ("rent".equals(type) || cart.isEmpty()) {
			%>
				<div class="rent_empty d-flex flex-column justify-content-center align-items-center">
					<img src="../img/cart.svg" />
					<span class="fs-6 opacity-75 mt-3">카트에 담긴 책이 없습니다.</span>
				</div>
			<%
			}
			else {
			%>
			<!-- 카트 요약 및 구매버튼 -->
				<article id="cart_summary_wrapper">
				<div class="sticky-top">
					<div class="summary_info_wrapper">
					
						<div class="summary_info-data d-grid gap-3 p-3">
						<div class="summary_info-count d-flex align-items-center">
							<img class="check-icon me-1" src="../img/check-icon.png">
							<span><span></span>권을 선택하셨습니다.</span>
						</div>
						<div class="summary_info-total_price d-flex justify-content-between">
							<p>총 상품 금액</p>
							<span></span>
						</div>
						<div class="summary_info-discount_price d-flex justify-content-between">
							<p>할인 금액</p>
							<span></span>	
						</div>
						</div>
						
						<div class="summary_total_wrapper d-flex d-flex justify-content-between align-items-center px-3 py-2">
							<p>합계</p>
							<span></span>
						</div>
					</div>
					<div class="buy_button_wrapper d-grid mt-3">
						<button id="buy_button" class="btn btn-primary"><strong>소장으로 구매하기</strong></button>
					</div>
				</div>
				</article>
			
			<!-- 전체 선택 및 선택 삭제 -->
				<div class="list_handler d-flex p-3 fs-6 fw-bold sticky-top bg-white">
					<div class="flex-fill d-flex align-items-center">
						<input type="checkbox" id="checkbox_all" class="check_all"/>
						<label for="checkbox_all" class="ms-2">전체 선택</label>

					</div>
						<button type="button" class="btn btn-outline-secondary fs-8 fw-bold">선택 삭제</button>
				</div>
				
			
			<!-- 카트 목록 -->
			<div class="cart_book_list px-3">
				<%
				for (CartItem item : cart) {
				%>
					<div class="cart_book d-flex py-4 border-top border-opacity-50"> 
						<div class="thumbnail_with_checkbox w-25">
							<input name="itemNo" type="checkbox" class="check_one" value="<%=user == null ? item.getBookNo() : item.getNo() %>" />
							<a href="../list/detail.jsp?bookNo=<%=item.getBookNo() %>"><img src="../img/book<%=StringUtil.bookImgNoFormat(item.getBookNo()) %>.webp" class="book_img" /></a>
						</div>
						<div class="cart_book_info w-100"> 
							<div class="cart_book_text w-100 d-flex justify-content-between">
								<div class="cart_book_metadata">
									<a href="../list/detail.jsp?bookNo=<%=item.getBookNo() %>">
										<p class="fs-6 fw-bold"><%=item.getTitle() %></p>
									</a>
									<span style="font-size:12px;"><%=item.getWriter() %></span>
								</div>
								<div class="cart_book_price d-flex flex-column justify-content-end align-items-end">
									<del id="paper_book_price_<%=user == null ? item.getBookNo() : item.getNo() %>" style="opacity: 50%;" data-paper-book-price="<%=item.getPaperBookPrice() %>"><%=item.getDiscountRate() > 0 ? StringUtil.priceFormat(item.getPaperBookPrice())+"원" : "" %></del>
									<div>
										<span class="text-danger"><%=item.getDiscountRate() > 0 ? item.getDiscountRate()+"%↓" : ""%></span>
										<span id="book_price_<%=user == null ? item.getBookNo() : item.getNo() %>" class="fw-bold ps-1" style="color: var(--main-color)" data-book-price="<%=item.getBookPrice() %>"><%=StringUtil.priceFormat(item.getBookPrice())%>원</span>
									</div>
								</div> 
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary" onclick="deleteItem(<%=user == null ? item.getBookNo() : item.getNo() %>)">삭제</button>
							</div>
						</div>
					</div>
				<%
				}
				%>				
			</div>
			
			<%
			}
			%>
		</form>
	</div>
	
</section>
<input class="is_logined" type="hidden" value="<%= user != null ? "y" : "" %>" />

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../script/mycart.js"></script> 
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="cart"/>
</jsp:include>
</body>
</html>