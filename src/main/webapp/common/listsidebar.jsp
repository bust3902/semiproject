<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

	.main-category { font-weight:bold; font-size:14px; }
	
	.sub-category { font-size:13px; padding: 0px 0px 0px 10px;}
	
	button.btn:focus {
		background:#0099ff;
		color: white !important;
	}
	button.btn {
		border:0;
		text-align:left;
		padding: 0px 0px 0px 8px;
	}
</style>


<div class="container">
	<div class="flex-shrink-0 bg-white list-unstyled" style="width: 180px;" id="collapse-content">
		<ul class="list-unstyled ps-0">
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate01" onclick="hideOthers(event)">소설</button>
				<div class="collapse" id="cate01">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">소설 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">한국 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">영미 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">일본 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">중국 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">북유럽 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">독일 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">프랑스 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">기타 국가 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">추리/미스터리/스릴러</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">SF 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내 판타지 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 판타지 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내 역사소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 역사소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">대체 역사소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">동양 고전문학</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">서양 고전문학</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate02" onclick="hideOthers(event)">경영/경제</button>
				<div class="collapse" id="cate02">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">경영/경제 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">경영 일반</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">경제 일반</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">마케팅/세일즈</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">재테크/금융/부동산</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">CEO/리더십</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate03" onclick="hideOthers(event)">인문/사회/역사</button>
				<div class="collapse" id="cate03">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">인문/사회/역사 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">인문</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">정치/사회</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">예술/문화</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">역사</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate04" onclick="hideOthers(event)">자기계발</button>
				<div class="collapse" id="cate04">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">자기계발 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">성공/삶의 자세</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">기획/창의/리더십</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">설득/화술/협상</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">취업/창업</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">여성</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">인간관계</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate05" onclick="hideOthers(event)">에세이/시</button>
				<div class="collapse" id="cate05">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">에세이/시 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">에세이</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">시</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate06" onclick="hideOthers(event)">여행</button>
				<div class="collapse" id="cate06">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">여행 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내여행</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외여행</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate07" onclick="hideOthers(event)">종교</button>
				<div class="collapse" id="cate07">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">종교 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">종교일반</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">가톨릭</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">기독교(개신교)</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">불교</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">기타</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate08" onclick="hideOthers(event)">외국어</button>
				<div class="collapse" id="cate08">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">외국어 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">비즈니스영어</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">일반영어</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">제2외국어</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">어학시험</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate09" onclick="hideOthers(event)">과학</button>
				<div class="collapse" id="cate09">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">과학 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">과학일반</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">수학</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">자연과학</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">응용과학</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate10" onclick="hideOthers(event)">진로/교육/교재</button>
				<div class="collapse" id="cate10">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">진로/교육/교재 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">공부법</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">특목고/자사고</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">대입 수시</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">대입 논술</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">대입 합격수기</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">진로 탐색</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">유학/MBA</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">교재/수험서</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate11" onclick="hideOthers(event)">컴퓨터/IT</button>
				<div class="collapse" id="cate11">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="/semiproject/list/itmainlist.jsp?categoryGroupNo=1100" class="link-dark nav-link sub-category">컴퓨터/IT 전체</a></li>
						<li><a href="/semiproject/list/itsubmainlist.jsp?categoryNo=1102" class="link-dark nav-link sub-category">IT 비즈니스</a></li>
						<li><a href="/semiproject/list/itsubmainlist.jsp?categoryNo=1103" class="link-dark nav-link sub-category">개발/프로그래밍</a></li>
						<li><a href="/semiproject/list/itsubmainlist.jsp?categoryNo=1104" class="link-dark nav-link sub-category">컴퓨터/앱 활용</a></li>
						<li><a href="/semiproject/list/itsubmainlist.jsp?categoryNo=1105" class="link-dark nav-link sub-category">IT 자격증</a></li>
						<li><a href="/semiproject/list/itsubmainlist.jsp?categoryNo=1106" class="link-dark nav-link sub-category">IT 해외원서</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate12" onclick="hideOthers(event)">건강/다이어트</button>
				<div class="collapse" id="cate12">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">건강/다이어트 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">다이어트/운동/스포츠</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">스타일/뷰티</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">건강</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate13" onclick="hideOthers(event)">가정/생활</button>
				<div class="collapse" id="cate13">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">가정/생활 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">결혼/임신/출산</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">육아/자녀교육</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">취미/요리/기타</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate14" onclick="hideOthers(event)">어린이/청소년</button>
				<div class="collapse" id="cate14">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">어린이/청소년 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">유아</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">어린이</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">청소년</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate15" onclick="hideOthers(event)">해외도서</button>
				<div class="collapse" id="cate15">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">해외도서 전체</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate16" onclick="hideOthers(event)">잡지</button>
				<div class="collapse" id="cate16">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">잡지 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">경영/재테크</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">문학/교양</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">여성/패션/뷰티</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">디자인/예술</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">건강/스포츠</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">취미/여행/요리</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">과학/IT</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">종교</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">만화</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">성인(19+)</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate17" onclick="hideOthers(event)">로맨스 e북</button>
				<div class="collapse" id="cate17">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">로맨스 e북 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">현대물</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">역사/시대물</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">할리퀸 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">19+</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">TL 소설</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">섹슈얼 로맨스</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">하이틴</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate18" onclick="hideOthers(event)">로맨스 웹소설</button>
				<div class="collapse" id="cate18">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">로맨스 웹소설 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">현대물</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">역사/시대물</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate19" onclick="hideOthers(event)">판타지 e북</button>
				<div class="collapse" id="cate19">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">판타지 e북 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">정통 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">퓨전 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">현대 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">게임 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">대체 역사물</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">스포츠물</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">신무협</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">전통 무협</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate20" onclick="hideOthers(event)">판타지 웹소설</button>
				<div class="collapse" id="cate20">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">판타지 웹소설 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">정통 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">퓨전 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">현대 판타지</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">무협 소설</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate21" onclick="hideOthers(event)">로판 e북</button>
				<div class="collapse" id="cate21">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">로판 e북 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">동양풍 로판</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">서양풍 로판</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">가상 세계 로판</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 소설</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate22" onclick="hideOthers(event)">로판 웹소설</button>
				<div class="collapse" id="cate22">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">로판 웹소설 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">동양풍 로판</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">서양풍 로판</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">가상 세계 로판</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate23" onclick="hideOthers(event)">만화 e북</button>
				<div class="collapse" id="cate23">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">만화 e북 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내 순정</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 순정</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">드라마</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">성인</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">할리퀸</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">무협</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">학원</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">액션</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">판타지/SF</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">스포츠</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">코믹</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">GL</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">공포/추리</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">만화잡지</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate24" onclick="hideOthers(event)">만화 연재</button>
				<div class="collapse" id="cate24">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">만화 연재 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내 순정</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 순정</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">드라마</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">성인</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">무협</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">액션</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">판타지/SF</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">학원</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">스포츠</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">코믹</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">GL</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">공포/추리</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate25" onclick="hideOthers(event)">웹툰 전체</button>
				<div class="collapse" id="cate25">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">웹툰 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내 순정</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 순정</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">드라마</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">성인</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">액션/무협</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">판타지/SF</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">스포츠/학원</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">코믹</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">GL</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">공포/추리</a></li>
					</ul>
				</div>
			</li>
			
			<li class="mb-2 d-grid gap-2">
				<button class="btn link-dark main-category nav-link rounded" data-bs-toggle="collapse" data-bs-target="#cate26" onclick="hideOthers(event)">라이트노벨</button>
				<div class="collapse" id="cate26">
					<ul class="btn-toggle-nav list-unstyled fw-normal">
						<li><a href="#" class="link-dark nav-link sub-category">라이트노벨 전체</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">국내 라노벨</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">해외 라노벨</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">성인 라노벨</a></li>
						<li><a href="#" class="link-dark nav-link sub-category">TL</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</div>


