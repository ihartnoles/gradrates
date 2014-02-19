<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	
	<title>Comments</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- icheck -->
	<link rel="stylesheet" href="css/plugins/icheck/all.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	
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


<cfquery name="getcomment" datasource="#application.dsn#">
	select id, comments, created_by, created_on
	from comments
	where student_course_id = <cfqueryparam value="#url.student_course_id#" CFSQLType="cf_sql_integer" />
</cfquery>


<div class="row-fluid">
		<div class="span12">
			<div class="box">
				<div class="box-content">
				
				<cfif getcomment.recordcount >
					<h3>Comments</h3>
					<cfoutput query="getcomment">
						<div class="row-fluid">
								<hr>
								<b>#getcomment.comments#</b><br>
								<br> - <i>#getcomment.created_by# on #DateFormat(getcomment.created_on, 'mm/dd/yyyy')# @ #TimeFormat(getcomment.created_on, 'hh:mm tt')#</i> <hr>
						</div>
					</cfoutput>
				<cfelse>
					<div class="row-fluid">
							<h3>Sorry! No comments are available.</h3>
					</div>
				</cfif>
				
				<br>

				<button class="btn btn-primary btn-darkblue close-button" data-dismiss="modal">Close This Window</button>
			</div>
		</div>
	</div>
</div>



</body>

<script type="text/javascript">
  $(function () {
		$(".close-button").click(function(e) {
			 window.close();
		});
    });
</script>


</html>
