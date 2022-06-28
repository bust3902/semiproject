<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.vo.QuestionsBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dao.QuestionsBoardDao"%>
<%@page import="com.htabooks.dao.NoticeBoardDao"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
  <div class="row">
   		<font class="col" size="8" color="#0d6efd"><strong>문의게시판</strong></font>
   		<input class="col mt-2" type="text" id="myInput" onkeyup="myFunction()" placeholder="검색" title="Type in a name">
   </div>
  
  <div class="mt-4 pt-4" id="collapse-content">
	  <div class="mb-4 bg-success bg-opacity-25">
		  <a href="#demo1" class="text-dark text-decoration-none ms-3 mt-2" data-bs-toggle="collapse" onclick="hideOthers(event)">책을 구매했는데 할인가가 아닌 정상가로 구매가 되었어요 1</a>
		  <div id="demo1" class="collapse ms-3 mt-3 me-3 pb-3">
		  <hr>
		    로그인하지 않은 상태로 비회원 구매를 하실 경우 할인가가 아닌 정상가로 구입되는 점 양해 바랍니다.
		  </div>
	  </div>
	   <div class="mb-4 bg-success bg-opacity-25">
		  <a href="#demo2" class="text-dark text-decoration-none ms-3" data-bs-toggle="collapse" onclick="hideOthers(event)">책을 구매했는데 할인가가 아닌 정상가로 구매가 되었어요 2</a>
		  <div id="demo2" class="collapse ms-3 mt-3 pb-3">
		  <hr>
		    로그인하지 않은 상태로 비회원 구매를 하실 경우 할인가가 아닌 정상가로 구입되는 점 양해 바랍니다.
		  </div>
	  </div>
	   <div class="mb-4 bg-success bg-opacity-25">
		  <a href="#demo3" class="text-dark text-decoration-none ms-3" data-bs-toggle="collapse" onclick="hideOthers(event)">책을 구매했는데 할인가가 아닌 정상가로 구매가 되었어요 3</a>
		  <div id="demo3" class="collapse ms-3 mt-3 pb-3">
		  <hr>
		    로그인하지 않은 상태로 비회원 구매를 하실 경우 할인가가 아닌 정상가로 구입되는 점 양해 바랍니다.
		  </div>
	  </div>
	   <div class="mb-4 bg-success bg-opacity-25">
		  <a href="#demo4" class="text-dark text-decoration-none ms-3 " data-bs-toggle="collapse" onclick="hideOthers(event)">책을 구매했는데 할인가가 아닌 정상가로 구매가 되었어요 4</a>
		  <div id="demo4" class="collapse ms-3 mt-3 me-3 pb-3">
		  <hr>
		    로그인하지 않은 상태로 비회원 구매를 하실 경우 할인가가 아닌 정상가로 구입되는 점 양해 바랍니다.
		  </div>
	  </div>
  </div>
  
<div>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center mt-4">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
</div>
<script type="text/javascript">
	// [a, a, a, a]
	let collapseLinks = document.querySelectorAll("#collapse-content a");
	
	function hideOthers(event) {
		// 지금 클릭한 링크 엘리먼트
		let clickedLink = event.target;	// 클릭한 a 태그'
		// 클릭한 a태그의 href 속성값
		let clickedLinkId = event.target.getAttribute("href");	// #demo1 혹은 #demo2		
		let clickedLinkDiv = document.querySelector(clickedLinkId);
		if (clickedLinkDiv.classList.contains("collapsed")) {
			return;
		}
	
		// 모든 a태그를 반복처리한다.
		for (let index = 0; index < collapseLinks.length; index++) {
			// a태그를 조회
			let link = collapseLinks[index];
			// 반복처리중인 a태그의 href 값을 조회
			let linkId = link.getAttribute("href");
			// 반복처리중인 a태그의 href값과 클릭한 a 태그의 href 값이 같으면 아무 동작없이 다음번 a태그를 검사하러 간다.
			if (link.getAttribute("href") === clickedLinkId) {
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

</body>
</html>