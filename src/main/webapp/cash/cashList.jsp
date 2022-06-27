<%@page import="java.util.List"%>
<%@page import="com.htabooks.vo.CashPagination"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.dao.UserDao"%>
<%@page import="com.htabooks.dao.CashHistoryDao"%>
<%@page import="com.htabooks.vo.CashHistory"%>
<%@page import="jakarta.websocket.SendResult"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="../img/Hfavicon.ico" rel="icon" type="image/x-icon" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/semiproject/css/home.css" rel="stylesheet" />
	
	<jsp:include page="/common/htaheader.jsp">
		<jsp:param name="menu" value="cashList" />
	</jsp:include>

</head>
<style>

a:active { color: red; }
</style>

<!-- 보유 캐시[충전하기] / 날짜 / 캐시 충전 여부 / 충전금액 을 포함하는 cashList 페이지 이다.   -->

<body>

	<!-- 로그인 된 유저 정보를 불러온다 -->
	<%
	User user = (User) session.getAttribute("LOGINED_USER");
	
	UserDao userDao = UserDao.getInstance();
	user = userDao.getUserById(user.getId());
	%>
	
	<!-- 사이드 메뉴 -->
		<div class="container justify-content-center">
			<div class="row ">
							<div class="col-3 ps-3 justify-content-center " style="width:20%;">
				<span class="h5 m-2" style="font-size:20px;"><strong>마이리디</strong></span>
				<div class="border-bottom p-2 mt-1" style="font-size:17px;">
					<a href="../user/mypage.jsp" class="text-decoration-none text-primary mx-2"> 
						<small>
							<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
								fill="currentColor" class="bi bi-house-door-fill mx-1"
								viewBox="0 0 16 16">
  								<path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z" />
							</svg>
							마이리디 홈
						</small>
					</a>
				</div>
				
				<!-- 사이드 메뉴 : 책 -->
				<div class="mx-2 de-flex p-2 flex-col text-decoration-none text-secondary border-bottom" style="font-size:17px;">
					<small>
						<svg xmlns="http://www.w3.org/2000/svg" width="17"
							height="17" fill="currentColor" class="bi bi-book-half mx-1"
							viewBox="0 0 16 16">
	 		 				<path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
						</svg>
						<strong>책</strong>
					</small>
					<div class="mx-3 my-1 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>선호작품</small></a>
					</div>
					<div class="mx-3 my-1  text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>최근 조회한 작품</small></a>
					</div>
					<div class="mx-3 my-1 mb-3 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>위시리스트</small></a>
					</div>
				</div>

				<!-- 사이드메뉴 : 구매/혜택 -->
				<div class="mx-2 de-flex p-2 flex-col text-decoration-none text-secondary border-bottom" style="font-size:17px;">
					<small> 
						<svg xmlns="http://www.w3.org/2000/svg" width="16"
							height="16" fill="currentColor"
							class="bi bi-credit-card-fill mx-1" viewBox="0 0 16 16">
	  						<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0V4zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7H0zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1z" />
						</svg>
						<strong>구매/혜택</strong>
					</small>
					<div class="mx-3 my-1" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>결제 내역</small></a>
					</div>
					<div class="mx-3 my-1 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="../cash/chargingform.jsp" class="text-decoration-none text-secondary"><small>리디캐시</small></a>
					</div>
					<div class="mx-3 my-1 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>리디포인트</small></a>
					</div>
					<div class="mx-3 my-1 mb-3 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>쿠폰</small></a>
					</div>
				</div>
				
				<!-- 사이드 메뉴 : 개인 -->
				<div class=" mx-2 de-flex p-2 flex-col text-decoration-none text-secondary" style="font-size:17px;">
					<small> 
						<svg xmlns="http://www.w3.org/2000/svg" width="18"
							height="18" fill="currentColor" class="bi bi-person-fill mx-1"
							viewBox="0 0 16 16">
	  						<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						</svg>
						<strong>개인</strong>
					</small>
					<div class="mx-3 my-1 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>1:1 문의</small></a>
					</div>
					<div class="mx-3 my-1 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="" class="text-decoration-none text-secondary"><small>내 리뷰 관리</small></a>
					</div>
					<div class="mx-3 my-1 mb-3 text-decoration-none text-secondary" style="font-size:17px;">
						<a href="../cash/cashList.jsp" class="text-decoration-none text-secondary"><small>캐시 변동 내역</small></a>
					</div>
				</div>
			</div>
				
				<!-- 유저 정보 메인 창 -->
				
				<div class="col-7 justify-content-center ms-3 ">
					<div class="border row border-dark border-2 pb-0">
						<table class="table table-borderless mb-0" >
							<colgroup>
								<col width="25%">
								<col width="75%">
							</colgroup>
							
							<!-- 유저 정보 메인 창 : 아이디 + side menu -->
							
							<tbody>
								<tr class="border-bottom ">
									<td class="text-center p-3 table-primary" ><%=user.getId() %>님 
									
										<div class="mt-5 mb-1">
										<small style="font-size: 15px;"> 
													<a href="../cash/cash.jsp" class="text-decoration-none text-dark">내 정보 >></a>
												</small></div>
										<div class="mb-1">
										<small style="font-size: 15px;"> 
													<a href="../cash/cashList.jsp" class="text-decoration-none text-dark">캐시 변동 내역 >></a>
												</small></div>
									</td>
									
									<td class="text-start align-middle p-3 px-4 ">
										<div class="mt-1 mb-5 text-danger" style="font-size:16px; font-weight:bold">보유캐시 : <%=user.getCash() %> 원
											<a href="../cash/chargingform.jsp" class="btn btn-outline-primary btn-sm" style="font-size:13px;">충전하기</a>
										</div>
										
										<% 
										 
										 
										int no = StringUtil.stringToInt(request.getParameter("no"));
								   		//int currentPage = StringUtil.stringToInt(request.getParameter("page"),1);
										int rows = StringUtil.stringToInt(request.getParameter("rows"),10);	//default값 
								   		
										CashHistoryDao cashHistoryDao = CashHistoryDao.getInstance();
										
										List<CashHistory> cashHistoryList = cashHistoryDao.getCashHistoriesByNo(user.getNo());
										
										%>  
										
										 
										 
										<table class="table " style="font-size:14px;">
											<colgroup>
												<col width="40%">
												<col width="30%">
												<col width="30%">
												
											</colgroup>
											<thead>
												<tr class=" border-bottom ">
													<th>날짜</th>
													<th>구분</th>
													<th>금액</th>
													
												</tr>
											</thead>
											<tbody class="table-group-divider" style="border-none;">
											
										 <%for (CashHistory cashHistory : cashHistoryList) {%>
										
										<tr>
											<td><%=cashHistory.getUpdatedDate() %></td>
											<td><%=cashHistory.getReason() %></td>
											<td><%=cashHistory.getAmount() %>원</td>
										</tr>
										
										 <%
										}
										%> 
										
									</tbody>
									</table>
									</td>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
		<jsp:include page="/common/footer.jsp">
		<jsp:param name="menu" value="cash"/>
	</jsp:include>
</body>
</html>