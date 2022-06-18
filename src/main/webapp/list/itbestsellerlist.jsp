<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="/semiproject/img/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/semiproject/css/list.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

	<style>
		.container { width:72%; }
		
		.book-info {
			font-size:12px;
		}
		
		p.book-introduction {
			font-size:13px;
			display: -webkit-box;
			text-overflow: ellipsis;
			-webkit-box-orient: vertical;
			-webkit-line-clamp: 3;
			overflow: hidden;
		}
		
		h6 {
			font-weight:bold;
		}
		
		span.partition {
			font-size:11px;
			color: lightgray;
		}
	</style>
</head>

<body>
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container mt-5" style="min-width:1094px;">
	<div class="row">
		<div class="col-3">
			<aside>
				<jsp:include page="../common/listsidebar.jsp">
					<jsp:param name="menu" value="board"/>
				</jsp:include>
			</aside>
		</div>
		<div class="col-8">
			<div class="row">
				<div class="col nav-item mb-2">
					<a href="itmainlist.jsp" class="link-dark nav-link">
						<img src="/semiproject/img/display.svg" width="20" height="20" class="mb-1"> <strong style="font-size:20px">컴퓨터/IT</strong>
					</a>
				</div>
			</div>
			
			<div class="row mb-3 border-bottom">
				<ul class="nav justify-content-start">
					<li class="nav-item"><a href="itmainlist.jsp" class="nav-link p-2" style="color:gray">홈</a></li>
					<li class="nav-item"><a href="itnewlist.jsp" class="nav-link p-2" style="color:gray">신간</a></li>
					<li class="nav-item border-bottom border-primary border-3"><a href="itbestsellerlist.jsp" class="nav-link p-2" style="color:gray">베스트셀러</a></li>
					<li class="nav-item"><a href="italllist.jsp" class="nav-link p-2" style="color:gray">전체</a></li>
				</ul>
			</div>

			<div class="row">
				<div class="row">
					<div class="container d-flex flex-wrap p-0" style="width:100%;">
						<div class="col-10 p-0">
							<ul class="nav justify-content-start m-0">
								<li class="nav-item rank"><a href="#" class="nav-link p-2" style="color:gray">인기순</a></li>
								<li class="nav-item rank"><a href="#" class="nav-link p-2" style="color:gray">최신순</a></li>
								<li class="nav-item"><a href="#" class="nav-link" style="color:gray"></a></li>
								<li class="nav-item"><a href="#" class="nav-link" style="color:gray"></a></li>
							</ul>
						</div>
						<div class="col-2 position-relative">
							<div class="btn-group btn-group-sm position-absolute end-0" role="group">
								<button type="button" class="btn btn-default border">
									<span class="glyphicon glyphicon-th-list"></span>
								</button>
								<button type="button" class="btn btn-default border">
									<span class="glyphicon glyphicon-th-large"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
				
				<div class="col mt-5">
					<div class="row justify-content-center me-1 mb-3" style="text-weight:bold; font-size:20px;">1</div>
					<div class="card border-0" style="height:auto; width:120px;">
						<a href="detail.jsp"><img src="../img/testBook02.jpg" class="card-img-top" alt="..."></a>
						<div class="card-body p-0">
							<strong class="card-title">제목</strong>
							<p class="card-text m-0">저자</p>
							<p class="card-text m-0">구매 <span class="card-text m-0">20,000원</span></p>
							
						</div>
					</div>
				</div>
			


				
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>
				
				<div class="row my-3 border-bottom">
					<div class="col-1 pb-3 d-flex justify-content-center" style="display:flex; flex-wrap:wrap; align-content:center; text-weight:bold; font-size:20px;">1</div>
					<div class="col-2">
						<img class="thumbnail" alt="" src="../img/testBook02.jpg">
					</div>
					<div class="col-9 ps-4">
						<h6>프로그래머로 살아본 1년</h6>
						<p class="book-info">박윤종,백지현 외 1명<span class="partition"> | </span>씨익북스<span class="partition"> | </span>에세이</p>
						<p class="book-introduction">&lt;책소개&gt;초급개발자 3인의 에세이입니다.
							기획자의 길을 걷다 38살에 Front-end 개발자로 전직한 박윤종.
							Backend 개발자로 일을 시작한 유지니.
							그리고, DevOps 개발자의 길을 걷게된 백지현의 이야기를 들어봅시다.
						</p>
						<p class="book-introduction">구매 <span class="card-text">1,900원</span></p>
					</div>
				</div>

				
			</div>
			<div class="col-1"></div>
		</div>	
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
</html>