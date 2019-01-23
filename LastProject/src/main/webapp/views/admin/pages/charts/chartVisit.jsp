<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | Data Tables</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">ss">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap4.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<!-- Morris chart -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<style>	
	.userName{
		width: 100px;;
		
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.userContent{
		width: 500px;
		
      	text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.userAddress{
		width: 250px;
		
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.userDate{
		width: 250px;
		
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
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
						<li class="nav-item has-treeview">
							<a href="/Admin.do?m_id=admin&m_pwd=admin" class="nav-link"><i class="fas fa-home"></i>
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
						<li class="nav-item has-treeview menu-open">
							<a href="#" class="nav-link active"><i class="fas fa-chart-pie"></i>
								<p>차트 통계 <i class="right fa fa-angle-left"></i></p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/chartVisit.do"
									class="nav-link active"> <i class="fa fa-circle-o nav-icon"></i>
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
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>사용자 관리</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/Admin.do?m_id=admin&m_pwd=admin">Home</a></li>
								<li class="breadcrumb-item active">기타 통계</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
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
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">접속목록</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Date</th>
											<th>IP</th>
											<th>Country</th>
											<th>Browser</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${chartVisitList}">
										<fmt:formatDate value="${list.lv_date}" pattern="yyyy-MM-dd" var="lv_date"/>
										<tr>
											<td><div class="userName" style="text-align:center;">${lv_date}</div></td>
											<td><div class="userContent">${list.lv_ip}</div></td>
											<td><div class="userAddress">${list.lv_country}</div></td>
											<td><div class="userDate">${list.lv_browser}</div></td>
										</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
						
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- ./wrapper -->
	
	<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables -->
	<script src="../../plugins/datatables/jquery.dataTables.js"></script>
	<script src="../../plugins/datatables/dataTables.bootstrap4.js"></script>
	<!-- SlimScroll -->
	<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="../../plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	<!-- Morris.js charts -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
		
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
</body>
</html>
