<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
</head>

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<!-- Form controls -->
		<%-- 		<jsp:include page="jsp/chart/infomation-chart.jsp"></jsp:include> --%>
		<!-- 		<canvas id="myChart"></canvas> -->
		<form action="admin/ReportServlet" method="post">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item ${activetab1 }"><a 
					class="nav-link ${activetab1 }" id="home-tab" data-toggle="tab"
					href="#home" role="tab" aria-controls="home"
					aria-selected="${tabselectedtab1 }"
					aria-expanded="${tabselectedtab1 }">TỔNG LƯỢT YÊU THÍCH</a></li>
				<li class="nav-item ${activetab2 }"><a
					class="nav-link ${activetab2 }" id="profile-tab" data-toggle="tab"
					href="#profile" role="tab" aria-controls="profile"
					aria-selected="${tabselectedtab2 }"
					aria-expanded="${tabselectedtab2 }">NGƯỜI YÊU THÍCH THEO SẢN
						PHẨM</a></li>
				<li class="nav-item ${activetab3 }"><a
					class="nav-link ${activetab3 }" id="contact-tab" data-toggle="tab"
					href="#contact" role="tab" aria-controls="contact"
					aria-selected="${tabselectedtab3 }"
					aria-expanded="${tabselectedtab3 }">NGƯỜI GỬI & NGƯỜI NHẬN CỦA
						SẢN PHẨM</a></li>
			</ul>
		</form>
		<div class="tab-content" id="myTabContent">
			<jsp:include page="/views/admin/jsp/chart/tab1.jsp"></jsp:include>
			<jsp:include page="/views/admin/jsp/chart/tab2.jsp"></jsp:include>
			<jsp:include page="/views/admin/jsp/chart/tab3.jsp"></jsp:include>
		</div>
	</div>

	<!-- /row -->
</div>
<!-- /container -->
<!-- /SECTION -->


<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	let myChart = document.getElementById('myChart').getContext('2d');
	// Global Options
	Chart.defaults.global.defaultFontFamily = 'Lato';
	Chart.defaults.global.defaultFontSize = 18;
	Chart.defaults.global.defaultFontColor = '#777';

	let massPopChart = new Chart(myChart, {
		type : 'line', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
		data : {
			labels : [ 'Boston', 'Worcester', 'Springfield', 'Lowell',
					'Cambridge', 'New Bedford' ],
			datasets : [ {
				label : 'Population',
				data : [ 617594, 181045, 153060, 106519, 105162, 95072 ],
				//backgroundColor:'green',
				backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
						'rgba(54, 162, 235, 0.6)', 'rgba(255, 206, 86, 0.6)',
						'rgba(75, 192, 192, 0.6)', 'rgba(153, 102, 255, 0.6)',
						'rgba(255, 159, 64, 0.6)', 'rgba(255, 99, 132, 0.6)' ],
				borderWidth : 1,
				borderColor : '#777',
				hoverBorderWidth : 3,
				hoverBorderColor : '#000'
			} ]
		},
		options : {
			title : {
				display : true,
				text : 'CHART',
				fontSize : 25
			},
			legend : {
				display : true,
				position : 'right',
				labels : {
					fontColor : '#000'
				}
			},
			layout : {
				padding : {
					left : 50,
					right : 0,
					bottom : 0,
					top : 0
				}
			},
			tooltips : {
				enabled : true
			}
		}
	});
</script>
