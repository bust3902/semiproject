<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.htabooks.vo.CartItem"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.CartItemDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/500.jsp" trimDirectiveWhitespaces="true"%>

<%	
	CartItemDao cartItemDao = CartItemDao.getInstance();
	User user = (User) session.getAttribute("LOGINED_USER");
	Gson gson = new Gson();
	int failCount = 0;
	
	// 파라미터 받기
	// 세션 카트 일때는 bookNo, 유저 카트 일때는 cartItemNo
	List<Integer> noList = new ArrayList<>();
	
	/*
		세션 카트에서 삭제하기
	*/
	if (user == null) {
		String[] paraValues = request.getParameterValues("bookNo"); 
		if(paraValues == null) {
			String jsonText = "{\"success\":false, \"message\":\"유효한 접근이 아닙니다. - 파라미터값이 없습니다.\"}";
			out.write(jsonText);
			return;
		}
		for (String str : paraValues) {
			noList.add(StringUtil.stringToInt(str));
		}
		
		// 기존 세션 카트 불러오기
		@SuppressWarnings("unchecked")
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		// 기존 세션 카트 없으면 종료
		if (cart == null) {
			return;
		}
		
		// bookNo 일치하면 삭제하기
		for (int bookNo : noList) {
			if(
				!cart.removeIf( (CartItem item) -> {
					if (bookNo == item.getBookNo()){
						return true;
					}
					else {
						return false;
					}
			})) {
				failCount++;
			}
		}
		
		if (failCount == 0) {
			String jsonText = "{\"success\":true}";
			out.write(jsonText);
		} else {
			String jsonText = "{\"success\":false, \"message\":\"일치하는 카트 상품이 없습니다. (" + failCount + "개 실패)\"}";
			out.write(jsonText);
		}
	}
	
	/*
		유저 카트에서 삭제하기
	*/
	else {
		String[] paraValues = request.getParameterValues("itemNo"); 
		if(paraValues == null) {
			String jsonText = "{\"success\":false, \"message\":\"유효한 접근이 아닙니다. - 파라미터값이 없습니다.\"}";
			out.write(jsonText);
			return;
		}
		for (String str : paraValues) {
			noList.add(StringUtil.stringToInt(str));
		}
		
		try {
			cartItemDao.deleteCartItems(noList);
			// 성공시
			String jsonText = "{\"success\":true}";
			out.write(jsonText);
		} catch(SQLException e) {
			String jsonText = "{\"success\":false, \"message\":\"SQLException was thrown.\"}";
			out.write(jsonText);
		}
	}
	
%>