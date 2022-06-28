<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="com.htabooks.util.PasswordUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String redirect = request.getParameter("redirect");

String id = request.getParameter("id");
String password = request.getParameter("password");

UserDao userDao = UserDao.getInstance();

User savedUser = userDao.getUserById(id);

if(savedUser == null){
	response.sendRedirect("loginform.jsp?fail=invalid");
	return;
	
}

String secretPassword = PasswordUtil.generateSecretPassword(id, password);

if(!savedUser.getPassword().equals(secretPassword)){
	response.sendRedirect("loginform.jsp?fail=invalid");
	return;
}

session.setAttribute("LOGINED_USER", savedUser);

// 세션에 있는 카트 목록 유저 카트에 병합하기
@SuppressWarnings("unchecked")
List<CartItem> sessionCart = (List<CartItem>) session.getAttribute("cart");
CartItemDao dao = CartItemDao.getInstance();
List<CartItem> userCart = dao.getCartItemsByUserNo(savedUser.getNo());

if (sessionCart != null) {
	for(CartItem item : sessionCart) {
		if (!userCart.contains(item)) {
		item.setUserNo(savedUser.getNo());
		dao.insertCartItem(item);
		}
	}
	sessionCart.clear();
}

// 리디렉트

if (redirect != null) {
	response.sendRedirect("../" + redirect);
	return;
}
response.sendRedirect("../home.jsp");

%>