<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | Widgets</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fa fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="../index3.jsp" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- SEARCH FORM -->
			<form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search">
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
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="fa fa-comments-o"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../dist/img/user1-128x128.jpg" alt="User Avatar"
									class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fa fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="fa fa-clock-o mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../dist/img/user8-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fa fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="fa fa-clock-o mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../dist/img/user3-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fa fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="fa fa-clock-o mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell-o"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15
							Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fa fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fa fa-users mr-2"></i>
							8 friend requests <span class="float-right text-muted text-sm">12
								hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fa fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"> <i
						class="fa fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="../index3.jsp" class="brand-link"> <img
				src="../dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">AdminLTE 3</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="../dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">Alexander Pierce</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-dashboard"></i>
								<p>
									Dashboard <i class="right fa fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="../index.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Dashboard v1</p>
								</a></li>
								<li class="nav-item"><a href="../index2.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Dashboard v2</p>
								</a></li>
								<li class="nav-item"><a href="../index3.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Dashboard v3</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="widgets.jsp"
							class="nav-link active"> <i class="nav-icon fa fa-th"></i>
								<p>
									Widgets <span class="right badge badge-danger">New</span>
								</p>
						</a></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-pie-chart"></i>
								<p>
									Charts <i class="right fa fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="charts/chartjs.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>ChartJS</p>
								</a></li>
								<li class="nav-item"><a href="charts/flot.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Flot</p>
								</a></li>
								<li class="nav-item"><a href="charts/inline.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Inline</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-tree"></i>
								<p>
									UI Elements <i class="fa fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="UI/general.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>General</p>
								</a></li>
								<li class="nav-item"><a href="UI/icons.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Icons</p>
								</a></li>
								<li class="nav-item"><a href="UI/buttons.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Buttons</p>
								</a></li>
								<li class="nav-item"><a href="UI/sliders.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Sliders</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-edit"></i>
								<p>
									Forms <i class="fa fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="forms/general.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>General Elements</p>
								</a></li>
								<li class="nav-item"><a href="forms/advanced.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Advanced Elements</p>
								</a></li>
								<li class="nav-item"><a href="forms/editors.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Editors</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-table"></i>
								<p>
									Tables <i class="fa fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="tables/simple.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Simple Tables</p>
								</a></li>
								<li class="nav-item"><a href="tables/data.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Data Tables</p>
								</a></li>
							</ul></li>
						<li class="nav-header">EXAMPLES</li>
						<li class="nav-item"><a href="calendar.jsp" class="nav-link">
								<i class="nav-icon fa fa-calendar"></i>
								<p>
									Calendar <span class="badge badge-info right">2</span>
								</p>
						</a></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-envelope-o"></i>
								<p>
									Mailbox <i class="fa fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="mailbox/mailbox.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Inbox</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/compose.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Compose</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/read-mail.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Read</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-book"></i>
								<p>
									Pages <i class="fa fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="examples/invoice.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Invoice</p>
								</a></li>
								<li class="nav-item"><a href="examples/profile.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Profile</p>
								</a></li>
								<li class="nav-item"><a href="examples/login.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Login</p>
								</a></li>
								<li class="nav-item"><a href="examples/register.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Register</p>
								</a></li>
								<li class="nav-item"><a href="examples/lockscreen.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Lockscreen</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fa fa-plus-square-o"></i>
								<p>
									Extras <i class="fa fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="examples/404.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Error 404</p>
								</a></li>
								<li class="nav-item"><a href="examples/500.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Error 500</p>
								</a></li>
								<li class="nav-item"><a href="examples/blank.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Blank Page</p>
								</a></li>
								<li class="nav-item"><a href="../starter.jsp"
									class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
										<p>Starter Page</p>
								</a></li>
							</ul></li>
						<li class="nav-header">MISCELLANEOUS</li>
						<li class="nav-item"><a href="https://adminlte.io/docs"
							class="nav-link"> <i class="nav-icon fa fa-file"></i>
								<p>Documentation</p>
						</a></li>
						<li class="nav-header">LABELS</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fa fa-circle-o text-danger"></i>
								<p class="text">Important</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fa fa-circle-o text-warning"></i>
								<p>Warning</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fa fa-circle-o text-info"></i>
								<p>Informational</p>
						</a></li>
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
							<h1>Widgets</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Widgets</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<h5 class="mb-2">Info Box</h5>
					<div class="row">
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box">
								<span class="info-box-icon bg-info"><i
									class="fa fa-envelope-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Messages</span> <span
										class="info-box-number">1,410</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box">
								<span class="info-box-icon bg-success"><i
									class="fa fa-flag-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Bookmarks</span> <span
										class="info-box-number">410</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box">
								<span class="info-box-icon bg-warning"><i
									class="fa fa-files-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Uploads</span> <span
										class="info-box-number">13,648</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box">
								<span class="info-box-icon bg-danger"><i
									class="fa fa-star-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Likes</span> <span
										class="info-box-number">93,139</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->
					<h5 class="mt-4 mb-2">
						Info Box With
						<code>bg-*</code>
					</h5>
					<div class="row">
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-info">
								<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Bookmarks</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-success">
								<span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Likes</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-warning">
								<span class="info-box-icon"><i class="fa fa-calendar"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Events</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-danger">
								<span class="info-box-icon"><i class="fa fa-comments-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Comments</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->
					<h5 class="mt-4 mb-2">
						Info Box With
						<code>bg-*-gradient</code>
					</h5>
					<div class="row">
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-info-gradient">
								<span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Bookmarks</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-success-gradient">
								<span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Likes</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-warning-gradient">
								<span class="info-box-icon"><i class="fa fa-calendar"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Events</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<div class="info-box bg-danger-gradient">
								<span class="info-box-icon"><i class="fa fa-comments-o"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Comments</span> <span
										class="info-box-number">41,410</span>

									<div class="progress">
										<div class="progress-bar" style="width: 70%"></div>
									</div>
									<span class="progress-description"> 70% Increase in 30
										Days </span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->

					<!-- Small Box (Stat card) -->
					<h5 class="mb-2 mt-4">Small Box</h5>
					<div class="row">
						<div class="col-lg-3 col-6">
							<!-- small card -->
							<div class="small-box bg-info">
								<div class="inner">
									<h3>150</h3>

									<p>New Orders</p>
								</div>
								<div class="icon">
									<i class="fa fa-shopping-cart"></i>
								</div>
								<a href="#" class="small-box-footer"> More info <i
									class="fa fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small card -->
							<div class="small-box bg-success">
								<div class="inner">
									<h3>
										53<sup style="font-size: 20px">%</sup>
									</h3>

									<p>Bounce Rate</p>
								</div>
								<div class="icon">
									<i class="ion ion-stats-bars"></i>
								</div>
								<a href="#" class="small-box-footer"> More info <i
									class="fa fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small card -->
							<div class="small-box bg-warning">
								<div class="inner">
									<h3>44</h3>

									<p>User Registrations</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="#" class="small-box-footer"> More info <i
									class="fa fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small card -->
							<div class="small-box bg-danger">
								<div class="inner">
									<h3>65</h3>

									<p>Unique Visitors</p>
								</div>
								<div class="icon">
									<i class="ion ion-pie-graph"></i>
								</div>
								<a href="#" class="small-box-footer"> More info <i
									class="fa fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->
					<h4 class="mb-2 mt-4">Cards</h4>
					<div class="row">
						<div class="col-md-3">
							<div class="card card-default collapsed-card">
								<div class="card-header">
									<h3 class="card-title">Expandable</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card card-success">
								<div class="card-header">
									<h3 class="card-title">Removable</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card card-warning">
								<div class="card-header">
									<h3 class="card-title">Collapsable</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card card-danger">
								<div class="card-header">
									<h3 class="card-title">Loading state</h3>
								</div>
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
								<!-- Loading (remove the following to stop the loading)-->
								<div class="overlay">
									<i class="fa fa-refresh fa-spin"></i>
								</div>
								<!-- end loading -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->

					<div class="row">
						<div class="col-md-3">
							<div class="card card-info collapsed-card card-outline">
								<div class="card-header">
									<h3 class="card-title">Expandable</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card card-success card-outline">
								<div class="card-header">
									<h3 class="card-title">Removable</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card card-warning card-outline">
								<div class="card-header">
									<h3 class="card-title">Warning Outline</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card card-danger card-outline">
								<div class="card-header">
									<h3 class="card-title">Danger Outline</h3>
								</div>
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->

					<div class="row">
						<div class="col-md-3">
							<div class="card bg-primary-gradient">
								<div class="card-header">
									<h3 class="card-title">Primary Gradient</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card bg-success-gradient">
								<div class="card-header">
									<h3 class="card-title">Success Gradient</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card bg-warning-gradient">
								<div class="card-header">
									<h3 class="card-title">Warning Gradient</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-3">
							<div class="card bg-danger-gradient">
								<div class="card-header">
									<h3 class="card-title">Danger Gradient</h3>
								</div>
								<div class="card-body">The body of the card</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- =========================================================== -->

					<!-- Direct Chat -->
					<h4 class="mt-4 mb-2">Direct Chat</h4>
					<div class="row">
						<div class="col-md-3">
							<!-- DIRECT CHAT PRIMARY -->
							<div
								class="card card-primary card-outline direct-chat direct-chat-primary">
								<div class="card-header">
									<h3 class="card-title">Direct Chat</h3>

									<div class="card-tools">
										<span data-toggle="tooltip" title="3 New Messages"
											class="badge bg-primary">3</span>
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-toggle="tooltip" title="Contacts"
											data-widget="chat-pane-toggle">
											<i class="fa fa-comments"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-left">Alexander
													Pierce</span> <span class="direct-chat-timestamp float-right">23
													Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user1-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really
												for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-right">Sarah
													Bullock</span> <span class="direct-chat-timestamp float-left">23
													Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user3-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->
									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li><a href="#"> <img class="contacts-list-img"
													src="../dist/img/user1-128x128.jpg">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Count Dracula <small
															class="contacts-list-date float-right">2/28/2015</small>
														</span> <span class="contacts-list-msg">How have you been?
															I was...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contatcts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="submit" class="btn btn-primary">Send</button>
											</span>
										</div>
									</form>
								</div>
								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->
						</div>
						<!-- /.col -->

						<div class="col-md-3">
							<!-- DIRECT CHAT SUCCESS -->
							<div
								class="card card-success card-outline direct-chat direct-chat-success">
								<div class="card-header">
									<h3 class="card-title">Direct Chat</h3>

									<div class="card-tools">
										<span data-toggle="tooltip" title="3 New Messages"
											class="badge bg-success">3</span>
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-toggle="tooltip" title="Contacts"
											data-widget="chat-pane-toggle">
											<i class="fa fa-comments"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-left">Alexander
													Pierce</span> <span class="direct-chat-timestamp float-right">23
													Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user1-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really
												for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-right">Sarah
													Bullock</span> <span class="direct-chat-timestamp float-left">23
													Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user3-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->
									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li><a href="#"> <img class="contacts-list-img"
													src="../dist/img/user1-128x128.jpg">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Count Dracula <small
															class="contacts-list-date float-right">2/28/2015</small>
														</span> <span class="contacts-list-msg">How have you been?
															I was...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contatcts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="submit" class="btn btn-success">Send</button>
											</span>
										</div>
									</form>
								</div>
								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->
						</div>
						<!-- /.col -->

						<div class="col-md-3">
							<!-- DIRECT CHAT WARNING -->
							<div class="card card-warning direct-chat direct-chat-warning">
								<div class="card-header">
									<h3 class="card-title">Direct Chat</h3>

									<div class="card-tools">
										<span data-toggle="tooltip" title="3 New Messages"
											class="badge bg-danger">3</span>
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-toggle="tooltip" title="Contacts"
											data-widget="chat-pane-toggle">
											<i class="fa fa-comments"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-left">Alexander
													Pierce</span> <span class="direct-chat-timestamp float-right">23
													Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user1-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really
												for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-right">Sarah
													Bullock</span> <span class="direct-chat-timestamp float-left">23
													Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user3-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->
									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li><a href="#"> <img class="contacts-list-img"
													src="../dist/img/user1-128x128.jpg">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Count Dracula <small
															class="contacts-list-date float-right">2/28/2015</small>
														</span> <span class="contacts-list-msg">How have you been?
															I was...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contatcts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="submit" class="btn btn-warning">Send</button>
											</span>
										</div>
									</form>
								</div>
								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->
						</div>
						<!-- /.col -->

						<div class="col-md-3">
							<!-- DIRECT CHAT DANGER -->
							<div class="card card-danger direct-chat direct-chat-danger">
								<div class="card-header">
									<h3 class="card-title">Direct Chat</h3>

									<div class="card-tools">
										<span data-toggle="tooltip" title="3 New Messages"
											class="badge">3</span>
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-toggle="tooltip" title="Contacts"
											data-widget="chat-pane-toggle">
											<i class="fa fa-comments"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-left">Alexander
													Pierce</span> <span class="direct-chat-timestamp float-right">23
													Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user1-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really
												for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name float-right">Sarah
													Bullock</span> <span class="direct-chat-timestamp float-left">23
													Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="../dist/img/user3-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->
									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li><a href="#"> <img class="contacts-list-img"
													src="../dist/img/user1-128x128.jpg">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Count Dracula <small
															class="contacts-list-date float-right">2/28/2015</small>
														</span> <span class="contacts-list-msg">How have you been?
															I was...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contatcts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="submit" class="btn btn-danger">Send</button>
											</span>
										</div>
									</form>
								</div>
								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<h3 class="mt-4 mb-4">Social Widgets</h3>

					<div class="row">
						<div class="col-md-4">
							<!-- Widget: user widget style 2 -->
							<div class="card card-widget widget-user-2">
								<!-- Add the bg color to the header using any of the bg-* classes -->
								<div class="widget-user-header bg-warning">
									<div class="widget-user-image">
										<img class="img-circle elevation-2"
											src="../dist/img/user7-128x128.jpg" alt="User Avatar">
									</div>
									<!-- /.widget-user-image -->
									<h3 class="widget-user-username">Nadia Carmichael</h3>
									<h5 class="widget-user-desc">Lead Developer</h5>
								</div>
								<div class="card-footer p-0">
									<ul class="nav flex-column">
										<li class="nav-item"><a href="#" class="nav-link">
												Projects <span class="float-right badge bg-primary">31</span>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link">
												Tasks <span class="float-right badge bg-info">5</span>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link">
												Completed Projects <span
												class="float-right badge bg-success">12</span>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link">
												Followers <span class="float-right badge bg-danger">842</span>
										</a></li>
									</ul>
								</div>
							</div>
							<!-- /.widget-user -->
						</div>
						<!-- /.col -->
						<div class="col-md-4">
							<!-- Widget: user widget style 1 -->
							<div class="card card-widget widget-user">
								<!-- Add the bg color to the header using any of the bg-* classes -->
								<div class="widget-user-header bg-info-active">
									<h3 class="widget-user-username">Alexander Pierce</h3>
									<h5 class="widget-user-desc">Founder & CEO</h5>
								</div>
								<div class="widget-user-image">
									<img class="img-circle elevation-2"
										src="../dist/img/user1-128x128.jpg" alt="User Avatar">
								</div>
								<div class="card-footer">
									<div class="row">
										<div class="col-sm-4 border-right">
											<div class="description-block">
												<h5 class="description-header">3,200</h5>
												<span class="description-text">SALES</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-4 border-right">
											<div class="description-block">
												<h5 class="description-header">13,000</h5>
												<span class="description-text">FOLLOWERS</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-4">
											<div class="description-block">
												<h5 class="description-header">35</h5>
												<span class="description-text">PRODUCTS</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
							</div>
							<!-- /.widget-user -->
						</div>
						<!-- /.col -->
						<div class="col-md-4">
							<!-- Widget: user widget style 1 -->
							<div class="card card-widget widget-user">
								<!-- Add the bg color to the header using any of the bg-* classes -->
								<div class="widget-user-header text-white"
									style="background: url('../dist/img/photo1.png') center center;">
									<h3 class="widget-user-username">Elizabeth Pierce</h3>
									<h5 class="widget-user-desc">Web Designer</h5>
								</div>
								<div class="widget-user-image">
									<img class="img-circle" src="../dist/img/user3-128x128.jpg"
										alt="User Avatar">
								</div>
								<div class="card-footer">
									<div class="row">
										<div class="col-sm-4 border-right">
											<div class="description-block">
												<h5 class="description-header">3,200</h5>
												<span class="description-text">SALES</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-4 border-right">
											<div class="description-block">
												<h5 class="description-header">13,000</h5>
												<span class="description-text">FOLLOWERS</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-4">
											<div class="description-block">
												<h5 class="description-header">35</h5>
												<span class="description-text">PRODUCTS</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
							</div>
							<!-- /.widget-user -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<div class="row">
						<div class="col-md-6">
							<!-- Box Comment -->
							<div class="card card-widget">
								<div class="card-header">
									<div class="user-block">
										<img class="img-circle" src="../dist/img/user1-128x128.jpg"
											alt="User Image"> <span class="username"><a
											href="#">Jonathan Burke Jr.</a></span> <span class="description">Shared
											publicly - 7:30 PM Today</span>
									</div>
									<!-- /.user-block -->
									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-toggle="tooltip" title="Mark as read">
											<i class="fa fa-circle-o"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<img class="img-fluid pad" src="../dist/img/photo2.png"
										alt="Photo">

									<p>I took this photo this morning. What do you guys think?</p>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-share"></i> Share
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-thumbs-o-up"></i> Like
									</button>
									<span class="float-right text-muted">127 likes - 3
										comments</span>
								</div>
								<!-- /.card-body -->
								<div class="card-footer card-comments">
									<div class="card-comment">
										<!-- User image -->
										<img class="img-circle img-sm"
											src="../dist/img/user3-128x128.jpg" alt="User Image">

										<div class="comment-text">
											<span class="username"> Maria Gonzales <span
												class="text-muted float-right">8:03 PM Today</span>
											</span>
											<!-- /.username -->
											It is a long established fact that a reader will be
											distracted by the readable content of a page when looking at
											its layout.
										</div>
										<!-- /.comment-text -->
									</div>
									<!-- /.card-comment -->
									<div class="card-comment">
										<!-- User image -->
										<img class="img-circle img-sm"
											src="../dist/img/user4-128x128.jpg" alt="User Image">

										<div class="comment-text">
											<span class="username"> Luna Stark <span
												class="text-muted float-right">8:03 PM Today</span>
											</span>
											<!-- /.username -->
											It is a long established fact that a reader will be
											distracted by the readable content of a page when looking at
											its layout.
										</div>
										<!-- /.comment-text -->
									</div>
									<!-- /.card-comment -->
								</div>
								<!-- /.card-footer -->
								<div class="card-footer">
									<form action="#" method="post">
										<img class="img-fluid img-circle img-sm"
											src="../dist/img/user4-128x128.jpg" alt="Alt Text">
										<!-- .img-push is used to add margin to elements next to floating images -->
										<div class="img-push">
											<input type="text" class="form-control form-control-sm"
												placeholder="Press enter to post comment">
										</div>
									</form>
								</div>
								<!-- /.card-footer -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-6">
							<!-- Box Comment -->
							<div class="card card-widget">
								<div class="card-header">
									<div class="user-block">
										<img class="img-circle" src="../dist/img/user1-128x128.jpg"
											alt="User Image"> <span class="username"><a
											href="#">Jonathan Burke Jr.</a></span> <span class="description">Shared
											publicly - 7:30 PM Today</span>
									</div>
									<!-- /.user-block -->
									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-toggle="tooltip" title="Mark as read">
											<i class="fa fa-circle-o"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- post text -->
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.
										Separated they live in Bookmarksgrove right at</p>

									<p>the coast of the Semantics, a large language ocean. A
										small river named Duden flows by their place and supplies it
										with the necessary regelialia. It is a paradisematic country,
										in which roasted parts of sentences fly into your mouth.</p>

									<!-- Attachment -->
									<div class="attachment-block clearfix">
										<img class="attachment-img" src="../dist/img/photo1.png"
											alt="Attachment Image">

										<div class="attachment-pushed">
											<h4 class="attachment-heading">
												<a href="http://www.lipsum.com/">Lorem ipsum text
													generator</a>
											</h4>

											<div class="attachment-text">
												Description about the attachment can be placed here. Lorem
												Ipsum is simply dummy text of the printing and typesetting
												industry... <a href="#">more</a>
											</div>
											<!-- /.attachment-text -->
										</div>
										<!-- /.attachment-pushed -->
									</div>
									<!-- /.attachment-block -->

									<!-- Social sharing buttons -->
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-share"></i> Share
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-thumbs-o-up"></i> Like
									</button>
									<span class="float-right text-muted">45 likes - 2
										comments</span>
								</div>
								<!-- /.card-body -->
								<div class="card-footer card-comments">
									<div class="card-comment">
										<!-- User image -->
										<img class="img-circle img-sm"
											src="../dist/img/user3-128x128.jpg" alt="User Image">

										<div class="comment-text">
											<span class="username"> Maria Gonzales <span
												class="text-muted float-right">8:03 PM Today</span>
											</span>
											<!-- /.username -->
											It is a long established fact that a reader will be
											distracted by the readable content of a page when looking at
											its layout.
										</div>
										<!-- /.comment-text -->
									</div>
									<!-- /.card-comment -->
									<div class="card-comment">
										<!-- User image -->
										<img class="img-circle img-sm"
											src="../dist/img/user5-128x128.jpg" alt="User Image">

										<div class="comment-text">
											<span class="username"> Nora Havisham <span
												class="text-muted float-right">8:03 PM Today</span>
											</span>
											<!-- /.username -->
											The point of using Lorem Ipsum is that it has a more-or-less
											normal distribution of letters, as opposed to using 'Content
											here, content here', making it look like readable English.
										</div>
										<!-- /.comment-text -->
									</div>
									<!-- /.card-comment -->
								</div>
								<!-- /.card-footer -->
								<div class="card-footer">
									<form action="#" method="post">
										<img class="img-fluid img-circle img-sm"
											src="../dist/img/user4-128x128.jpg" alt="Alt Text">
										<!-- .img-push is used to add margin to elements next to floating images -->
										<div class="img-push">
											<input type="text" class="form-control form-control-sm"
												placeholder="Press enter to post comment">
										</div>
									</form>
								</div>
								<!-- /.card-footer -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.0.0-alpha
			</div>
			<strong>Copyright &copy; 2014-2018 <a
				href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
</body>
</html>