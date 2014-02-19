<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	
	<title>FLAT - UI Elements</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
	<!-- Notify -->
	<link rel="stylesheet" href="css/plugins/gritter/jquery.gritter.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">


	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	
	<!-- Nice Scroll -->
	<script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- imagesLoaded -->
	<script src="js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
	<!-- slimScroll -->
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Bootbox -->
	<script src="js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- Notify -->
	<script src="js/plugins/gritter/jquery.gritter.min.js"></script>

	<!-- Theme framework -->
	<script src="js/eakroko.min.js"></script>
	<!-- Theme scripts -->
	<script src="js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="js/demonstration.min.js"></script>

	<!--[if lte IE 9]>
		<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->
	
	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

</head>

<body>
	<div id="modal-1" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal header</h3>
		</div>
		<div class="modal-body">
			<p>One fine body…</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button class="btn btn-primary" data-dismiss="modal">Save changes</button>
		</div>
	</div>
	<div id="modal-2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal header</h3>
		</div>
		<div class="modal-body">
			<p>One fine body…</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button class="btn btn-primary" data-dismiss="modal">Save changes</button>
		</div>
	</div>
	<div id="modal-3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal header</h3>
		</div>
		<div class="modal-body">
			<p>One fine body…</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
			<button class="btn btn-primary" data-dismiss="modal">Yes</button>
		</div>
	</div>
	<div id="modal-4" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal header</h3>
		</div>
		<div class="modal-body">
			<p>One fine body…</p>
		</div>
		<div class="modal-footer">
			<button class="btn btn-primary" data-dismiss="modal">Ok</button>
		</div>
	</div>
	<div id="navigation">
		<div class="container-fluid">
			<a href="#" id="brand">FLAT</a>
			<a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation"><i class="icon-reorder"></i></a>
			<ul class='main-nav'>
				<li>
					<a href="index.html">
						<span>Dashboard</span>
					</a>
				</li>
				<li>
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Forms</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="forms-basic.html">Basic forms</a>
						</li>
						<li>
							<a href="forms-extended.html">Extended forms</a>
						</li>
						<li>
							<a href="forms-validation.html">Validation</a>
						</li>
						<li>
							<a href="forms-wizard.html">Wizard</a>
						</li>
					</ul>
				</li>
				<li class='active'>
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Components</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="components-timeline.html">Timeline</a>
						</li>
						<li>
							<a href="components-pagestatistics.html">Page statistics</a>
						</li>
						<li>
							<a href="components-sidebarwidgets.html">Sidebar widgets</a>
						</li>
						<li>
							<a href="components-messages.html">Messages &amp; Chat</a>
						</li>
						<li>
							<a href="components-gallery.html">Gallery &amp; Thumbs</a>
						</li>
						<li>
							<a href="components-tiles.html">Tiles</a>
						</li>
						<li>
							<a href="components-icons.html">Icons &amp; Buttons</a>
						</li>
						<li class='active'>
							<a href="components-elements.html">UI elements</a>
						</li>
						<li>
							<a href="components-typography.html">Typography</a>
						</li>
						<li>
							<a href="components-bootstrap.html">Bootstrap elements</a>
						</li>
						<li>
							<a href="components-grid.html">Grid</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Tables</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="tables-basic.html">Basic tables</a>
						</li>
						<li>
							<a href="tables-dynamic.html">Dynamic tables</a>
						</li>
						<li>
							<a href="tables-large.html">Large tables</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Plugins</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="plugins-charts.html">Charts</a>
						</li>
						<li>
							<a href="plugins-calendar.html">Calendar</a>
						</li>
						<li>
							<a href="plugins-filemanager.html">File manager</a>
						</li>
						<li>
							<a href="plugins-filetrees.html">File trees</a>
						</li>
						<li>
							<a href="plugins-elements.html">Editable elements</a>
						</li>
						<li>
							<a href="plugins-maps.html">Maps</a>
						</li>
						<li>
							<a href="plugins-dragdrop.html">Drag &amp; Drop widgets</a>
						</li>
						
					</ul>
				</li>
				<li>
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Pages</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="more-error.html">Error pages</a>
						</li>
						<li class='dropdown-submenu'>
							<a href="#" data-toggle="dropdown" class='dropdown-toggle'>Shop</a>
							<ul class="dropdown-menu">
								<li>
									<a href="more-shop-list.html">List view</a>
								</li>
								<li>
									<a href="more-shop-product.html">Product view</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="more-pricing.html">Pricing tables</a>
						</li>
						<li>
							<a href="more-faq.html">FAQ</a>
						</li>
						<li>
							<a href="more-invoice.html">Invoice</a>
						</li>
						<li>
							<a href="more-userprofile.html">User profile</a>
						</li>
						<li>
							<a href="more-searchresults.html">Search results</a>
						</li>
						<li>
							<a href="more-login.html">Login</a>
						</li>
						<li>
							<a href="more-locked.html">Lock screen</a>
						</li>
						<li>
							<a href="more-email.html">Email templates</a>
						</li>
						<li>
							<a href="more-blank.html">Blank page</a>
						</li>
						<li class='dropdown-submenu'>
							<a href="#" data-toggle="dropdown" class='dropdown-toggle'>Another submenu</a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">This is level 3</a>
								</li>
								<li>
									<a href="#">Another page here</a>
								</li>
								<li class='dropdown-submenu'>
									<a href="#" data-toggle="dropdown" class='dropdown-toggle'>Go to level 4</a>
									<ul class="dropdown-menu">
										<li>
											<a href="#">This is level 4</a>
										</li>
										<li>
											<a href="#">Unlimited levels</a>
										</li>
										<li>
											<a href="#">Easy to use</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Layouts</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="layouts-sidebar-hidden.html">Default hidden sidebar</a>
						</li>
						<li>
							<a href="layouts-color.html">Different default color</a>
						</li>
						<li>
							<a href="layouts-fixed.html">Fixed layout</a>
						</li>
						<li>
							<a href="layouts-fixed-topside.html">Fixed topbar and sidebar</a>
						</li>
						<li class='dropdown-submenu'>
							<a href="#">Mobile sidebar</a>
							<ul class="dropdown-menu">
								<li>
									<a href="layouts-mobile-slide.html">Slide</a>
								</li>
								<li>
									<a href="layouts-mobile-button.html">Button</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="layouts-footer.html">Footer</a>
						</li>
					</ul>
				</li>
			</ul>
			<div class="user">
				<ul class="icon-nav">
					<li class='dropdown'>
						<a href="#" class='dropdown-toggle' data-toggle="dropdown"><i class="icon-envelope-alt"></i><span class="label label-lightred">4</span></a>
						<ul class="dropdown-menu pull-right message-ul">
							<li>
								<a href="#">
									<img src="img/demo/user-1.jpg" alt="">
									<div class="details">
										<div class="name">Jane Doe</div>
										<div class="message">
											Lorem ipsum Commodo quis nisi ...
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="img/demo/user-2.jpg" alt="">
									<div class="details">
										<div class="name">John Doedoe</div>
										<div class="message">
											Ut ad laboris est anim ut ...
										</div>
									</div>
									<div class="count">
										<i class="icon-comment"></i>
										<span>3</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="img/demo/user-3.jpg" alt="">
									<div class="details">
										<div class="name">Bob Doe</div>
										<div class="message">
											Excepteur Duis magna dolor!
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="components-messages.html" class='more-messages'>Go to Message center <i class="icon-arrow-right"></i></a>
							</li>
						</ul>
					</li>
					
					<li class="dropdown sett">
						<a href="#" class='dropdown-toggle' data-toggle="dropdown"><i class="icon-cog"></i></a>
						<ul class="dropdown-menu pull-right theme-settings">
							<li>
								<span>Layout-width</span>
								<div class="version-toggle">
									<a href="#" class='set-fixed'>Fixed</a>
									<a href="#" class="active set-fluid">Fluid</a>
								</div>
							</li>
							<li>
								<span>Topbar</span>
								<div class="topbar-toggle">
									<a href="#" class='set-topbar-fixed'>Fixed</a>
									<a href="#" class="active set-topbar-default">Default</a>
								</div>
							</li>
							<li>
								<span>Sidebar</span>
								<div class="sidebar-toggle">
									<a href="#" class='set-sidebar-fixed'>Fixed</a>
									<a href="#" class="active set-sidebar-default">Default</a>
								</div>
							</li>
						</ul>
					</li>
					<li class='dropdown colo'>
						<a href="#" class='dropdown-toggle' data-toggle="dropdown"><i class="icon-tint"></i></a>
						<ul class="dropdown-menu pull-right theme-colors">
							<li class="subtitle">
								Predefined colors
							</li>
							<li>
								<span class='red'></span>
								<span class='orange'></span>
								<span class='green'></span>
								<span class="brown"></span>
								<span class="blue"></span>
								<span class='lime'></span>
								<span class="teal"></span>
								<span class="purple"></span>
								<span class="pink"></span>
								<span class="magenta"></span>
								<span class="grey"></span>
								<span class="darkblue"></span>
								<span class="lightred"></span>
								<span class="lightgrey"></span>
								<span class="satblue"></span>
								<span class="satgreen"></span>
							</li>
						</ul>
					</li>
					<li>
						<a href="more-locked.html" class='lock-screen' rel='tooltip' title="Lock screen" data-placement="bottom"><i class="icon-lock"></i></a>
					</li>
				</ul>
				<div class="dropdown">
					<a href="#" class='dropdown-toggle' data-toggle="dropdown">John Doe <img src="img/demo/user-avatar.jpg" alt=""></a>
					<ul class="dropdown-menu pull-right">
						<li>
							<a href="more-userprofile.html">Edit profile</a>
						</li>
						<li>
							<a href="#">Account settings</a>
						</li>
						<li>
							<a href="more-login.html">Sign out</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" id="content">
		<div id="left">
			<form action="search-results.html" method="GET" class='search-form'>
				<div class="search-pane">
					<input type="text" name="search" placeholder="Search here...">
					<button type="submit"><i class="icon-search"></i></button>
				</div>
			</form>
			<div class="subnav">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'><i class="icon-angle-down"></i><span>Content</span></a>
				</div>
				<ul class="subnav-menu">
					<li class='dropdown'>
						<a href="#" data-toggle="dropdown">Articles</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">Action #1</a>
							</li>
							<li>
								<a href="#">Antoher Link</a>
							</li>
							<li class='dropdown-submenu'>
								<a href="#" data-toggle="dropdown" class='dropdown-toggle'>Go to level 3</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">This is level 3</a>
									</li>
									<li>
										<a href="#">Unlimited levels</a>
									</li>
									<li>
										<a href="#">Easy to use</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">News</a>
					</li>
					<li>
						<a href="#">Pages</a>
					</li>
					<li>
						<a href="#">Comments</a>
					</li>
				</ul>
			</div>
			<div class="subnav">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'><i class="icon-angle-down"></i><span>Plugins</span></a>
				</div>
				<ul class="subnav-menu">
					<li>
						<a href="#">Cache manager</a>
					</li>
					<li class='dropdown'>
						<a href="#" data-toggle="dropdown">Import manager</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">Action #1</a>
							</li>
							<li>
								<a href="#">Antoher Link</a>
							</li>
							<li class='dropdown-submenu'>
								<a href="#" data-toggle="dropdown" class='dropdown-toggle'>Go to level 3</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">This is level 3</a>
									</li>
									<li>
										<a href="#">Unlimited levels</a>
									</li>
									<li>
										<a href="#">Easy to use</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">Contact form generator</a>
					</li>
					<li>
						<a href="#">SEO optimization</a>
					</li>
				</ul>
			</div>
			<div class="subnav">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'><i class="icon-angle-down"></i><span>Settings</span></a>
				</div>
				<ul class="subnav-menu">
					<li>
						<a href="#">Theme settings</a>
					</li>
					<li class='dropdown'>
						<a href="#" data-toggle="dropdown">Page settings</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">Action #1</a>
							</li>
							<li>
								<a href="#">Antoher Link</a>
							</li>
							<li class='dropdown-submenu'>
								<a href="#" data-toggle="dropdown" class='dropdown-toggle'>Go to level 3</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">This is level 3</a>
									</li>
									<li>
										<a href="#">Unlimited levels</a>
									</li>
									<li>
										<a href="#">Easy to use</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">Security settings</a>
					</li>
				</ul>
			</div>
			<div class="subnav subnav-hidden">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'><i class="icon-angle-right"></i><span>Default hidden</span></a>
				</div>
				<ul class="subnav-menu">
					<li>
						<a href="#">Menu</a>
					</li>
					<li class='dropdown'>
						<a href="#" data-toggle="dropdown">With submenu</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">Action #1</a>
							</li>
							<li>
								<a href="#">Antoher Link</a>
							</li>
							<li class='dropdown-submenu'>
								<a href="#" data-toggle="dropdown" class='dropdown-toggle'>More stuff</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">This is level 3</a>
									</li>
									<li>
										<a href="#">Easy to use</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">Security settings</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1>UI Elements</h1>
					</div>
					<div class="pull-right">
						<ul class="minitiles">
							<li class='grey'>
								<a href="#"><i class="icon-cogs"></i></a>
							</li>
							<li class='lightgrey'>
								<a href="#"><i class="icon-globe"></i></a>
							</li>
						</ul>
						<ul class="stats">
							<li class='satgreen'>
								<i class="icon-money"></i>
								<div class="details">
									<span class="big">$324,12</span>
									<span>Balance</span>
								</div>
							</li>
							<li class='lightred'>
								<i class="icon-calendar"></i>
								<div class="details">
									<span class="big">February 22, 2013</span>
									<span>Wednesday, 13:56</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="more-login.html">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="components-messages.html">Components</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="components-elements.html">UI elements</a>
						</li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Basic widget
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								Lorem ipsum velit dolor veniam occaecat do eiusmod velit cillum sit. Lorem ipsum laborum sed Duis in in dolor in exercitation irure. Lorem ipsum ad proident ut in mollit id ullamco Ut. Lorem ipsum magna eiusmod in anim deserunt adipisicing. Lorem ipsum ex dolore sint consectetur eu non mollit Ut dolore aliquip anim. Lorem ipsum labore ad Ut Duis Excepteur consequat non. Lorem ipsum ut quis ea dolore esse Duis cillum amet eu officia nostrud. Lorem ipsum dolor aliquip cillum ea ut id pariatur ad aute mollit in qui. Lorem ipsum magna ut consectetur incididunt sed consectetur ut ullamco dolore Excepteur deserunt. Lorem ipsum mollit ad Excepteur dolore non dolor occaecat reprehenderit eiusmod mollit ut Excepteur dolore dolor ex. Lorem ipsum nisi exercitation cillum velit tempor aliqua nisi non. Lorem ipsum enim magna adipisicing do adipisicing aliquip ex pariatur dolore proident fugiat mollit dolor. 
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box box-color">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Colored widget
								</h3>
								<ul class="tabs">
									<li class="active">
										<a href="#t7" data-toggle="tab">Sample tab #1</a>
									</li>
									<li>
										<a href="#t8" data-toggle="tab">Sample tab #2</a>
									</li>
									<li>
										<a href="#t9" data-toggle="tab">Third tab</a>
									</li>
								</ul>
							</div>
							<div class="box-content">
								<div class="tab-content">
									<div class="tab-pane active" id="t7">
										<h4>First tab</h4>
										Lorem ipsum anim ad culpa ex id anim Excepteur esse et do cillum dolor in dolore cillum. Lorem ipsum Ut est consequat pariatur sint ut incididunt nisi dolore occaecat. 
									</div>
									<div class="tab-pane" id="t8">
										<h4>Second tab</h4>
										Lorem ipsum ad proident amet anim voluptate ea. Lorem ipsum voluptate et ex esse mollit labore aliquip culpa dolore culpa anim cillum nulla ut sunt. Lorem ipsum veniam sunt voluptate elit minim incididunt occaecat aute ut ut sunt laboris. Lorem ipsum cupidatat labore elit sit in aliqua nostrud adipisicing minim et mollit sunt Ut cupidatat laboris. Lorem ipsum sunt ut labore nostrud ut aliqua dolor sint cupidatat sit Duis in culpa consectetur exercitation. Lorem ipsum sunt anim reprehenderit elit minim nulla ut. 
									</div>
									<div class="tab-pane" id="t9">
										<h4>Another tab</h4>
										Lorem ipsum commodo dolor sit in sint anim ad ut non et. Lorem ipsum cillum ex sunt ea irure Ut dolore in labore officia nostrud in anim culpa sit esse. Lorem ipsum elit Duis magna et voluptate Duis non pariatur esse laboris nisi laborum nulla. Lorem ipsum et tempor ea ad in id consectetur incididunt velit Excepteur officia. Lorem ipsum non consectetur Excepteur commodo aute anim sunt. Lorem ipsum pariatur esse nulla mollit Duis ex. Lorem ipsum cillum sit in ad consequat in ad enim incididunt ea laborum pariatur Excepteur aliqua nostrud ut. Lorem ipsum et magna laboris reprehenderit mollit reprehenderit aute Duis aliquip officia nulla. Lorem ipsum dolor Ut dolore in laborum elit dolore quis mollit ut sit Excepteur aute. Lorem ipsum quis et eiusmod in irure tempor ea labore cillum dolore labore eiusmod in occaecat qui ea. Lorem ipsum dolor fugiat deserunt incididunt eiusmod sunt magna reprehenderit sed enim ut cillum. Lorem ipsum irure pariatur exercitation sunt eiusmod dolore Ut do ut ut minim. Lorem ipsum do ea pariatur in anim deserunt Excepteur nisi culpa nisi aliquip culpa veniam ut non. 
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Bordered widget
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								Lorem ipsum velit dolor veniam occaecat do eiusmod velit cillum sit. Lorem ipsum laborum sed Duis in in dolor in exercitation irure. Lorem ipsum ad proident ut in mollit id ullamco Ut. Lorem ipsum magna eiusmod in anim deserunt adipisicing. Lorem ipsum ex dolore sint consectetur eu non mollit Ut dolore aliquip anim. Lorem ipsum labore ad Ut Duis Excepteur consequat non. Lorem ipsum ut quis ea dolore esse Duis cillum amet eu officia nostrud. Lorem ipsum dolor aliquip cillum ea ut id pariatur ad aute mollit in qui. Lorem ipsum magna ut consectetur incididunt sed consectetur ut ullamco dolore Excepteur deserunt. Lorem ipsum mollit ad Excepteur dolore non dolor occaecat reprehenderit eiusmod mollit ut Excepteur dolore dolor ex. Lorem ipsum nisi exercitation cillum velit tempor aliqua nisi non. Lorem ipsum enim magna adipisicing do adipisicing aliquip ex pariatur dolore proident fugiat mollit dolor. 
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box box-color box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Bordered &amp; Colored
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								Lorem ipsum ut in consectetur non sunt laboris minim tempor. Lorem ipsum Duis occaecat labore eu reprehenderit tempor nisi ea. Lorem ipsum adipisicing fugiat dolor voluptate aliquip id ut commodo magna dolor eu aute dolor in velit minim. Lorem ipsum mollit nostrud aliqua ut culpa dolor. Lorem ipsum commodo consectetur aute ullamco Duis nisi quis cupidatat. Lorem ipsum incididunt amet dolor voluptate est irure. Lorem ipsum magna amet anim aliquip aute sit voluptate minim enim magna. 
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Tabs
								</h3>
								<ul class="tabs">
									<li class="active">
										<a href="#t1" data-toggle="tab">Sample tab #1</a>
									</li>
									<li>
										<a href="#t2" data-toggle="tab">Sample tab #2</a>
									</li>
									<li>
										<a href="#t3" data-toggle="tab">Third tab</a>
									</li>
								</ul>
							</div>
							<div class="box-content">
								<div class="tab-content">
									<div class="tab-pane active" id="t1">
										<h4>First tab</h4>
										Lorem ipsum anim ad culpa ex id anim Excepteur esse et do cillum dolor in dolore cillum. Lorem ipsum Ut est consequat pariatur sint ut incididunt nisi dolore occaecat. 
									</div>
									<div class="tab-pane" id="t2">
										<h4>Second tab</h4>
										Lorem ipsum ad proident amet anim voluptate ea. Lorem ipsum voluptate et ex esse mollit labore aliquip culpa dolore culpa anim cillum nulla ut sunt. Lorem ipsum veniam sunt voluptate elit minim incididunt occaecat aute ut ut sunt laboris. Lorem ipsum cupidatat labore elit sit in aliqua nostrud adipisicing minim et mollit sunt Ut cupidatat laboris. Lorem ipsum sunt ut labore nostrud ut aliqua dolor sint cupidatat sit Duis in culpa consectetur exercitation. Lorem ipsum sunt anim reprehenderit elit minim nulla ut. 
									</div>
									<div class="tab-pane" id="t3">
										<h4>Another tab</h4>
										Lorem ipsum commodo dolor sit in sint anim ad ut non et. Lorem ipsum cillum ex sunt ea irure Ut dolore in labore officia nostrud in anim culpa sit esse. Lorem ipsum elit Duis magna et voluptate Duis non pariatur esse laboris nisi laborum nulla. Lorem ipsum et tempor ea ad in id consectetur incididunt velit Excepteur officia. Lorem ipsum non consectetur Excepteur commodo aute anim sunt. Lorem ipsum pariatur esse nulla mollit Duis ex. Lorem ipsum cillum sit in ad consequat in ad enim incididunt ea laborum pariatur Excepteur aliqua nostrud ut. Lorem ipsum et magna laboris reprehenderit mollit reprehenderit aute Duis aliquip officia nulla. Lorem ipsum dolor Ut dolore in laborum elit dolore quis mollit ut sit Excepteur aute. Lorem ipsum quis et eiusmod in irure tempor ea labore cillum dolore labore eiusmod in occaecat qui ea. Lorem ipsum dolor fugiat deserunt incididunt eiusmod sunt magna reprehenderit sed enim ut cillum. Lorem ipsum irure pariatur exercitation sunt eiusmod dolore Ut do ut ut minim. Lorem ipsum do ea pariatur in anim deserunt Excepteur nisi culpa nisi aliquip culpa veniam ut non. 
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box box-bordered box-color satblue">
							<div class="box-title">
								<h3><i class="icon-reorder"></i> Inline tabs</h3>
							</div>
							<div class="box-content nopadding">
								<ul class="tabs tabs-inline tabs-top">
									<li class='active'>
										<a href="#first11" data-toggle='tab'><i class="icon-inbox"></i> Inbox</a>
									</li>
									<li>
										<a href="#second22" data-toggle='tab'><i class="icon-share-alt"></i> Sent</a>
									</li>
									<li>
										<a href="#thirds3322" data-toggle='tab'><i class="icon-tag"></i> Important</a>
									</li>
									<li>
										<a href="#thirds33" data-toggle='tab'><i class="icon-trash"></i> Deleted</a>
									</li>
								</ul>
								<div class="tab-content padding tab-content-inline tab-content-bottom">
									<div class="tab-pane active" id="first11">
										Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum voluptatibus velit tempora numquam ipsa consequuntur esse et dolores aliquam sit sunt illo recusandae amet officiis dolorem debitis facilis! Quia dolore facere commodi numquam id quo aperiam inventore ratione reiciendis in unde sequi soluta. Obcaecati hic molestias deleniti aliquid optio fugiat repellat ab modi maiores minus eius quasi exercitationem officia reiciendis molestiae in dignissimos aspernatur eveniet voluptas consequuntur corporis. Magni itaque quod doloremque quas ad incidunt accusamus libero. Id praesentium veniam beatae est in excepturi atque consequuntur odio! Iste maiores exercitationem temporibus optio nostrum doloremque commodi vero accusamus dolorem aut voluptatem tempora maxime tenetur labore nesciunt quis fugit aliquid amet quasi expedita sed delectus voluptatum deserunt illum ad provident suscipit ex consequatur repellat similique qui nemo accusantium distinctio eveniet porro animi obcaecati voluptates quo consequuntur dolores saepe sit. Maxime numquam earum quidem iure a at temporibus minima natus? Impedit quo architecto nobis deserunt cupiditate ex provident consectetur! Obcaecati corrupti tempore adipisci voluptatum vitae perferendis quidem soluta a officia possimus modi nobis velit facere repellendus quia fugiat assumenda? Non magni at nesciunt officia perferendis fuga inventore quis veritatis voluptas laudantium aliquid iusto omnis eaque vitae commodi repellat voluptatibus cupiditate minus ut a.
									</div>
									<div class="tab-pane" id="second22">
										Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto vel labore sed odio laudantium in eum aliquid reiciendis blanditiis consequatur excepturi dicta quisquam soluta quis neque nostrum expedita temporibus illum aliquam voluptatibus a cumque sit nulla et consectetur ex maiores sequi culpa suscipit. Voluptate quae id consequatur consequuntur exercitationem cumque beatae obcaecati laudantium? Ea tenetur animi itaque eos aperiam molestiae reprehenderit eaque perferendis iusto beatae sapiente fuga ex ab fugit excepturi nesciunt blanditiis nostrum ipsa. Facere repellendus tempore deleniti neque nihil commodi nemo recusandae eveniet error eligendi tenetur quia et consequuntur cupiditate facilis esse aspernatur praesentium reprehenderit dolorum accusantium ipsum cum voluptas quisquam ea atque aliquid omnis at quam magnam rem cumque repellat maxime mollitia nulla architecto sequi saepe veritatis optio amet culpa consectetur ducimus sapiente doloribus corporis odit adipisci. Commodi ab culpa accusamus maxime amet dolore at necessitatibus fugit beatae id asperiores doloribus perspiciatis expedita quisquam itaque iusto eos ad quibusdam rem fuga ipsum ut quasi. Unde explicabo quae quod saepe maxime nulla ut. Aperiam possimus repellendus deleniti quasi quaerat aliquam veniam numquam doloremque sequi perspiciatis eligendi provident nam voluptates nihil earum saepe maxime mollitia maiores porro animi nulla odit sapiente atque totam illo! Accusantium quis corporis omnis et.
									</div>
									<div class="tab-pane" id="thirds3322">
										Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque ipsum ab odio accusamus similique dicta ipsam dolor magni nemo? Laudantium numquam consectetur maiores quaerat totam cupiditate error repellendus eos quibusdam dolore ipsum sequi illo blanditiis voluptatibus veniam dicta alias tempore consequuntur reprehenderit dignissimos iste sit perferendis possimus quisquam id voluptatum explicabo ut ad accusamus neque. Commodi ipsam quia aperiam nisi id unde sapiente magnam reiciendis voluptate placeat in optio consequuntur culpa magni repudiandae veniam aut. Magni sed asperiores omnis error nemo cum minima illum rerum assumenda ipsa excepturi odit laborum doloremque iure temporibus consectetur in culpa libero iusto repellendus. Culpa perspiciatis nesciunt explicabo officiis beatae ipsam qui odio architecto asperiores ad amet aspernatur veniam ex voluptates cumque expedita reiciendis nobis incidunt harum praesentium a totam ut cum corrupti quia rem provident delectus fuga deserunt itaque aut fugiat veritatis necessitatibus inventore nisi enim aliquid quibusdam! Nihil ratione laboriosam accusamus. Iure sapiente iste odit voluptas sit reiciendis. Cum voluptatibus quia cupiditate cumque eveniet mollitia unde adipisci vel itaque ipsa est iste ducimus sed consequuntur ratione eaque voluptates et odit quod nemo quis aut repudiandae ipsum nostrum deserunt! Excepturi cum eos ut labore debitis facilis ipsum! Fugit eos dicta amet neque qui deserunt!
									</div>
									<div class="tab-pane" id="thirds33">
										Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem tempore accusamus officiis et nihil qui ea voluptatem itaque enim obcaecati iure distinctio quam molestiae deleniti iste necessitatibus dolorem quos rerum inventore suscipit! Temporibus suscipit excepturi molestias harum tempora nihil sed placeat atque nobis a minima sit id deserunt expedita ex! Tempore incidunt animi iste vitae dignissimos adipisci nisi impedit doloribus blanditiis unde nobis totam laboriosam maxime in quam repudiandae eos atque illum. Eaque facilis voluptates architecto suscipit sed dolor possimus earum molestiae ratione porro necessitatibus nihil sint recusandae optio eligendi ipsum maiores cum impedit dolores soluta ullam similique quas quod assumenda laudantium unde excepturi sequi hic aperiam tenetur explicabo laboriosam maxime perspiciatis placeat commodi illo dolorem corporis tempora voluptatem culpa nobis veritatis consequatur veniam mollitia ex animi qui omnis dolore et quae. Natus itaque quisquam repellat enim accusamus vel deserunt veniam vitae earum nostrum nulla maxime quas ipsa cum rem ut fugiat repellendus quis voluptates eligendi voluptatibus animi obcaecati esse illo incidunt? Amet repudiandae ducimus vel sit neque magni optio eveniet ut eum adipisci incidunt laudantium consectetur debitis veniam tempore temporibus maiores inventore! Libero hic quisquam nihil pariatur perspiciatis beatae non at commodi sint dolore tempora corporis explicabo quam saepe? 
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-bordered">
							<div class="box-title">
								<ul class="tabs tabs-left">
									<li class="active">
										<a href="#t10" data-toggle="tab">Sample tab #1</a>
									</li>
									<li>
										<a href="#t11" data-toggle="tab">Sample tab #2</a>
									</li>
									<li>
										<a href="#t12" data-toggle="tab">Third tab</a>
									</li>
								</ul>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<div class="tab-content">
									<div class="tab-pane active" id="t10">
										<h4>You can also have tabs &amp; action buttons</h4>
										<p>
											Tabs on the left
										</p>
									</div>
									<div class="tab-pane" id="t11">
										<h4>Second tab</h4>
										Lorem ipsum ad proident amet anim voluptate ea. Lorem ipsum voluptate et ex esse mollit labore aliquip culpa dolore culpa anim cillum nulla ut sunt. Lorem ipsum veniam sunt voluptate elit minim incididunt occaecat aute ut ut sunt laboris. Lorem ipsum cupidatat labore elit sit in aliqua nostrud adipisicing minim et mollit sunt Ut cupidatat laboris. Lorem ipsum sunt ut labore nostrud ut aliqua dolor sint cupidatat sit Duis in culpa consectetur exercitation. Lorem ipsum sunt anim reprehenderit elit minim nulla ut. 
									</div>
									<div class="tab-pane" id="t12">
										<h4>Another tab</h4>
										Lorem ipsum commodo dolor sit in sint anim ad ut non et. Lorem ipsum cillum ex sunt ea irure Ut dolore in labore officia nostrud in anim culpa sit esse. Lorem ipsum elit Duis magna et voluptate Duis non pariatur esse laboris nisi laborum nulla. Lorem ipsum et tempor ea ad in id consectetur incididunt velit Excepteur officia. Lorem ipsum non consectetur Excepteur commodo aute anim sunt. Lorem ipsum pariatur esse nulla mollit Duis ex. Lorem ipsum cillum sit in ad consequat in ad enim incididunt ea laborum pariatur Excepteur aliqua nostrud ut. Lorem ipsum et magna laboris reprehenderit mollit reprehenderit aute Duis aliquip officia nulla. Lorem ipsum dolor Ut dolore in laborum elit dolore quis mollit ut sit Excepteur aute. Lorem ipsum quis et eiusmod in irure tempor ea labore cillum dolore labore eiusmod in occaecat qui ea. Lorem ipsum dolor fugiat deserunt incididunt eiusmod sunt magna reprehenderit sed enim ut cillum. Lorem ipsum irure pariatur exercitation sunt eiusmod dolore Ut do ut ut minim. Lorem ipsum do ea pariatur in anim deserunt Excepteur nisi culpa nisi aliquip culpa veniam ut non. 
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box box-bordered box-color lightgrey">
							<div class="box-title">
								<h3><i class="icon-reorder"></i> Left tabs</h3>
							</div>
							<div class="box-content nopadding">
								<div class="tabs-container">
									<ul class="tabs tabs-inline tabs-left">
										<li class='active'>
											<a href="#first" data-toggle='tab'><i class="icon-lock"></i> Security</a>
										</li>
										<li>
											<a href="#second" data-toggle='tab'><i class="icon-user"></i> Account</a>
										</li>
										<li>
											<a href="#thirds" data-toggle='tab'><i class="icon-twitter"></i> Social</a>
										</li>
									</ul>
								</div>
								<div class="tab-content padding tab-content-inline">
									<div class="tab-pane active" id="first">
										Lorem ipsum Proident do cupidatat exercitation amet velit dolor Ut reprehenderit magna. Lorem ipsum Aute cupidatat labore deserunt nisi irure aliquip. Lorem ipsum Magna aliqua Duis tempor in dolor culpa nulla. Lorem ipsum Aliqua eiusmod qui veniam officia voluptate sed esse sed. Lorem ipsum In ad dolore labore sed est dolor laboris tempor consequat. Lorem ipsum Ex aute dolor sunt cillum adipisicing in irure in. Lorem ipsum Do sunt esse eu esse exercitation est id non tempor Excepteur nisi. Lorem ipsum Magna labore officia ex in amet adipisicing sunt Excepteur esse irure cillum exercitation. Lorem ipsum Sunt eiusmod voluptate cupidatat Duis eu magna esse nisi. Lorem ipsum Cillum qui exercitation ea eu cillum commodo commodo non velit incididunt culpa elit. Lorem ipsum Est minim est sunt Duis tempor ut nulla. Lorem ipsum In ut elit minim cillum id dolor do Duis.
									</div>
									<div class="tab-pane" id="second">
										Lorem ipsum Proident do cupidatat exercitation amet velit dolor Ut reprehenderit magna. Lorem ipsum Elit fugiat aliqua in culpa Ut aliquip Duis id ea enim in velit. Lorem ipsum Dolore qui dolor id enim aliquip Ut occaecat proident occaecat dolore. Lorem ipsum Ut veniam tempor eu dolor dolore pariatur consectetur ea elit. Lorem ipsum In dolore anim aliqua nulla ullamco sunt. Lorem ipsum Ex nulla sit esse tempor Excepteur eiusmod labore occaecat sint. Lorem ipsum Laboris ullamco Excepteur nulla occaecat occaecat amet mollit irure esse. Lorem ipsum Fugiat in irure aliqua officia nisi eiusmod aute officia. Lorem ipsum Incididunt consequat nulla in eu aute fugiat in anim enim proident do. Lorem ipsum In fugiat in commodo id aliquip in. Lorem ipsum Sit commodo in qui amet sit adipisicing incididunt dolor. Lorem ipsum Exercitation esse fugiat do enim enim esse laboris minim. Lorem ipsum Ex eiusmod quis do laborum sunt officia ullamco veniam veniam sunt ex. Lorem ipsum Anim dolore quis cillum magna eu magna consectetur laborum magna ut do. Lorem ipsum Excepteur laboris incididunt sed in dolor occaecat ad anim officia velit nulla. Lorem ipsum Dolore eiusmod non sit amet non tempor consequat. Lorem ipsum Do commodo aute quis reprehenderit reprehenderit tempor reprehenderit sint. Lorem ipsum Amet voluptate incididunt ex dolore cupidatat ut.
									</div>
									<div class="tab-pane" id="thirds">
										Lorem ipsum Officia quis sint sit sit tempor proident est enim exercitation nostrud do pariatur. Lorem ipsum Veniam aute Duis eu fugiat voluptate ut sed aliquip sunt Duis in cupidatat. Lorem ipsum Ut Excepteur exercitation do quis ut esse ut in dolor in. Lorem ipsum Cupidatat anim quis magna esse consequat est dolor sunt quis ex. Lorem ipsum Mollit sint sunt tempor culpa est eiusmod commodo officia est tempor mollit. Lorem ipsum Enim Duis cillum cupidatat eu cupidatat eiusmod ullamco. Lorem ipsum Sed dolor cillum non in minim et consequat incididunt ut minim nulla consectetur. Lorem ipsum Deserunt consectetur sint est aute id exercitation dolor ad nulla. Lorem ipsum Dolore velit Duis voluptate dolore consequat dolor Ut.
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-color green box-bordered">
							<div class="box-title">
								<h3>
									<i class="icon-tint"></i>
									Specific color
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								You can set the box to a specific color!
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Accordion
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<div class="accordion" id="accordion2">
									<div class="accordion-group">
										<div class="accordion-heading">
											<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
												Collapsible Group Item #1
											</a>
										</div>
										<div id="collapseOne" class="accordion-body collapse in">
											<div class="accordion-inner">
												Anim pariatur cliche...Lorem ipsum dolore dolor occaecat dolore elit deserunt incididunt ex sed nostrud aute aliquip ut elit sed nisi. 
											</div>
										</div>
									</div>
									<div class="accordion-group">
										<div class="accordion-heading">
											<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
												Collapsible Group Item #2
											</a>
										</div>
										<div id="collapseTwo" class="accordion-body collapse">
											<div class="accordion-inner">
												Anim pariatur cliche...Lorem ipsum Duis occaecat Excepteur est magna tempor ex ea enim sunt mollit proident. Lorem ipsum sed laboris ut adipisicing ut et aute occaecat aute enim occaecat. 
											</div>
										</div>
									</div>
									<div class="accordion-group">
										<div class="accordion-heading">
											<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
												Collapsible Group Item #3
											</a>
										</div>
										<div id="collapseThree" class="accordion-body collapse">
											<div class="accordion-inner">
												Anim pariatur cliche...Lorem ipsum do culpa adipisicing quis non nisi ullamco. Lorem ipsum velit dolore qui Excepteur fugiat et dolor proident reprehenderit magna aliqua enim consectetur nisi. Lorem ipsum sit laborum est magna veniam ex ut velit do aliqua amet dolore enim minim eu. Lorem ipsum adipisicing officia occaecat deserunt enim minim veniam sint amet sed consectetur nisi quis. 
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-color box-bordered magenta">
							<div class="box-title">
								<h3>
									<i class="icon-comment"></i>
									Tooltips
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<p>
									<h4>Tooltips</h4>
									<a href="#" class="btn" rel="tooltip" title="Default Tooltip">Default tooltip</a>
									<a href="#" class="btn" rel="tooltip" title="Right Tooltip" data-placement="right">Right tooltip</a>
									<a href="#" class="btn" rel="tooltip" title="Left Tooltip" data-placement="left">Left tooltip</a>
									<a href="#" class="btn" rel="tooltip" title="Bottom Tooltip" data-placement="bottom">Bottom tooltip</a>
								</p>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box box-color box-bordered lime">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Modals
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<p>
									<h4>Modals</h4>
									<a href="#modal-1" role="button" class="btn" data-toggle="modal">Basic modal</a>
									<a href="#modal-2" role="button" class="btn" data-toggle="modal">Modal with animation</a>
									<a href="#modal-4" role="button" class="btn" data-toggle="modal">Alert</a>
									<a href="#modal-3" role="button" class="btn" data-toggle="modal">Confirm</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="box box-color box-bordered orange">
							<div class="box-title">
								<h3>
									<i class="icon-comment-alt"></i>
									popovers
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<p>
									<h4>Popover</h4>
									<a href="#" class="btn" rel="popover" data-trigger="hover" title="Default popover" data-content="Lorem ipsum et dolor aute deserunt nisi do. Lorem ipsum irure aute officia id pariatur ex adipisicing deserunt velit consequat cupidatat adipisicing commodo. Lorem ipsum ad fugiat velit elit et non id. ">Default popover</a>
									<a href="#" class="btn" rel="popover" data-trigger="hover" title="Top popover" data-placement="top" data-content="Lorem ipsum et dolor aute deserunt nisi do. Lorem ipsum irure aute officia id pariatur ex adipisicing deserunt velit consequat cupidatat adipisicing commodo. Lorem ipsum ad fugiat velit elit et non id. ">Top popover</a>
									<a href="#" class="btn" rel="popover" data-trigger="hover" title="Left popover" data-placement="left" data-content="Lorem ipsum et dolor aute deserunt nisi do. Lorem ipsum irure aute officia id pariatur ex adipisicing deserunt velit consequat cupidatat adipisicing commodo. Lorem ipsum ad fugiat velit elit et non id. ">Left popover</a>
									<a href="#" class="btn" rel="popover" data-trigger="hover" title="Bottom popover" data-placement="bottom" data-content="Lorem ipsum et dolor aute deserunt nisi do. Lorem ipsum irure aute officia id pariatur ex adipisicing deserunt velit consequat cupidatat adipisicing commodo. Lorem ipsum ad fugiat velit elit et non id. ">Bottom popover</a>
									<a href="#" class="btn" rel="popover" title="Hover popover" data-placement="top" data-content="Lorem ipsum et dolor aute deserunt nisi do. Lorem ipsum irure aute officia id pariatur ex adipisicing deserunt velit consequat cupidatat adipisicing commodo. Lorem ipsum ad fugiat velit elit et non id. ">Click popover</a>
								</p>
							</div>
						</div>
					</div>
					<div class="span6">
						<div class="box box-color box-bordered red">
							<div class="box-title">
								<h3>
									<i class="icon-bell"></i>
									Notifications
								</h3>
								<div class="actions">
									<a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
									<a href="#" class="btn btn-mini content-remove"><i class="icon-remove"></i></a>
									<a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
								</div>
							</div>
							<div class="box-content">
								<p>
									<h4>Notifications</h4>
									<code>pure HTML (<strong>NO</strong> javascript needed!)</code>
								</p>
								<p><a href="#modal-1" role="button" class="btn notify" data-notify-title="Success!" data-notify-message="The user has been successfully edited.">Basic notification</a>
									<a href="#modal-1" role="button" class="btn notify" data-notify-time="1000" data-notify-title="Success!" data-notify-message="The user has been successfully edited.">Timed fade notification (1second)</a>
									<a href="#modal-1" role="button" class="btn notify" data-notify-title="WARNING!" data-notify-message="Please refresh the cache!" data-notify-sticky="true">Sticky notification</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div></div>
			
		</body>

		</html>

