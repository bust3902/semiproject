<%@page import="com.htabooks.dao.CashHistoryDao"%>
<%@page import="com.htabooks.vo.CashHistory"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="org.apache.tomcat.util.codec.binary.StringUtils"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    User user = (User) session.getAttribute("LOGINED_USER");
    
    UserDao userDao = UserDao.getInstance();
    
    user = userDao.getUserById(user.getId());
	int cash = StringUtil.stringToInt(request.getParameter("cashcharging"));
	user.setCash(user.getCash()+ cash);
	
	userDao.updateUser(user);

	
	CashHistoryDao cashHistoryDao = CashHistoryDao.getInstance();
	
	CashHistory cashHistory = new CashHistory();
	cashHistory.setUser(user);
	cashHistory.setReason("캐시 충전");
	cashHistory.setCurrentAmount(user.getCash());
	cashHistory.setAmount(cash);

	cashHistoryDao.insertCashHistory(cashHistory);
	
	
	response.sendRedirect("../user/mypage.jsp");
	
	
    
    %>