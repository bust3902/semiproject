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

<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>

	<style>
		.container { width:72%; }
		
		.list-group-item { border: none; }
		
		.main-category {
			font-size:14px;
			font-weight:bold;
			}
		
		.middle-category {
			font-size:14px;
			font-weight:bold;
			color:white;
			background-color:#0d6efd;
			}
		
		.sub-category { font-size:13px; }
		
		.show-category { font-size:13px; }
		
		.show-category-dummy { font-size:14px; }
	</style>
</head>

<body>

<div class="container my-4" style="min-width:900px;">

	<div class="row">
		
		<div class="col-2 border p-0 rounded-start">
			<ul class="list-group" id="main-category">
				<li class="list-group-item"></li>
				<li class="list-group-item main-category active" onmouseenter="showCategory(1)" id="main-category-1">소설</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(2)" id="main-category-2">경영/경제</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(3)" id="main-category-3">인문/사회/역사</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(4)" id="main-category-4">자기계발</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(5)" id="main-category-5">에세이/시</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(6)" id="main-category-6">여행</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(7)" id="main-category-7">종교</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(8)" id="main-category-8">외국어</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(9)" id="main-category-9">과학</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(10)" id="main-category-10">진로/교육/교재</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(11)" id="main-category-11">컴퓨터/IT</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(12)" id="main-category-12">건강/다이어트</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(13)" id="main-category-13">가정/생활</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(14)" id="main-category-14">어린이/청소년</li>
				<li class="list-group-item main-category" onmouseenter="showCategory(15)" id="main-category-15">해외도서</li>
		  		<li class="list-group-item main-category" onmouseenter="showCategory(16)" id="main-category-16">잡지</li>
				<li class="list-group-item"></li>
			</ul>
		</div>
		
		<div class="col-2 border p-0" id="sub-category">
			<div class="list-group" id="sub-category-1">
				<a href="#" class="list-group-item"></a>
				<a href="#" class="list-group-item show-category">소설 전체</a>
				<a href="#" class="list-group-item show-category">한국 소설</a>
				<a href="#" class="list-group-item show-category">영미 소설</a>
				<a href="#" class="list-group-item show-category">일본 소설</a>
				<a href="#" class="list-group-item show-category">중국 소설</a>
				<a href="#" class="list-group-item show-category">북유럽 소설</a>
				<a href="#" class="list-group-item show-category">독일 소설</a>
				<a href="#" class="list-group-item show-category">프랑스 소설</a>
				<a href="#" class="list-group-item show-category border-bottom">기타 국가 소설</a>
				<a href="#" class="list-group-item show-category">추리/미스터리/스릴러</a>
				<a href="#" class="list-group-item show-category">SF소설</a>
				<a href="#" class="list-group-item show-category">국내 판타지 소설</a>
				<a href="#" class="list-group-item show-category">해외 판타지 소설</a>
				<a href="#" class="list-group-item show-category">국내 역사소설</a>
				<a href="#" class="list-group-item show-category">해외 역사소설</a>
				<a href="#" class="list-group-item show-category">대체 역사소설</a>
				<a href="#" class="list-group-item show-category">동양 고전문학</a>
				<a href="#" class="list-group-item show-category">서양 고전문학</a>
			</div>
			<div class="list-group d-none" id="sub-category-2">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">경영/경제 전체</a>
				<a href="#" class="list-group-item show-category">경영 일반</a>
				<a href="#" class="list-group-item show-category">경제 일반</a>
				<a href="#" class="list-group-item show-category">마케팅/세일즈</a>
				<a href="#" class="list-group-item show-category">재테크/금융/부동산</a>
				<a href="#" class="list-group-item show-category">CEO/리더쉽</a>
			</div>
			<div class="list-group d-none" id="sub-category-3">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">인문/사회/역사 전체</a>
				<a href="#" class="list-group-item show-category">인문</a>
				<a href="#" class="list-group-item show-category">정치/사회</a>
				<a href="#" class="list-group-item show-category">예술/문화</a>
				<a href="#" class="list-group-item show-category">역사</a>
			</div>
			<div class="list-group d-none" id="sub-category-4">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">자기계발 전체</a>
				<a href="#" class="list-group-item show-category">성공/삶의자세</a>
				<a href="#" class="list-group-item show-category">기획/창의/리더십</a>
				<a href="#" class="list-group-item show-category">설득/화술/협상</a>
				<a href="#" class="list-group-item show-category">취업/창업</a>
				<a href="#" class="list-group-item show-category">여성</a>
				<a href="#" class="list-group-item show-category">인간관계</a>
			</div>
			<div class="list-group d-none" id="sub-category-5">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">에세이/시 전체</a>
				<a href="#" class="list-group-item show-category">에세이</a>
				<a href="#" class="list-group-item show-category">시</a>
			</div>
			<div class="list-group d-none" id="sub-category-6">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">여행 전체</a>
				<a href="#" class="list-group-item show-category">국내여행</a>
				<a href="#" class="list-group-item show-category">해외여행</a>
			</div>
			<div class="list-group d-none" id="sub-category-7">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">종교 전체</a>
				<a href="#" class="list-group-item show-category">종교일반</a>
				<a href="#" class="list-group-item show-category">가톨릭</a>
				<a href="#" class="list-group-item show-category">기독교(개신교)</a>
				<a href="#" class="list-group-item show-category">불교</a>
				<a href="#" class="list-group-item show-category">기타</a>
			</div>
			<div class="list-group d-none" id="sub-category-8">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">외국어 전체</a>
				<a href="#" class="list-group-item show-category">비즈니스영어</a>
				<a href="#" class="list-group-item show-category">일반영어</a>
				<a href="#" class="list-group-item show-category">제2외국어</a>
				<a href="#" class="list-group-item show-category">어학시험</a>
			</div>
			<div class="list-group d-none" id="sub-category-9">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">과학 전체</a>
				<a href="#" class="list-group-item show-category">과학일반</a>
				<a href="#" class="list-group-item show-category">수학</a>
				<a href="#" class="list-group-item show-category">자연과학</a>
				<a href="#" class="list-group-item show-category">응용과학</a>
			</div>
			<div class="list-group d-none" id="sub-category-10">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">진로/교육/교재 전체</a>
				<a href="#" class="list-group-item show-category">공부법</a>
				<a href="#" class="list-group-item show-category">특목고/자사고</a>
				<a href="#" class="list-group-item show-category">대입 수시</a>
				<a href="#" class="list-group-item show-category">대입 논술</a>
				<a href="#" class="list-group-item show-category">대입 합격수기</a>
				<a href="#" class="list-group-item show-category">진로 탐색</a>
				<a href="#" class="list-group-item show-category">유학/MBA</a>
				<a href="#" class="list-group-item show-category">교재/수험서</a>
			</div>
			<div class="list-group d-none" id="sub-category-11">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>

				<a href="itmainlist.jsp" class="list-group-item show-category">컴퓨터/IT 전체</a>

				<a href="#" class="list-group-item show-category">IT 비즈니스</a>
				<a href="#" class="list-group-item show-category">개발/프로그래밍</a>
				<a href="#" class="list-group-item show-category">컴퓨터/앱 활용</a>
				<a href="#" class="list-group-item show-category">IT 자격증</a>
				<a href="#" class="list-group-item show-category">IT 해외원서</a>
			</div>
			<div class="list-group d-none" id="sub-category-12">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">건강/다이어트 전체</a>
				<a href="#" class="list-group-item show-category">다이어트/운동/스포츠</a>
				<a href="#" class="list-group-item show-category">스타일/뷰티</a>
				<a href="#" class="list-group-item show-category">건강</a>
			</div>
			<div class="list-group d-none" id="sub-category-13">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">가정/생활 전체</a>
				<a href="#" class="list-group-item show-category">결혼/임신/출산</a>
				<a href="#" class="list-group-item show-category">육아/자녀교육</a>
				<a href="#" class="list-group-item show-category">취미/요리/기타</a>
			</div>
			<div class="list-group d-none" id="sub-category-14">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">어린이/청소년 전체</a>
				<a href="#" class="list-group-item show-category">유아</a>
				<a href="#" class="list-group-item show-category">어린이</a>
				<a href="#" class="list-group-item show-category">청소년</a>
			</div>
			<div class="list-group d-none" id="sub-category-15">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">해외도서 전체</a>
			</div>
			<div class="list-group d-none" id="sub-category-16">
				<a href="#" class="list-group-item"></a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a class="list-group-item show-category-dummy">ㅤ</a>
				<a href="#" class="list-group-item show-category">잡지 전체</a>
				<a href="#" class="list-group-item show-category">경영/재테크</a>
				<a href="#" class="list-group-item show-category">문학/교양</a>
				<a href="#" class="list-group-item show-category">여성/패션/뷰티</a>
				<a href="#" class="list-group-item show-category">디자인/예술</a>
				<a href="#" class="list-group-item show-category">건강/스포츠</a>
				<a href="#" class="list-group-item show-category">취미/여행/요리</a>
				<a href="#" class="list-group-item show-category">과학/IT</a>
				<a href="#" class="list-group-item show-category">종교</a>
				<a href="#" class="list-group-item show-category">만화</a>
				<a href="#" class="list-group-item show-category">성인(19+)</a>
			</div>
		</div>
		
		<div class="col-2 border">
			<div class="list-group" id="main-category">
				<a class="list-group-item"></a>
				<a href="#" class="list-group-item middle-category rounded">로맨스 e북</a>
				<a href="#" class="list-group-item sub-category">현대물</a>
				<a href="#" class="list-group-item sub-category">역사/시대물</a>
				<a href="#" class="list-group-item sub-category">할리퀸 소설</a>
				<a href="#" class="list-group-item sub-category">19+</a>
				<a href="#" class="list-group-item sub-category">TL소설</a>
				<a href="#" class="list-group-item sub-category">섹슈얼 로맨스</a>
				<a href="#" class="list-group-item sub-category">하이틴</a>
				<a href="#" class="list-group-item middle-category rounded">로맨스 웹소설</a>
				<a href="#" class="list-group-item sub-category">현대물</a>
				<a href="#" class="list-group-item sub-category">역사/시대물</a>
				<a href="#" class="list-group-item middle-category rounded">로판 e북</a>
				<a href="#" class="list-group-item sub-category">동양풍 로판</a>
				<a href="#" class="list-group-item sub-category">서양풍 로판</a>
				<a href="#" class="list-group-item sub-category">가상 세계 로판</a>
				<a href="#" class="list-group-item sub-category">해외 소설</a>
				<a href="#" class="list-group-item middle-category rounded">로판 웹소설</a>
				<a href="#" class="list-group-item sub-category">동양풍 로판</a>
				<a href="#" class="list-group-item sub-category">서양풍 로만</a>
				<a href="#" class="list-group-item sub-category">가상 세계 로판</a>
				<a href="#" class="list-group-item"></a>
			</div>
		</div>
		
		<div class="col-2 border">
			<div class="list-group" id="main-category">
				<a class="list-group-item"></a>
				<a href="#" class="list-group-item middle-category rounded">판타지 e북</a>
				<a href="#" class="list-group-item sub-category">정통 판타지</a>
				<a href="#" class="list-group-item sub-category">퓨전 판타지</a>
				<a href="#" class="list-group-item sub-category">현대 판타지</a>
				<a href="#" class="list-group-item sub-category">게임 판타지</a>
				<a href="#" class="list-group-item sub-category">대체 역사물</a>
				<a href="#" class="list-group-item sub-category">스포츠물</a>
				<a href="#" class="list-group-item sub-category">신무협</a>
				<a href="#" class="list-group-item sub-category">전통무협</a>
				<a href="#" class="list-group-item middle-category rounded">판타지 웹소설</a>
				<a href="#" class="list-group-item sub-category">정통 판타지</a>
				<a href="#" class="list-group-item sub-category">퓨전 판타지</a>
				<a href="#" class="list-group-item sub-category">현대 판타지</a>
				<a href="#" class="list-group-item sub-category">무협소설</a>
				<a class="list-group-item"></a>
			</div>
		</div>
		
		<div class="col-2 border">
			<div class="list-group" id="main-category">
				<a class="list-group-item"></a>
				<a href="#" class="list-group-item middle-category rounded">만화 e북</a>
				<a href="#" class="list-group-item sub-category">국내 순정</a>
				<a href="#" class="list-group-item sub-category">해외 순정</a>
				<a href="#" class="list-group-item sub-category">드라마</a>
				<a href="#" class="list-group-item sub-category">성인</a>
				<a href="#" class="list-group-item sub-category">할리퀸</a>
				<a href="#" class="list-group-item sub-category">무협</a>
				<a href="#" class="list-group-item sub-category">학원</a>
				<a href="#" class="list-group-item sub-category">액션</a>
				<a href="#" class="list-group-item sub-category">판타지/SF</a>
				<a href="#" class="list-group-item sub-category">스포츠</a>
				<a href="#" class="list-group-item sub-category">코믹</a>
				<a href="#" class="list-group-item sub-category">GL</a>
				<a href="#" class="list-group-item sub-category">공포/추리</a>
				<a href="#" class="list-group-item sub-category">만화잡지</a>
				<a href="#" class="list-group-item middle-category rounded">만화 연재</a>
				<a href="#" class="list-group-item sub-category">국내 순정</a>
				<a href="#" class="list-group-item sub-category">해외 순정</a>
				<a href="#" class="list-group-item sub-category">드라마</a>
				<a href="#" class="list-group-item sub-category">성인</a>
				<a href="#" class="list-group-item sub-category">무협</a>
				<a href="#" class="list-group-item sub-category">액션</a>
				<a href="#" class="list-group-item sub-category">판타지/SF</a>
				<a href="#" class="list-group-item sub-category">학원</a>
				<a href="#" class="list-group-item sub-category">스포츠</a>
				<a href="#" class="list-group-item sub-category">코믹</a>
				<a href="#" class="list-group-item sub-category">GL</a>
				<a href="#" class="list-group-item sub-category">공포/추리</a>
				<a class="list-group-item"></a>
			</div>
		</div>
		
		<div class="col-2 border rounded-end">
			<div class="list-group" id="main-category">
				<a class="list-group-item"></a>
				<a href="#" class="list-group-item middle-category rounded">웹툰</a>
				<a href="#" class="list-group-item sub-category">국내 순정</a>
				<a href="#" class="list-group-item sub-category">해외 순정</a>
				<a href="#" class="list-group-item sub-category">드라마</a>
				<a href="#" class="list-group-item sub-category">성인</a>
				<a href="#" class="list-group-item sub-category">액션/무협</a>
				<a href="#" class="list-group-item sub-category">판타지/SF</a>
				<a href="#" class="list-group-item sub-category">스포츠/학원</a>
				<a href="#" class="list-group-item sub-category">코믹</a>
				<a href="#" class="list-group-item sub-category">GL</a>
				<a href="#" class="list-group-item sub-category">공포/추리</a>
				<a href="#" class="list-group-item middle-category rounded">라이트 노벨</a>
				<a href="#" class="list-group-item sub-category">국내 라노벨</a>
				<a href="#" class="list-group-item sub-category">해외 라노벨</a>
				<a href="#" class="list-group-item sub-category">성인 라노벨</a>
				<a href="#" class="list-group-item sub-category">TL</a>
				<a class="list-group-item"></a>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function showCategory(no) {
		let ulList = document.querySelectorAll("#sub-category .list-group");
		for (let index = 0; index < ulList.length; index++) {
			let ul = ulList[index];
			ul.classList.add('d-none');
		}
		
		let ul = document.querySelector("#sub-category-" + no);
		ul.classList.remove('d-none');
		
		
		let liList = document.querySelectorAll("#main-category .list-group-item");
		for (let index = 0; index < liList.length; index++) {
			let li = liList[index];
			li.classList.remove('active');
		}
		
		let li = document.querySelector("#main-category-" + no);
		li.classList.add('active');
	}
</script>

<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
</html>