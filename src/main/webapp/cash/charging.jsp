<%@page import="com.htabooks.dao.CashHistoryDao"%>
<%@page import="com.htabooks.vo.CashHistory"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="org.apache.tomcat.util.codec.binary.StringUtils"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    // 로그인 정보를 가져온다 
    User user = (User) session.getAttribute("LOGINED_USER");
    
    UserDao userDao = UserDao.getInstance();
    
    // 아이디로 유저 정보를 가져온다 
    user = userDao.getUserById(user.getId());
    
    // name이 cashcharging인 input값을 가져와 cash에 담는다 
	int cash = StringUtil.stringToInt(request.getParameter("cashcharging")); 
	user.setCash(user.getCash()+ cash);
	
	// userDao에 저장 
	userDao.updateUser(user);

	
	CashHistoryDao cashHistoryDao = CashHistoryDao.getInstance();
	
	//cashHistory에 캐시 충전 정보를 저장 
	CashHistory cashHistory = new CashHistory();
	cashHistory.setUser(user);
	cashHistory.setReason("캐시 충전");
	cashHistory.setCurrentAmount(user.getCash());
	cashHistory.setAmount(cash);

	cashHistoryDao.insertCashHistory(cashHistory);
	
	
	response.sendRedirect("../user/mypage.jsp");
	
	
    
    %>