<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>AdminLTE 3 | Starter</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  <!-- date-picker -->
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/t-datepicker.min.css">
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
  <!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>
  
<script>
$(document).ready(function(){
	   $('.t-datepicker').tDatePicker({
	     autoClose:true,
	     durationArrowTop:200,
	     limitDateRanges:91,
	     limitPrevMonth:0,
	     limitNextMonth:12,
	     numCalendar:2,
	     titleCheckIn:'입실날짜',
	     titleCheckOut:'퇴실날짜',
	     titleDateRange:'일',
	     titleDateRanges:'일',
	     titleToday:'오늘',
	     titleDays:['월','화','수','목','금','토','일'],
	     titleMonths:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     toDayShowTitle:true,
	     dateRangesShowTitle:true,
	     dateRangesHover:true,
	     toDayHighlighted:true,
	     dateDisabled:[false]
	   }).on('eventClickDay',function(e, dataDate){
	     var getDateInput = $('.t-datepicker').tDatePicker('getDateInputs');
	      document.getElementById("h_startdate").value = getDateInput[0];
	      document.getElementById("h_enddate").value = getDateInput[1];
	   });
	   
	});
</script>
<script>
var placeSearch, autocomplete;
function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')),{types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}
function fillInAddress() { //lat 와 lng 값을 넘겨줄 input 태그에 값 넣어주기
   var place = autocomplete.getPlace();
   document.getElementById("lat").value=place.geometry.location.lat();
   document.getElementById("lng").value=place.geometry.location.lng();
}

function yearChange() {
	$('.t-datepicker').tDatePicker({
	     autoClose:true,
	     durationArrowTop:200,
	     limitDateRanges:61,
	     limitPrevMonth:0,
	     limitNextMonth:12,
	     numCalendar:2,
	     titleCheckIn:'입실날짜',
	     titleCheckOut:'퇴실날짜',
	     titleDateRange:'일',
	     titleDateRanges:'일',
	     titleToday:'오늘',
	     titleDays:['월','화','수','목','금','토','일'],
	     titleMonths:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     toDayShowTitle:true,
	     dateRangesShowTitle:true,
	     dateRangesHover:true,
	     toDayHighlighted:true,
	     dateDisabled:[false]
	   }).on('eventClickDay',function(e, dataDate){
	     var getDateInput = $('.t-datepicker').tDatePicker('getDateInputs');
	      document.getElementById("h_startdate").value = getDateInput[0];
	      document.getElementById("h_enddate").value = getDateInput[1];
	   });
	}
</script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-comments-o"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fa fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fa fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fa fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-bell-o"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fa fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fa fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fa fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
            class="fa fa-th-large"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-dashboard"></i>
              <p>
                Starter Pages
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="fa fa-circle-o nav-icon"></i>
                  <p>Active Page</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fa fa-circle-o nav-icon"></i>
                  <p>Inactive Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fa fa-th"></i>
              <p>
                Simple Link
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
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
            <h1 class="m-0 text-dark">이벤트 작성</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="card card-warning">
	            <div class="card-header">
					<h3 class="card-title">이벤트 입력</h3>
				</div>
				<div class="card-body">
					<form role="form" method="POST" enctype="multipart/form-data">
						<!-- text input -->
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" placeholder="이벤트명">
						</div>
						<!-- textarea -->
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" placeholder="이벤트 내용"></textarea>
						</div>
						
						<!-- input states -->
						<div class="form-group has-success">
							<label class="control-label" for="inputSuccess">
							<i class="far fa-calendar-alt"></i> 이벤트 기간</label>
							<div class="t-datepicker">
	                          <div class="t-check-in"></div>
	                          <div class="t-check-out"></div>
	                        </div>
	                        <input id="h_startdate" type="hidden" class="form-control" name="e_startdate" required data-eye> 
                            <input id="h_enddate" type="hidden" class="form-control" name="e_enddate" required data-eye>
						</div>
						
						<div class="주소">
							<label class="control-label" for="inputWarning">
							<i class="fa fa-bell-o"></i>주소</label>
							<input id="autocomplete" type="text" class="form-control" name="m_address">
                            <input class="field" id="lat" type="hidden" class="form-control" name="lat"/>
                            <input class="field" id="lng" type="hidden" class="form-control" name="lng"/>
						</div>
						<div class="form-group has-error">
							<label class="control-label" for="inputError"><i
								class="fa fa-times-circle-o"></i> Input with error</label> <input
								type="text" class="form-control" id="inputError"
								placeholder="Enter ...">
						</div>

						<!-- checkbox -->
						<div class="form-group">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									value="option1"> <label class="form-check-label">Checkbox</label>
							</div>

							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									value="option1" disabled> <label
									class="form-check-label">Checkbox disabled</label>
							</div>
						</div>

						<!-- radio -->
						<div class="form-group">
							<div class="form-check">
								<input class="form-check-input" type="radio" value="option1">
								<label class="form-check-label">Radio</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" value="option1"
									disabled> <label class="form-check-label">Radio
									disabled</label>
							</div>
						</div>

						<!-- select -->
						<div class="form-group">
							<label>Select</label> <select class="form-control">
								<option>option 1</option>
								<option>option 2</option>
								<option>option 3</option>
								<option>option 4</option>
								<option>option 5</option>
							</select>
						</div>
						<div class="form-group">
							<label>Select Disabled</label> <select class="form-control"
								disabled>
								<option>option 1</option>
								<option>option 2</option>
								<option>option 3</option>
								<option>option 4</option>
								<option>option 5</option>
							</select>
						</div>

						<!-- Select multiple-->
						<div class="form-group">
							<label>Select Multiple</label> <select multiple
								class="form-control">
								<option>option 1</option>
								<option>option 2</option>
								<option>option 3</option>
								<option>option 4</option>
								<option>option 5</option>
							</select>
						</div>
						<div class="form-group">
							<label>Select Multiple Disabled</label> <select multiple
								class="form-control" disabled>
								<option>option 1</option>
								<option>option 2</option>
								<option>option 3</option>
								<option>option 4</option>
								<option>option 5</option>
							</select>
						</div>

					</form>
				</div>
				<!-- /.card-body -->
				</div>
				<!-- /.card -->
              </div>
             </div>
          
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2014-2018 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<script src="/views/datepicker/public/theme/js/t-datepicker.min.js"></script>
</body>
</html>