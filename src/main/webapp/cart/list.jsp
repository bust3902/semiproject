<%@page import="com.htabooks.dao.CartItemDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.util.StringUtil"%> 
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.vo.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	
<%! @SuppressWarnings("unchecked") %>
<%	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	// 로그인 여부 확인
	User user = (User) session.getAttribute("LOGINED_USER");
	
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
	
out.write(cart.size() + "@spliter");

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