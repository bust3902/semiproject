<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%  
    String userId = request.getParameter("id");
    
    UserDao userDao = UserDao.getInstance();

	User user = userDao.getUserById(userId);
    
    Map<String, Boolean> result = new HashMap<>();
    
    if(user !=null){
    	result.put("exist", true);
    	
    } else {
    	result.put("exist", false);
    }

    Gson gson = new Gson();
    
    String jsonText = gson.toJson(result);
    out.write(jsonText);
    %>