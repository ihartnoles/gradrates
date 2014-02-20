<cfinclude template="layout/header.cfm" />


<cfquery name="getColleges" datasource="#application.dsn#">
	select distinct course_college, course_dept
	from courses
	order by course_college, course_dept
</cfquery>


<body class="theme-darkblue" data-theme="theme-darkblue">
	<cfoutput>
		<cfinclude template="dash_navigation.cfm">
	</cfoutput>



	<div class="container-fluid">
					<!--
					<div class="row-fluid">
						<div class="span12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="icon-reorder"></i>
										Admin Panel
									</h3>
								</div>
								<div class="box-content">
									
								</div>
							</div>
						</div>
					</div>
					-->
	
			<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Colleges
								</h3>
							</div>
							<div class="box-content">
								
								
								<div class="search-results">
									<ul>

										<cfoutput query="getColleges"  group="course_college">
										<li>
											<div class="search-info">
												<div class="span12">
													<h4>#getColleges.course_college#</h4>
												</div>
												<cfoutput group="course_dept">
													<div class="span3">
													<a href="facultylist.cfm?course_dept=#urlencodedformat(getColleges.course_dept)#">#getColleges.course_dept#</a>
													</div>
												</cfoutput>
											</div>
										</li>
										</cfoutput>

									
										
									</ul>
								</div>
								
								<!---
								<cfoutput query="getColleges">
									<div class ="span3">
										<div class="well sidebar-nav" style="background-color:##fcf8e3; margin:5px;">
							              <h5>#getColleges.course_college#</h5>
							              <br><div class="btn" onclick="window.location.href='/newhires/departments?school_id=1'">View departments</div><p></p>
							            </div>
						            </div>
								</cfoutput>
								--->

							</div>

						</div>
					</div>
				</div>
	</div><!-- end of container-fluid -->
	
</body>



</html>