<script type="text/javascript">
	// [a, a, a, a]
	let collapseLinks = document.querySelectorAll("#collapse-content button");
	
	function hideOthers(event) {
		// 지금 클릭한 링크 엘리먼트
		let clickedLink = event.target;	// 클릭한 a 태그'
		// 클릭한 a태그의 href 속성값
		let clickedLinkId = event.target.getAttribute("data-bs-target");	// #demo1 혹은 #demo2		
		let clickedLinkDiv = document.querySelector(clickedLinkId);
		if (clickedLinkDiv.classList.contains("collapsed")) {
			return;
		}
	
		// 모든 a태그를 반복처리한다.
		for (let index = 0; index < collapseLinks.length; index++) {
			// a태그를 조회
			let link = collapseLinks[index];
			// 반복처리중인 a태그의 href 값을 조회
			let linkId = link.getAttribute("data-bs-target");
			// 반복처리중인 a태그의 href값과 클릭한 a 태그의 href 값이 같으면 아무 동작없이 다음번 a태그를 검사하러 간다.
			if (link.getAttribute("data-bs-target") === clickedLinkId) {
				continue;
			}
			
			//  반복처리중인 a태그의 href값과 클릭한 a 태그의 href 값이 서로 다르면,
			//  조회된 href값으로 div 엘리먼트를 조회한다.
			let div = document.querySelector(linkId);
			// div 엘리먼트가 show 클래스값을 가지고 있으면 해당 링크에서 클릭이벤트를 발생시켜서 닫게 만든다.
			if (div.classList.contains('show')) {
				link.click();
			}
		}
			
	}
</script>