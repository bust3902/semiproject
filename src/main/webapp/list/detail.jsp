<%@page import="java.util.ArrayList"%>
<%@page import="com.htabooks.dao.CartItemDao"%>
<%@page import="com.htabooks.vo.CartItem"%>
<%@page import="com.htabooks.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dto.BookDto"%>
<%@page import="com.htabooks.dao.BookDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
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
		
		a.side-link {
			font-size:13px;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
		
		a.link-dark { font-size:12px; }
		
		p.text { font-size:13px; }
		
		p.box { font-size:12px; }
			
		span.partition {
			font-size:11px;
			color: lightgray;
		}
		
		.more {
			font-size:13px;
			display: -webkit-box;
			text-overflow: ellipsis;
			-webkit-box-orient: vertical;
			-webkit-line-clamp: 3;
			overflow: hidden;
		}

		.show {
			font-size:13px;
		}
		
	</style>
</head>
<body>

<jsp:include page="/common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>

<div class="container px-5 mt-5" style="min-width:1094px;">
	<div class="row">
		<%! @SuppressWarnings("unchecked") %>
		<%
			CartItemDao cartItemDao = CartItemDao.getInstance();
			BookDao bookDao = BookDao.getInstance();
		
			int bookNo = StringUtil.stringToInt(request.getParameter("bookNo"));
		
			BookDto book = bookDao.getBookByNo(bookNo);
			
			List<BookDto> BestSellerList = bookDao.getBestSellerBooks(book.getCategoryGroupNo(), book.getCategoryNo());
			
			//????????? ??????????????? ?????? ??????
			boolean isOnCart = false;
			User user = (User) session.getAttribute("LOGINED_USER");
			List<CartItem> cart = new ArrayList<>();
			if (user == null) {
				// ?????? ??????
				cart = (ArrayList<CartItem>) session.getAttribute("cart");
				if (cart == null) {
					cart = new ArrayList<CartItem>();
					session.setAttribute("cart", cart);
				}
			} 
			else {
				// ?????? ??????
				cart = cartItemDao.getCartItemsByUserNo(user.getNo());
			}
			for(CartItem item : cart){
				if(item.getBookNo() == bookNo){
					isOnCart = true;
				}
			}
			
		%>
		<div class="col-10">
			<div class="row">
				<div class="col-3">
					<img src="../img/<%=book.getImgFileName() %>" style="height:auto; width:200px;" onclick="window.open(this.src)">
				</div>
				<div class="col-8 mx-3">
					<div class="row">
						<ul class="list-unstyled">
							<li>
								<a href="itmainlist.jsp?categoryGroupNo=<%=book.getCategoryGroupNo() %>" class="link-dark text-decoration-none"><%=book.getCategoryGroupName() %></a><strong style="font-weight:bold; font-size:12px;"> ></strong><a href="#" class="link-dark text-decoration-none"> <%=book.getCategoryName() %></a>
							</li>
						</ul>
					</div>
					<div class="row">
						<h1 style="font-weight:bold;"><%=book.getTitle() %></h1>
					</div>
					<div class="row border-bottom">
						<p style="font-weight:bold; font-size:14px;"><%=book.getWriter() %></p>
						<p></p>
					</div>
					<div class="row border-top border-bottom mt-3 text-center align-items-center">
						<div class="col-4">
							<p style="font-weight:bold; font-size:14px;">??????</p>
						</div>
						<div class="col-8 border-start bg-light">
							<div class="row p-2">
								<div class="col-6 mt-3">
									<p class="text-start text">????????? ??????</p>
									<p></p>
									<p class="text-start text">????????? ??????</p>
									<p></p>
									<p class="text-start text">?????????</p>
								</div>
								<div class="col-6 mt-3">
									<p class="text-end text"><strong><%=book.getPaperBookPrice() %></strong> ???</p>
									<p></p>
									<p class="text-end text"><strong><%=book.getBookPrice() %></strong> ???</p>
									<p></p>
									<p class="text-end text"><strong><%=book.getBookPrice() %></strong> ???</p>
								</div>
							</div>	
						</div>
					</div>
					<div class="row my-5">
						<div class="col-12 position-relative mb-5">
							<div class="position-absolute end-0">
								<button type="button" onclick="addToCart(<%=book.getNo() %>)" class="btn btn-default btn-lg cart-button <%=isOnCart ? "alert-danger" : "" %>">
									<span class="glyphicon glyphicon-shopping-cart"></span>
								</button>
								<button class="btn btn-primary btn-lg" onclick="location.href='../order/checkout.jsp?action=buy&bookNo=<%=bookNo %>'"><span style="font-size:14px; font-weight:bold;">????????????</span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" style="width:800px; height:20px;"></div>
			<div class="row border border-4 px-4 pt-4 pb-2">
				<div class="col-4">
					<p class="box"><strong>?????????</strong> <%=book.getCreatedDate() %> ??????</p>
					<p class="box"><strong>?????????</strong> <%=book.getBookSalesRate() %> ???</p>
					<p class="box"><strong>????????????</strong> PDF</p>
				</div>
				<div class="col-8">
					<p class="box"><strong>?????????</strong> <%=book.getBookPublisher() %></p>
					<p class="box"><strong>?????? ??????</strong> ?????????</p>
					<p class="box"><strong>?????? ??????</strong> PAPER <span class="partition"> | </span> iOS <span class="partition"> | </span> Android <span class="partition"> | </span> Windows <span class="partition"> | </span> Mac</p>
				</div>
			</div>
			<div class="row my-5">
				<strong class="border-bottom border-3 border-gray mt-3" style="font-size:20px; color:gray;">?????? ??????</strong>
					<p class="mt-4 mb-0 book-introduce more"><%=book.getIntroduce() %>
					</p>
					<button class="btn_open btn-link text-decoration-none text-right" style="font-size:12px;" onclick="more(event)">????????????</button>
					<button class="btn_close hide btn-link text-decoration-none text-right" style="font-size:12px;">??????</button>
			</div>
		</div>
		
		<div class="col-2">
			<div>
				<ul class="list-unstyled">
					<li><a href="detail.jsp?no=" class="link-dark nav-link side-link"></a></li>
					<li><strong style="font-size:13px;" class="my-2"><%=book.getCategoryName() %> ?????????</strong></li>
					<%
						int index = 0;
						for (BookDto booklist : BestSellerList) {
							index++;
					%>
					<li><a href="detail.jsp?bookNo=<%=booklist.getNo() %>" class="link-dark nav-link side-link my-2 border-bottom"><strong class="text-danger"><%=index %>???</strong> <%=booklist.getTitle() %></a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<div class="row" style="width:800px; height:30px;"></div>
</div>

<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script>
function more(event) {
	let clickedBtn = event.target;
    clickedBtn.classList.add("hide");
    document.querySelector('.btn_close').classList.remove("hide");
    document.querySelector('.book-introduce').classList.remove('more');    
    document.querySelector('.book-introduce').classList.add('show');    
    document.querySelector('.btn_close').classList.remove("hide");
};
    	
document.querySelector('.btn_close').addEventListener('click', function(e){
    e.target.classList.add('hide');
    document.querySelector('.book-introduce').classList.remove('show');    
    document.querySelector('.book-introduce').classList.add('more');   
    document.querySelector('.btn_open').classList.remove('hide');
});

// ????????? ????????????
function addToCart(no) {
  let btn = document.querySelector('.cart-button');
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      let jsonText = xhr.responseText;
      let result = JSON.parse(jsonText);
      let isExist = result.exist;

      if (isExist) {
        alert("?????? ????????? ?????? ????????????.");
        btn.blur();
      } else {
        const cartBtn = document.querySelector(".cart-button");
        cartBtn.classList.add("alert-danger");
        alert("????????? ???????????????.");
        btn.blur();
      }
    }
  };

  xhr.open("get", "../cart/add.jsp?bookNo=" + no);
  xhr.send();
}


</script>
</body>
</html>