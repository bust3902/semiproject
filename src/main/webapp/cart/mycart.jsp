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
<link rel="stylesheet" href="/semiproject/css/mycart.css"/>
</head>
<body>
<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="cart"/>
</jsp:include>
<div class="container">

<section class="mx-auto mb-5">
	<h4 class="mb-2"><strong>카트</strong></h4>
	
	<div class="cart_wrapper mt-3">
		<div class="cart_nav d-flex border border-bottom-0 border-opacity-50 fs-6 fw-semibold">
					<div class="flex-fill py-2 d-flex justify-content-center border-end border-opacity-50"><a>소장 가능</a><span class="ms-1 fw-normal">4</span></div>
					<div class="flex-fill py-2 d-flex justify-content-center border-bottom border-opacity-50 bg-light opacity-75"><a>대여 가능</a></div>
		</div>
		<form class="border border-top-0 border-opacity-50">
			<article id="cart_summary_wrapper">
			<div class="sticky-top">
				<div class="summary_info_wrapper">
				
					<div class="summary_info-data d-grid gap-3 p-3">
					<div class="summary_info-count d-flex align-items-center">
						<img class="check-icon me-1" src="../img/check-icon.png"><span>4권을 선택하셨습니다.</span>
					</div>
					<div class="summary_info-total_price d-flex justify-content-between">
						<p>총 상품 금액</p>
						<span>99,000원</span>
					</div>
					<div class="summary_info-discount_price d-flex justify-content-between">
						<p>할인 금액</p>
						<span>- 1,200원</span>	
					</div>
					</div>
					
					<div class="summary_total_wrapper d-flex d-flex justify-content-between align-items-center px-3 py-2">
						<p>합계</p>
						<span>78,600원</span>
					</div>
				</div>
				<div class="buy_button_wrapper d-grid mt-3">
					<button id="buy_button" class="btn btn-primary"><strong>소장으로 구매하기</strong></button>
				</div>
			</div>
			</article>
			
			<div class="list_handler d-flex p-3 fs-6 fw-bold sticky-top bg-white">
				<div class="flex-fill d-flex align-items-center">
					<input type="checkbox" id="check_all"/>
					<label for="check_all" class="ms-2">전체 선택</label>
				</div>
					<button type="button" class="btn btn-outline-secondary fs-8 fw-bold">선택 삭제</button>
			</div>
			<div class="cart_book_list px-3">
					<div class="cart_book d-flex py-4 border-top border-opacity-50">
						<div class="thumbnail_with_checkbox">
							<input type="checkbox" />
							<a><img alt="" src="../img/testbook1.jpg" /></a>
						</div>
						<div class="cart_book_info flex-fill ps-3">
							<div class="cart_book_text d-flex justify-content-between">
								<div class="cart_book_metadata">
									<p class="fs-6 fw-bold">비전공자를 위한 이해할 수 있는 IT 지식</p>
									<span style="font-size:12px;">최원영</span>
								</div>
								<div class="cart_book_price d-flex flex-column align-items-end">
									<del style="opacity: 50%;">12,000원</del>
									<div>
										<span class="text-danger">10%↓</span><span class="fw-bold ps-1" style="color: var(--main-color)">10,800원</span>
									</div>
								</div>
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary ">삭제</button>
							</div>
						</div>
					</div>
					<div class="cart_book d-flex py-4 border-top border-opacity-50">
						<div class="thumbnail_with_checkbox">
							<input type="checkbox" />
							<a><img alt="" src="../img/testbook1.jpg" /></a>
						</div>
						<div class="cart_book_info flex-fill ps-3">
							<div class="cart_book_text d-flex justify-content-between">
								<div class="cart_book_metadata">
									<p class="fs-6 fw-bold">비전공자를 위한 이해할 수 있는 IT 지식</p>
									<span style="font-size:12px;">최원영</span>
								</div>
								<div class="cart_book_price d-flex flex-column align-items-end">
									<del style="opacity: 50%;">12,000원</del>
									<div>
										<span class="text-danger">10%↓</span><span class="fw-bold ps-1" style="color: var(--main-color)">10,800원</span>
									</div>
								</div>
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary ">삭제</button>
							</div>
						</div>
					</div>
					<div class="cart_book d-flex py-4 border-top border-opacity-50">
						<div class="thumbnail_with_checkbox">
							<input type="checkbox" />
							<a><img alt="" src="../img/testbook1.jpg" /></a>
						</div>
						<div class="cart_book_info flex-fill ps-3">
							<div class="cart_book_text d-flex justify-content-between">
								<div class="cart_book_metadata">
									<p class="fs-6 fw-bold">비전공자를 위한 이해할 수 있는 IT 지식</p>
									<span style="font-size:12px;">최원영</span>
								</div>
								<div class="cart_book_price d-flex flex-column align-items-end">
									<del style="opacity: 50%;">12,000원</del>
									<div>
										<span class="text-danger">10%↓</span><span class="fw-bold ps-1" style="color: var(--main-color)">10,800원</span>
									</div>
								</div>
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary ">삭제</button>
							</div>
						</div>
					</div>
					<div class="cart_book d-flex py-4 border-top border-opacity-50">
						<div class="thumbnail_with_checkbox">
							<input type="checkbox" />
							<a><img alt="" src="../img/testbook1.jpg" /></a>
						</div>
						<div class="cart_book_info flex-fill ps-3">
							<div class="cart_book_text d-flex justify-content-between">
								<div class="cart_book_metadata">
									<p class="fs-6 fw-bold">비전공자를 위한 이해할 수 있는 IT 지식</p>
									<span style="font-size:12px;">최원영</span>
								</div>
								<div class="cart_book_price d-flex flex-column align-items-end">
									<del style="opacity: 50%;">12,000원</del>
									<div>
										<span class="text-danger">10%↓</span><span class="fw-bold ps-1" style="color: var(--main-color)">10,800원</span>
									</div>
								</div>
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary ">삭제</button>
							</div>
						</div>
					</div>
					<div class="cart_book d-flex py-4 border-top border-opacity-50">
						<div class="thumbnail_with_checkbox">
							<input type="checkbox" />
							<a><img alt="" src="../img/testbook1.jpg" /></a>
						</div>
						<div class="cart_book_info flex-fill ps-3">
							<div class="cart_book_text d-flex justify-content-between">
								<div class="cart_book_metadata">
									<p class="fs-6 fw-bold">비전공자를 위한 이해할 수 있는 IT 지식</p>
									<span style="font-size:12px;">최원영</span>
								</div>
								<div class="cart_book_price d-flex flex-column align-items-end">
									<del style="opacity: 50%;">12,000원</del>
									<div>
										<span class="text-danger">10%↓</span><span class="fw-bold ps-1" style="color: var(--main-color)">10,800원</span>
									</div>
								</div>
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary ">삭제</button>
							</div>
						</div>
					</div>
					<div class="cart_book d-flex py-4 border-top border-opacity-50">
						<div class="thumbnail_with_checkbox">
							<input type="checkbox" />
							<a><img alt="" src="../img/testbook1.jpg" /></a>
						</div>
						<div class="cart_book_info flex-fill ps-3">
							<div class="cart_book_text d-flex justify-content-between">
								<div class="cart_book_metadata">
									<p class="fs-6 fw-bold">비전공자를 위한 이해할 수 있는 IT 지식</p>
									<span style="font-size:12px;">최원영</span>
								</div>
								<div class="cart_book_price d-flex flex-column align-items-end">
									<del style="opacity: 50%;">12,000원</del>
									<div>
										<span class="text-danger">10%↓</span><span class="fw-bold ps-1" style="color: var(--main-color)">10,800원</span>
									</div>
								</div>
							</div>
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary ">삭제</button>
							</div>
						</div>
					</div>
			</div> <!-- end list -->
		</form>
	</div>
	
</section>
   
</div>
<jsp:include page="/common/footer.jsp">
	<jsp:param name="menu" value="cart"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>