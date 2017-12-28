<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Tint | Dashboard</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
  	folder instead of downloading all of them to reduce the load. -->
  	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/css/skins/_all-skins.min.css">
  	<!-- Morris chart -->
  	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/morris.js/morris.css">
  	<!-- jvectormap -->
  	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/jvectormap/jquery-jvectormap.css">
  	<!-- Date Picker -->
  	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  	<!-- Daterange picker -->
  	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  	<!-- bootstrap wysihtml5 - text editor -->
  	<link rel="stylesheet" href="<?php echo e(Config::$baseurl); ?>resources/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Google Font -->

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="index2.html" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>T</b>int</span>
				<!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>T</b>int</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
					<span class="sr-only">Toggle navigation</span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						
						<!-- Notifications: style can be found in dropdown.less -->
						
						<!-- Tasks: style can be found in dropdown.less -->
						<li class="dropdown tasks-menu" style="display: none;">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-flag-o"></i>
								<span class="label label-danger">9</span>
							</a>
							<ul class="dropdown-menu">
								<li class="header">You have 9 tasks</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li><!-- Task item -->
											<a href="#">
												<h3>
													Design some buttons
													<small class="pull-right">20%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
													aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">20% Complete</span>
												</div>
											</div>
										</a>
									</li>
									<!-- end task item -->
									<li><!-- Task item -->
										<a href="#">
											<h3>
												Create a nice theme
												<small class="pull-right">40%</small>
											</h3>
											<div class="progress xs">
												<div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
												aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">40% Complete</span>
											</div>
										</div>
									</a>
								</li>
								<!-- end task item -->
								<li><!-- Task item -->
									<a href="#">
										<h3>
											Some task I need to do
											<small class="pull-right">60%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">60% Complete</span>
										</div>
									</div>
								</a>
							</li>
							<!-- end task item -->
							<li><!-- Task item -->
								<a href="#">
									<h3>
										Make beautiful transitions
										<small class="pull-right">80%</small>
									</h3>
									<div class="progress xs">
										<div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
										<span class="sr-only">80% Complete</span>
									</div>
								</div>
							</a>
						</li>
						<!-- end task item -->
					</ul>
				</li>
				<li class="footer">
					<a href="#">View all tasks</a>
				</li>
			</ul>
		</li>
		<!-- User Account: style can be found in dropdown.less -->
		<li class="dropdown user user-menu">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<img src="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
				<span class="hidden-xs"><?php echo e($_SESSION['name']); ?></span>
			</a>
			<ul class="dropdown-menu">
				<!-- User image -->
				<li class="user-header">
					<img src="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

					
					<p id="tk-panel-profile">
						<?php echo e($_SESSION['name']); ?> - <?php echo e($_SESSION['username']); ?>

						
					</p>
				</li>
				
				<!-- Menu Footer-->
				<li class="user-footer">
					<div class="pull-left">
						<a href="#" class="btn btn-default btn-flat">Profile</a>
					</div>
					<div class="pull-right">
						<a href="<?php echo e(Config::$baseurl); ?>index.php?controller=login&action=logout" class="btn btn-default btn-flat">Sign out</a>
					</div>
				</li>
			</ul>
		</li>
		
         
    </ul>
</div>
</nav>
</header>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p><?php echo e($_SESSION['name']); ?></p>
				
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Search...">
				<span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			<li class="active treeview">
				<a href="#">
					<i class="fa fa-dashboard"></i> <span>Dashboard</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li><a href="<?php echo e(Config::$baseurl); ?>/index.php?controller=category&action=index"><i class="fa fa-circle-o"></i> Category</a></li>
					<li><a href="<?php echo e(Config::$baseurl); ?>/index.php?controller=product&action=index"><i class="fa fa-circle-o"></i> Product</a></li>
				</ul>
			</li>
			
			
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>

<?php echo $__env->yieldContent('content'); ?>


<!-- Control Sidebar -->
 
<!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  	immediately after the control sidebar -->
  	<div class="control-sidebar-bg"></div>
  	<!-- /.content-wrapper -->
  	<footer class="main-footer">
  		<div class="pull-right hidden-xs">
  			<b>Version</b> 2.4.0
  		</div>
  		<strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
  		reserved.
  	</footer>


  </div>
  <!-- ./wrapper -->

  <!-- jQuery 3 -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/jquery-ui/jquery-ui.min.js"></script>
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <script>
  	$.widget.bridge('uibutton', $.ui.button);
  </script>
  <!-- Bootstrap 3.3.7 -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- Morris.js charts -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/raphael/raphael.min.js"></script>
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/morris.js/morris.min.js"></script>
  <!-- Sparkline -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
  <!-- jvectormap -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
  <!-- jQuery Knob Chart -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
  <!-- daterangepicker -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/moment/min/moment.min.js"></script>
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- datepicker -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <!-- Bootstrap WYSIHTML5 -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
  <!-- Slimscroll -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
  <!-- FastClick -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/bower_components/fastclick/lib/fastclick.js"></script>
  <!-- AdminLTE App -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/js/adminlte.min.js"></script>
  <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/js/pages/dashboard.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="<?php echo e(Config::$baseurl); ?>resources/adminlte/dist/js/demo.js"></script>
</body>
</html>
