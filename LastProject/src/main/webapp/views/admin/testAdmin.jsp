<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>관리자 페이지</title> 
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker-bs3.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<style>
	.inner {
		font-family: 'Noto Sans KR', sans-serif;
		color: white;
	}
	
	#client {
		background-color: #E0A914;
	}
	
	.small-box-footer {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	svg {
	    height: 300;
	    width: 1260;
	}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/sub2.do" class="brand-link">
			<img src="/views/img/happy.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">Gukbong World</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/views/img/administrator.png" class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">Admin</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item has-treeview menu-open">
							<a href="/Admin.do?m_id=admin&m_pwd=admin" class="nav-link active"><i class="fas fa-home"></i>
								<p>메인화면</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/userAdmin.do" class="nav-link"><i class="fas fa-users"></i>
								<p>클라이언트 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/eventAdmin.do" class="nav-link"><i class="fas fa-calendar-check"></i>
								<p>이벤트 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/adminGetReceiveMessageList.do" class="nav-link"><i class="fas fa-headset"></i>
								<p>문의 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="/localAdviceAdminList.do" class="nav-link"><i class="fas fa-edit"></i>
								<p>게시글 관리</p>
							</a>
						</li>
						<li class="nav-item has-treeview">
							<a href="#" class="nav-link"><i class="fas fa-chart-pie"></i>
								<p>차트 통계 <i class="right fa fa-angle-left"></i></p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/chartVisit.do"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p><i class="fab fa-internet-explorer"></i> 사이트 접속 기록</p>
								</a></li>
								<li class="nav-item"><a href="/views/admin/pages/charts/chartjs.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p><i class="fas fa-chart-bar"></i> 기타 통계</p>
								</a></li>
						</ul></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">메인화면</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/Admin.do?m_id=admin&m_pwd=admin">Home</a></li>
								<li class="breadcrumb-item active">메인화면</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-3 col-6">							
							<div class="info-box bg-warning">
								<span class="info-box-icon"><i class="fa fa-tag"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">게시글 수</span>
									<span class="info-box-number">${adminCnt.l_cnt + adminCnt.e_cnt}</span>
								</div>
								<!-- /.info-box-content -->
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
						<div class="info-box mb-3 bg-success">
								<span class="info-box-icon"><i class="fas fa-comments"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">댓글 수</span> <span
										class="info-box-number">${adminCnt.lc_cnt + adminCnt.ec_cnt}</span>
								</div>
								<!-- /.info-box-content -->
							</div>
						
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="info-box mb-3 bg-danger">
								<span class="info-box-icon"><i class="fas fa-home"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">유효 호스트 수(전체)</span> <span
										class="info-box-number">${adminCnt.rh_cnt}(${adminCnt.h_cnt})</span>
								</div>
								<!-- /.info-box-content -->
							</div>
						</div>
						
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="info-box mb-3 bg-danger">
								<span class="info-box-icon"><i class="fas fa-plane"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">유효 여행자 수(전체)</span> <span
										class="info-box-number">${adminCnt.rt_cnt}(${adminCnt.t_cnt})</span>
								</div>
								<!-- /.info-box-content -->
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div id="client" class="small-box">
								<div class="inner">
									<h3>${adminCnt.m_cnt}</h3>

									<p>클라이언트 관리</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="../../userAdmin.do" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div id="person" class="small-box bg-info">
								<div class="inner">
									<h3>${adminCnt.e_cnt}</h3>

									<p>이벤트 관리</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="../../eventAdmin.do" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-6">
						<div id="client" class="small-box">
								<div class="inner">
									<h3>${adminCnt.adm_cnt}</h3>

									<p>문의 관리</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="../../adminGetReceiveMessageList.do" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						
							<div class="col-lg-3 col-6">
						<div id="client" class="small-box">
								<div class="inner">
									<h3>${adminCnt.l_cnt}</h3>

									<p>게시글 관리</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="../../localAdviceAdminList.do" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						
						
						<!-- ./col -->
					</div>
					<!-- /.row -->
					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section class="col-lg-7 connectedSortable">
							<!-- Custom tabs (Charts with tabs)-->
							<div class="card" style="width: 1300px;">
								<div class="card-header d-flex p-0">
									<h3 class="card-title p-3">
										<i class="fa fa-pie-chart mr-1"></i> 방문자
									</h3>
									<ul class="nav nav-pills ml-auto p-2">
										<li class="nav-item"><a class="nav-link active" href="#weekChart" id="weekTab" data-toggle="tab">주</a></li>
										<li class="nav-item"><a class="nav-link" href="#monthChart" id="monthTab" data-toggle="tab">월</a></li>
										<li class="nav-item"><a class="nav-link" href="#yearChart" id="yearTab" data-toggle="tab">년</a></li>
									</ul>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div class="tab-content p-0">
										<div class="tab-pane active" id="weekChart" style="position: relative; height: 300px;"></div>
										<div class="tab-pane active" id="monthChart" style="position: relative; height: 300px;"></div>
										<div class="tab-pane active" id="yearChart" style="position: relative; height: 300px;"></div>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</section>
						<!-- right col -->
					</div>
					<!-- /.row (main row) -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- ./wrapper -->
	
	<script>
	$(function(){
		$.ajax({ //모리스 차트 마저하기
			type:"POST",
			url:"/logVisitChart.do",
			dataType:"json",
			success: function(result){
				new Morris.Line({
		            element: 'weekChart',
		            data: result,
		            parseTime: false,
		            xkey: 'lv_date',
		            ykeys: ['value'],
		            labels: ['방문자수']
		        
		        });
			}
		});
		
		$.ajax({
			type:"POST",
			url:"/logVisitChartMonth.do",
			dataType:"json",
			success: function(result){
				new Morris.Line({
		            element: 'monthChart',
		            data: result,
		            parseTime: false,
		            xkey: 'lv_date_mon',
		            ykeys: ['mon_value'],
		            labels: ['방문자수']
		        
		        });
			}
		});
		
		$.ajax({
			type:"POST",
			url:"/logVisitChartYear.do",
			dataType:"json",
			success: function(result){
				new Morris.Line({
		            element: 'yearChart',
		            data: result,
		            parseTime: false,
		            xkey: 'lv_date_year',
		            ykeys: ['year_value'],
		            labels: ['방문자수']
		        
		        });
			}
		});
		
	})
	
	</script>
	

	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Morris.js charts -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
	<!-- Sparkline -->
	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="plugins/knob/jquery.knob.js"></script>
	<!-- daterangepicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
</body>
</html>