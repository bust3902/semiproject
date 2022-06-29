<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.vo.CashHistory"%>
<%@page import="com.htabooks.dao.CashHistoryDao"%>
<%@page import="com.htabooks.dao.CartItemDao"%>
<%@page import="com.htabooks.vo.CartItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.htabooks.vo.OrderItem"%>
<%@page import="com.htabooks.vo.Order"%>
<%@page import="com.htabooks.dao.OrderItemDao"%>
<%@page import="com.htabooks.dao.OrderDao"%>
<%@page import="java.util.Collections"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%	
	// dao
	OrderDao orderDao = OrderDao.getInstance();
	OrderItemDao orderItemDao = OrderItemDao.getInstance();
	CartItemDao cartItemDao = CartItemDao.getInstance();
	CashHistoryDao cashHistoryDao = CashHistoryDao.getInstance();
	BookDao bookDao = BookDao.getInstance();
	UserDao userDao = UserDao.getInstance();
	// 로그인 여부 확인
	User savedUser = (User) session.getAttribute("LOGINED_USER");
	if (savedUser == null) {
		throw new RuntimeException("올바르지 않은 접근입니다.");
	}
	// 유저 정보 최신화
	User user = userDao.getUserById(savedUser.getId());
	
	// 파라미터 받기
	boolean isBuy = "buy".equals(request.getParameter("action"));
	
	// itemNo (cart)
	List<Integer> itemNoList = new ArrayList<>();
	if (!isBuy) {
		String[] itemNoStr = request.getParameterValues("itemNo");
		for(String str : itemNoStr) {
			itemNoList.add(StringUtil.stringToInt(str));
		}
	}
	// bookPrice
	String[] bookPriceStr = request.getParameterValues("bookPrice");
	List<Integer> bookPriceList = new ArrayList<>();
	for(String str : bookPriceStr) {
		bookPriceList.add(StringUtil.stringToInt(str));
	}
	// bookNo
	String[] bookNoStr = request.getParameterValues("bookNo");
	List<Integer> bookNoList = new ArrayList<>();
	for(String str : bookNoStr) {
		bookNoList.add(StringUtil.stringToInt(str));
	}
	
	// totalPrice 계산
	int totalPrice = bookPriceList.stream().mapToInt(Integer::intValue).sum();
	if (user.getCash() < totalPrice) {
		throw new RuntimeException("캐시가 부족합니다.");
	}
	// user cash 차감
	user = userDao.getUserById(user.getId());
	user.useCash(totalPrice);
	userDao.updateUser(user);
	// cash history 생성, db에 insert
	CashHistory history = new CashHistory();
		history.setUser(user);
		history.setAmount(totalPrice);
		history.setCurrentAmount(user.getCash());
		history.setReason("캐시 사용");
	cashHistoryDao.insertCashHistory(history);
	
	// order 객체 생성
	int orderNo = orderDao.getOrderNo();
		Order order = new Order();
		order.setNo(orderNo);
		order.setUserNo(user.getNo());
		order.setTotalPaymentPrice(totalPrice);
	orderDao.insertOrder(order);
	
	// db에 orderItem insert
	if(isBuy) {
		OrderItem item = new OrderItem();
			item.setOrderNo(orderNo);
			item.setBookNo(bookNoList.get(0));
			item.setPrice(bookPriceList.get(0));
		orderItemDao.insertOrderItem(item);
	}
	else {
		for (int cartItemNo : itemNoList){
			orderItemDao.insertOrderItem(cartItemNo, orderNo);
		}
	}
	
	// 책 판매량 증가시키기
	bookDao.updateBookSalesRate(bookNoList);
	
	// 카트에서 구매내역 삭제
	if (!isBuy) {
		cartItemDao.deleteCartItems(itemNoList);
	}
	// 구매 완료 화면으로 리디렉트
	response.sendRedirect("complete.jsp?orderNo="+orderNo);
	
%>

