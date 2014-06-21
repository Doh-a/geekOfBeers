<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Basic Page Needs
		================================================== -->
		<meta charset="utf-8" />
		<title>
			@section('title')
				Geek of beers
			@show
		</title>
		<meta name="keywords" content="your, awesome, keywords, here" />
		<meta name="author" content="Jon Doe" />
		<meta name="description" content="Lorem ipsum dolor sit amet, nihil fabulas et sea, nam posse menandri scripserit no, mei." />

		<!-- Mobile Specific Metas
		================================================== -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- CSS
		================================================== -->
		<link href="{{{ asset('assets/css/bootstrap.css') }}}" rel="stylesheet">

		<link href="{{{ asset('assets/css/geekOfBeers.css') }}}" rel="stylesheet">


		<link href="{{{ asset('assets/css/bootstrap-responsive.css') }}}" rel="stylesheet">

		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<!-- Favicons
		================================================== -->
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{{ asset('assets/ico/apple-touch-icon-144-precomposed.png') }}}">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{{ asset('assets/ico/apple-touch-icon-114-precomposed.png') }}}">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{{ asset('assets/ico/apple-touch-icon-72-precomposed.png') }}}">
		<link rel="apple-touch-icon-precomposed" href="{{{ asset('assets/ico/apple-touch-icon-57-precomposed.png') }}}">
		<link rel="shortcut icon" href="{{{ asset('assets/ico/favicon.png') }}}">
	</head>

	<body>
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-inner">
				<div class="container">
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
					</div>

					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav pull-left">
							<li {{{ (Request::is('/') ? 'class="active"' : '') }}}><a href="{{{ URL::to('') }}}">Geek of beers</a></li>
						</ul>
						
						<ul class="nav navbar-nav">
							<li {{{ (Request::is('/') ? 'class="active"' : '') }}}><a href="{{{ URL::to('') }}}">Bi&egrave;res</a></li>
							<li {{{ (Request::is('/') ? 'class="active"' : '') }}}><a href="{{{ URL::to('brasseries') }}}">Brasseries</a></li>
							<li {{{ (Request::is('/') ? 'class="active"' : '') }}}><a href="{{{ URL::to('add') }}}">Ajouter</a></li>
							@if (Auth::check())
							<li {{{ (Request::is('/') ? 'class="active"' : '') }}}><a href="{{{ URL::to('') }}}">Suggestions</a></li>
							<li {{{ (Request::is('/') ? 'class="active"' : '') }}}><a href="{{{ URL::to('') }}}">Amis</a></li>
							@endif
						</ul>

						<ul class="nav navbar-nav pull-right">
							@if (Auth::check())
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ Auth::user()->fullName() }} <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li {{{ (Request::is('account') ? 'class="active"' : '') }}}><a href="{{{ URL::to('account') }}}">Account</a></li>
									<li><a href="{{{ URL::to('account/logout') }}}">Logout</a></li>
								</ul>
							</li>
							@else
							<li {{{ (Request::is('account/login') ? 'class="active"' : '') }}}><a href="{{{ URL::to('account/login') }}}">Login</a></li>
							<li {{{ (Request::is('account/register') ? 'class="active"' : '') }}}><a href="{{{ URL::to('account/register') }}}">Register</a></li>
							@endif
							<form class="navbar-search pull-right" action=""><input type="text" class="search-query span2" placeholder="Search"></form>
						</ul>
					</div>
					<!-- ./ nav-collapse -->
				</div>
			</div>
		</div>
		<!-- ./ navbar -->

		<!-- Container -->
		<div class="container">
			<!-- Notifications -->
			@include('notifications')
			<!-- ./ notifications -->
			
			<!-- User Context -->
			<div id="column_user_context">
				@yield('user-context')
			</div>
			
			<div id="column_more_content">
				@yield('more-content')
			</div>
			
			<!-- Content -->
			<div id="column_content">
				@yield('content')
			</div>
			<!-- ./ content -->
		</div>
		<!-- ./ container -->

		<!-- Javascripts
		================================================== -->
		<script src="{{{ asset('assets/js/jquery.v1.8.3.min.js') }}}"></script>
		<script src="{{{ asset('assets/js/bootstrap/bootstrap.min.js') }}}"></script>
		
		@yield('footer-scripts')
	</body>
</html>
