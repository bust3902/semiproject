<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.CartItemDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.CartItem"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/500.jsp"%>

<%	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	User user = (User) session.getAttribute("LOGINED_USER");
	// 파라미터 받기
	int bookNo = StringUtil.stringToInt(request.getParameter("bookNo"));
			
	/*
		세션 카트에 담기
	*/
	if (user == null) {
		// 기존 세션 카트 불러오기
		@SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		// 기존 세션 카트 없으면 생성
		if (cart == null) {
			cart = new ArrayList<CartItem>();
			session.setAttribute("cart", cart);
		}
		
		// 이미 카트에 있는 책이면 빠른 종료
		for(CartItem item : cart) {
			if (item.getBookNo() == bookNo)
				throw new RuntimeException("이미 카트에 있는 책입니다.");
		}

		// 책 정보 받아오기
		CartItem item = cartItemDao.generateCartItemsByBookNo(bookNo);
		// 세션 카트에 저장하기
		cart.add(item);
	}
	
	/*
		유저 카트에 담기
	*/
	else {
		// 해당 상품 이미 있는지 확인하기
		List<CartItem> cart = cartItemDao.getCartItemsByUserNo(user.getNo());
		for(CartItem item : cart) {
			if (item.getBookNo() == bookNo)
				throw new RuntimeException("이미 카트에 있는 책입니다.");
		}
		// 카트 아이템 담기
		CartItem item = new CartItem();
		item.setUserNo(user.getNo());
		item.setBookNo(bookNo);
		
		cartItemDao.insertCartItem(item);
	}
	
%>