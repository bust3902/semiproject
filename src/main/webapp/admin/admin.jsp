<%@page import="com.htabooks.vo.User"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.Pagination"%>
<%@page import="com.htabooks.vo.QuestionsBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.htabooks.dao.QuestionsBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="" %>
<%
    	//세션에서 로그인된 관리자정보를 조회한다.
	User adminAccount = (User) session.getAttribute("LOGINED_ADMIN");
	if (adminAccount == null) {
		throw new RuntimeException("관리자 페이지는 관리자 로그인 후 사용가능한 서비스 입니다.");
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="http://bootstrapk.com/components/" rel="icon">
<style type="text/css">
	
</style>
</head>
<body>
<div class="col-12">
	<jsp:include page="../common/adminheader.jsp"></jsp:include>
</div>
<div class="container">
<div class="row">
	<div class="col-2">
		<jsp:include page="../common/adminsidebar.jsp"></jsp:include>
	</div>
	<div class="col-10">
		<div class="row">
			<div class="invisible" style="width:135px;height:135px;">여백</div>
			
		</div>
		<!--  신규 회원가입 / 홈페이지 수익  -->
		<!-- 회원수, 매출액, 출입건수, 문의건수 현황 -->
		<div class="row " id="view">
			<div class="col mb-5">
				<div class="row">
					<div class="col">
						<div id="curve_chart" style="height:450px;"></div>
						<p id="view-current" class="col mb-2">총 회원수 : <strong style="color:red;font-size:25px;">3000</strong>명</p>					
					</div>
					<div class="col">
						<div id="columnchart_material" style="height:450px;"></div>
						<p id="view-current" class="col mb-2">6월 수익 :<strong style="color:red;font-size:25px;">750,000</strong>원</p>			
					</div>
				</div>
				<div class="row">
				</div>
			</div>
		</div>
		<hr>
		<div class="row mb-5 bg-white">
			<div class="col">
				<h2>문의 내용</h2>
			  	<table class="table table-hover">
				    <thead>
				      <tr class="table-primary">
				        <th>No</th>
				        <th>Name</th>
				        <th>Content</th>
				        <th>Date</th>
				      </tr>
				    </thead>
			    	<tbody>
						<tr class="table" onclick="location.href='/semiproject/admin/admin.jsp'" style="cursor:pointer">
							<td>1</td>
							<td>안재용</td>
							<td>전 꾸미는데 재능이 없나봐요</td>
							<td>2022.06.14</td>
						</tr>
						<tr class="table" onclick="location.href='/semiproject/admin/admin.jsp'" style="cursor:pointer">
							<td>2</td>
							<td>이완용</td>
							<td>차단된 회원입니다.</td>
							<td>2022.06.15</td>
							
							
						</tr>
						<tr class="table" onclick="location.href='/semiproject/admin/admin.jsp'" style="cursor:pointer">
							<td>3</td>
							<td>류관순</td>
							<td>오늘도 힘내봅시다</td>
							<td>2022.06.16</td>
						</tr>
						<tr class="table" onclick="location.href='/semiproject/admin/admin.jsp'" style="cursor:pointer">
							<td>4</td>
							<td>강감찬</td>
							<td>행복하세요 :]</td>
							<td>2022.06.17</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	  	<div class="row mb-3 bg-light">
	  		<div class="col">
	  		</div>
		</div>
	</div>

</div>
</div>
<jsp:include page="../common/footer.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 차트 1 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart1);
	// 차트1
	function drawChart1() {
		var data1 = google.visualization.arrayToDataTable([
			['Month', 'people'],
			['March',  85],
			['April',  115],
			['May',  130],
			['June',  205]
		]);
	
		var options1 = {
			title: '신규유입',
			curveType: 'function',
			legend: { position: 'bottom' }
		};
	
		var chart1 = new google.visualization.LineChart(document.getElementById('curve_chart'));
	
		chart1.draw(data1, options1);
		}
	// 차트2
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart2() {
		var data2 = google.visualization.arrayToDataTable([
			['Year', '판매수익', '광고수익', 'total'],
			['March', 100000, 40000, 140000],
			['April', 117000, 46000, 163000],
			['May', 66000, 112000, 178000],
			['June', 103000, 54000, 157000]
		]);
	
		var options2 = {
			chart: {
				title: '총 수익',
				
			}
	  	};
	
	  	var chart2 = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	  	chart2.draw(data2, google.charts.Bar.convertOptions(options2));
	}
</script>
</html>