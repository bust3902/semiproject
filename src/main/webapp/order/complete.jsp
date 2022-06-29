<%@page import="com.htabooks.vo.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dao.OrderItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>구매 완료 - HTA</title>
<link href="/semiproject/img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/semiproject/css/complete.css"/>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="order"/>
</jsp:include>
<div class="container">

<%	
	OrderItemDao orderItemDao = OrderItemDao.getInstance();

	// 파라미터 획득
	int orderNo = StringUtil.stringToInt(request.getParameter("orderNo"));
	
	List<OrderItem> list = orderItemDao.getOrderItemsByOrderNo(orderNo);
	
	int totalPrice = list.stream().mapToInt(item -> item.getPrice()).sum();


%>
<div class="box row w-75 mx-auto border border-opacity-75 border-2">
	<div class="col-4 d-flex flex-column py-5 justify-content-around align-items-center bg-secondary bg-opacity-50">
		<i class="bi bi-check-circle-fill text-white" style="font-size:80px;"></i>
		<h3 class="text-white">결제가 완료되었습니다.</h3>
		<!-- 주문 목록 -->
		<div class="list-group my-5 border border-opacity-10">
		<%
		  for (OrderItem item : list){
		%>
		  <a href="../list/detail.jsp?bookNo=<%=item.getBookNo() %>" class="list-group-item list-group-item-action bg-secondary bg-opacity-75 text-white" aria-current="true">
		    <div class="d-flex w-100 justify-content-between">
			    <div class="me-1 w-75">
			    <p class="mb-1 fw-bold"><%=item.getBookTitle() %></p>
			    <small><%=item.getBookWriter() %></small>
			    </div>
			    <div class="w-25 text-end">
			      <small class=""><%=StringUtil.priceFormat(item.getPrice()) %>원</small>
				</div>
		     </div>
		   </a>
		 <%
		   }
		 %>
		  <div class="list-group-item list-group-item-action bg-secondary bg-opacity-75 text-white">
		    <div class="d-flex w-100 justify-content-between">
			    <div>
			    <small>총 <%=list.size() %>권</small>
			    </div>
			    <div>
			      <small class="fw-bold"><%=StringUtil.priceFormat(totalPrice) %>원</small>
				</div>
		    </div>		  
		  </div>
		</div>
		<button type="button" class="btn btn-secondary" onclick="location.href='../user/orders.jsp'">내 주문 ></button>	
	</div>
	<div class="col-8">
		<div class="row h-75 d-flex flex-column justify-content-center align-items-center text-center">
			<button type="button" class="btn btn-primary btn-lg w-25 h-25 fs-4 fw-bold" onclick="location.href='../userCenter/userCenterBoard.jsp'">다운로드></button>
			<span class="my-2">Windows용 리디 뷰어로 읽어보세요.</span>
			<a href="../userCenter/userCenterBoard.jsp" class="text-decoration-none text-secondary">뷰어 다운로드<i class="bi bi-download ms-2"></i></a>
		</div>
		<div class="row h-25 bg-light">
			<div class="col-7 py-2 px-4">
				<span>스마트폰,태블릿,PC에서도 볼 수 있습니다.</span>
				<p>iPhone,iPad,Android,Windows,macOS에서도 리디 작품을 즐길 수 있습니다.</p>
				<div class="opacity-10">
					<i class="bi bi-apple me-2"></i><span>IOS</span>
				</div>
			</div>
			<div class="col-5 d-flex justify-content-center align-items-center">
				<button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../userCenter/userCenterBoard.jsp'">뷰어 다운로드 안내</button>
			</div>
			<div></div>
		</div>
	</div>
</div>
</div>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="order"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>