<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | ChartJS</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
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
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p><i class="fab fa-internet-explorer"></i> 사이트 접속 기록</p>
								</a></li>
								<li class="nav-item"><a href="/views/admin/pages/charts/chartjs.jsp"
									class="nav-link active"> <i class="fa fa-circle-o nav-icon"></i>
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
            <h1>ChartJS</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/Admin.do?m_id=admin&m_pwd=admin">Home</a></li>
              <li class="breadcrumb-item active">사이트 접속 기록</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <!-- DONUT CHART2 -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">사용자 성별 통계</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="pieChart2" style="height:250px"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DONUT CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">방문자 Browser별 통계</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="pieChart" style="height:250px"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">

            <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">월별 가입자 통계</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart" style="height:330px">
                  <canvas id="barChart" style="height:250px"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Add Content Here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="../../plugins/chartjs-old/Chart.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    $.ajax({
		type:"POST",
		url:"/browserChart.do",
		dataType:"json",
		success: function(result){
			var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
		    var pieChart       = new Chart(pieChartCanvas)
		    var PieData        = result
		    var pieOptions     = {
		      //Boolean - Whether we should show a stroke on each segment
		      segmentShowStroke    : true,
		      //String - The colour of each segment stroke
		      segmentStrokeColor   : '#fff',
		      //Number - The width of each segment stroke
		      segmentStrokeWidth   : 2,
		      //Number - The percentage of the chart that we cut out of the middle
		      percentageInnerCutout: 50, // This is 0 for Pie charts
		      //Number - Amount of animation steps
		      animationSteps       : 100,
		      //String - Animation easing effect
		      animationEasing      : 'easeOutBounce',
		      //Boolean - Whether we animate the rotation of the Doughnut
		      animateRotate        : true,
		      //Boolean - Whether we animate scaling the Doughnut from the centre
		      animateScale         : false,
		      //Boolean - whether to make the chart responsive to window resizing
		      responsive           : true,
		      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
		      maintainAspectRatio  : true,
		      //String - A legend template
		    }
		    //Create pie or douhnut chart
		    // You can switch between pie and douhnut using the method below.
		    pieChart.Doughnut(PieData, pieOptions)
        }
	})
	
	$.ajax({
		type:"POST",
		url:"/genderChart.do",
		dataType:"json",
		success: function(result){
			var pieChartCanvas = $('#pieChart2').get(0).getContext('2d')
		    var pieChart       = new Chart(pieChartCanvas)
		    var PieData        = result
		    var pieOptions     = {
		      //Boolean - Whether we should show a stroke on each segment
		      segmentShowStroke    : true,
		      //String - The colour of each segment stroke
		      segmentStrokeColor   : '#fff',
		      //Number - The width of each segment stroke
		      segmentStrokeWidth   : 2,
		      //Number - The percentage of the chart that we cut out of the middle
		      percentageInnerCutout: 50, // This is 0 for Pie charts
		      //Number - Amount of animation steps
		      animationSteps       : 100,
		      //String - Animation easing effect
		      animationEasing      : 'easeOutBounce',
		      //Boolean - Whether we animate the rotation of the Doughnut
		      animateRotate        : true,
		      //Boolean - Whether we animate scaling the Doughnut from the centre
		      animateScale         : false,
		      //Boolean - whether to make the chart responsive to window resizing
		      responsive           : true,
		      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
		      maintainAspectRatio  : true,
		      //String - A legend template
		    }
		    //Create pie or douhnut chart
		    // You can switch between pie and douhnut using the method below.
		    pieChart.Doughnut(PieData, pieOptions)
        }
	})
    

    //-------------
    //- BAR CHART -
    //-------------
    $.ajax({
		type:"POST",
		url:"/registChart.do",
		dataType:"json",
		success: function(result){
			//-------------
		    //- BAR CHART -
		    //-------------
		    var barChartCanvas                   = $('#barChart').get(0).getContext('2d')
		    var barChart                         = new Chart(barChartCanvas)
			var barLabels = new Array();
			var bardatas = new Array();
			for(var i=0; i<result.length; i++){
				barLabels[i] = result[i].label;
				bardatas[i] = result[i].data;
			}
		    var barChartData = {
		        labels  : barLabels,
		        datasets: [
		            {
		              label               : 'Electronics',
		              fillColor           : 'rgba(60,141,188,0.9)',
		              strokeColor         : 'rgba(60,141,188,0.9)',
		              pointColor          : '#3b8bba',
		              pointStrokeColor    : 'rgba(60,141,188,1)',
		              pointHighlightFill  : '#fff',
		              pointHighlightStroke: 'rgba(60,141,188,1)',
		              data                : bardatas
		            }
		          ]
		      }
		    var barChartOptions                  = {
		    	      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
		    	      scaleBeginAtZero        : true,
		    	      //Boolean - Whether grid lines are shown across the chart
		    	      scaleShowGridLines      : true,
		    	      //String - Colour of the grid lines
		    	      scaleGridLineColor      : 'rgba(0,0,0,.05)',
		    	      //Number - Width of the grid lines
		    	      scaleGridLineWidth      : 1,
		    	      //Boolean - Whether to show horizontal lines (except X axis)
		    	      scaleShowHorizontalLines: true,
		    	      //Boolean - Whether to show vertical lines (except Y axis)
		    	      scaleShowVerticalLines  : true,
		    	      //Boolean - If there is a stroke on each bar
		    	      barShowStroke           : true,
		    	      //Number - Pixel width of the bar stroke
		    	      barStrokeWidth          : 1,
		    	      //Number - Spacing between each of the X value sets
		    	      barValueSpacing         : 5,
		    	      //Number - Spacing between data sets within X values
		    	      barDatasetSpacing       : 1,
		    	      //Boolean - whether to make the chart responsive
		    	      responsive              : true,
		    	      maintainAspectRatio     : true
		    	    }

		    barChartOptions.datasetFill = false
		    barChart.Bar(barChartData, barChartOptions)
		}
	})
  })
</script>
</body>
</html>