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
<title>HTA BOOKS</title>
<link href="../img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/semiproject/css/home.css" rel="stylesheet" />
</head>

<jsp:include page="../common/htaheader.jsp">
	<jsp:param name="menu" value="mypage" />
</jsp:include>

</head>

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
			
			
			<div class="col-7 justify-content-center ms-3">
				<div class="border row border-dark border-2 pb-0">
					<table class="table table-borderless mb-0">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tbody>
							<tr class="border-bottom">
								<td class="text-start p-3 table-primary" style="font-size:18px;" >[<%=user.getId() %>] 님 
								<p class="text-end text-secondary"><small style="font-size:13px;"><%=user.getEmail() %></small></p></td>
								<td class="text-center align-middle p-3">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-coin" viewBox="0 0 16 16">
		  								<path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z" />
		  								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
										  <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z" />
									</svg>
									<div class="col text-center m-1" style="font-size: 16px;">
										<strong>리디캐시</strong>
									</div>
									<div class="col text-center mb-3 text-primary"><%=user.getCash() %>원</div>
									<div class="col text-center mb-3">
										<small style="font-size: 13px;"> 
											<a href="../cash/cashList.jsp" class="text-decoration-none text-secondary">충전내역 >></a>
										</small>
									</div>
								</td>
								<td class="text-center align-middle p-3">
									<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
										fill="currentColor" class="bi bi-piggy-bank"
										viewBox="0 0 16 16">
									  <path d="M5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0zm1.138-1.496A6.613 6.613 0 0 1 7.964 4.5c.666 0 1.303.097 1.893.273a.5.5 0 0 0 .286-.958A7.602 7.602 0 0 0 7.964 3.5c-.734 0-1.441.103-2.102.292a.5.5 0 1 0 .276.962z" />
									  <path fill-rule="evenodd" d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069c0-.145-.007-.29-.02-.431.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a.95.95 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.735.735 0 0 0-.375.562c-.024.243.082.48.32.654a2.112 2.112 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595zM2.516 6.26c.455-2.066 2.667-3.733 5.448-3.733 3.146 0 5.536 2.114 5.536 4.542 0 1.254-.624 2.41-1.67 3.248a.5.5 0 0 0-.165.535l.66 2.175h-.985l-.59-1.487a.5.5 0 0 0-.629-.288c-.661.23-1.39.359-2.157.359a6.558 6.558 0 0 1-2.157-.359.5.5 0 0 0-.635.304l-.525 1.471h-.979l.633-2.15a.5.5 0 0 0-.17-.534 4.649 4.649 0 0 1-1.284-1.541.5.5 0 0 0-.446-.275h-.56a.5.5 0 0 1-.492-.414l-.254-1.46h.933a.5.5 0 0 0 .488-.393zm12.621-.857a.565.565 0 0 1-.098.21.704.704 0 0 1-.044-.025c-.146-.09-.157-.175-.152-.223a.236.236 0 0 1 .117-.173c.049-.027.08-.021.113.012a.202.202 0 0 1 .064.199z" />
									</svg>
									<div class="col text-center m-1" style="font-size: 16px;">
										<strong>리디포인트</strong>
									</div>
									<div class="col text-center mb-3">--원</div>
									<div class="col text-center mb-3">
										<small style="font-size: 13px;"> <a href=""
											class="text-decoration-none text-secondary">소멸 예정</a></small>
									</div>
								</td>
								<td class="text-center align-middle p-3">
									<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
										fill="currentColor" class="bi bi-ticket-detailed"
										viewBox="0 0 16 16">
									  <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5Zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5ZM5 7a1 1 0 0 0 0 2h6a1 1 0 1 0 0-2H5Z" />
									  <path d="M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5V6a.5.5 0 0 1-.5.5 1.5 1.5 0 0 0 0 3 .5.5 0 0 1 .5.5v1.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 11.5V10a.5.5 0 0 1 .5-.5 1.5 1.5 0 1 0 0-3A.5.5 0 0 1 0 6V4.5ZM1.5 4a.5.5 0 0 0-.5.5v1.05a2.5 2.5 0 0 1 0 4.9v1.05a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-1.05a2.5 2.5 0 0 1 0-4.9V4.5a.5.5 0 0 0-.5-.5h-13Z" />
									</svg>
									<div class="col text-center m-1" style="font-size: 16px;">
										<strong>쿠폰</strong>
									</div>
									<div class="col text-center mb-3">--원</div>
									<div class="col text-center mb-3">
										<small style="font-size: 13px;"> <a href=""
											class="text-decoration-none text-secondary">쿠폰등록 >></a></small>
									</div>
								</td>
							</tr>
							<tr>
								<td class="text-start align-bottom table-primary">
									<a href="/semiproject/login/logout.jsp" class="btn btn-outline-secondary m-2" style="font-size: 14px;">로그아웃</a>
								</td>
								<td class="text-center align-middle p-4">
									<svg xmlns="http://www.w3.org/2000/svg" width="31" height="31"
										fill="currentColor" class="bi bi-archive" viewBox="0 0 16 16">
							  			<path d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1V2zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5H2zm13-3H1v2h14V2zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
									</svg>
									<div class="col text-center m-2" style="font-size: 16px;">
										<strong>내 서재</strong>
									</div>
									<div class="col text-center mb-4">-- 권</div>
								</td>
								<td class="text-center align-middle p-4">
									<svg xmlns="http://www.w3.org/2000/svg" width="33" height="33" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
										  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
										</svg>
									<div class="col text-center m-2" style="font-size: 16px;">
										<strong>카트</strong>
									</div>
									<div class="col text-center mb-4">-- 권</div>
								</td>
								<td class="text-center align-middle p-4">
									<svg xmlns="http://www.w3.org/2000/svg" width="31" height="31" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
									  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
									</svg>
									<div class="col text-center m-2" style="font-size: 16px;">
										<strong>위시리스트</strong>
									</div>
									<div class="col text-center mb-4">-- 권</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				
				<div class="my-3 row justify-content-space-evenly mb-3 border-bottom pb-1" >
					<div class="col-3 " style="font-size: 16px;">
						<strong>최근 조회한 작품</strong>
					</div>
					<div class="col-7">
					</div>
					<div class="col-2 text-end">
						<a href="" class="text-decoration-none btn btn-dark btn-sm "
							style="font-size: 12px;">전체 보기 >></a>
					</div>
				</div>
				
				<div class="row">
					<div class="col">book</div>
					<div class="col">book</div>
					<div class="col">book</div>
					<div class="col">book</div>
					<div class="col">book</div>
				</div>
				
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- footer -->
	<jsp:include page="/common/footer.jsp">
		<jsp:param name="menu" value="mypage"/>
	</jsp:include>
</body>
</html>