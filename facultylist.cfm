<cfinclude template="layout/header.cfm" />


<cfparam name="url.course_dept" default="" />

<!--- faculty detail query 
<cfquery name="getFacultyList" datasource="#application.dsn#">
	SELECT   DISTINCT     Courses.course_sub, Courses.course_num, Courses.course_title, Courses.course_crn, Professors.prof_id, Professors.prof_first_name, Professors.prof_last_name
	FROM     Courses INNER JOIN
                         Professors_Courses ON Courses.id = Professors_Courses.course_id INNER JOIN
                         Professors ON Professors_Courses.prof_id = Professors.id
	WHERE course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />

	ORDER BY prof_last_name, course_title
</cfquery>
--->

<cfquery name="getFacultyList" datasource="#application.dsn#">
	SELECT   DISTINCT     Professors.prof_id, Professors.prof_first_name, Professors.prof_last_name
	FROM     Courses INNER JOIN
                         Professors_Courses ON Courses.id = Professors_Courses.course_id INNER JOIN
                         Professors ON Professors_Courses.prof_id = Professors.id
	WHERE course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />

	ORDER BY  Professors.prof_last_name
</cfquery>

<!--
<cfdump var="#getFacultyList#" label="getFacultyList" />
-->


<cfquery name="getStudentList" datasource="#application.dsn#">
	SELECT  DISTINCT      Students.student_id AS znumber, Students.student_last_name, Students.student_first_name, Students.student_middle_i, (SELECT count(*)
			 FROM       Status INNER JOIN
						Students_Courses ON Status.student_course_id = Students_Courses.id 
			 WHERE      students_courses.student_id =   Students.id
			 AND status.status = 1
			
			) as status

	FROM            Students INNER JOIN
                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id
	WHERE course_dept = <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />

	ORDER BY Students.student_last_name
</cfquery>

<!-- 
<cfdump var="#getStudentList#" label="getFacultyList" />
-->

<!--- get course list --->
<cfquery name="getCourseList" datasource="#application.dsn#">
	select * from courses
	where course_dept = <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
</cfquery>


<body class="theme-darkblue" data-theme="theme-darkblue">
	<cfoutput>
		<cfinclude template="dash_navigation.cfm">
	</cfoutput>




	<div class="container-fluid">
			<!-- begin tabs --->
			<div class="row-fluid">
					<div class="span12">
						<div class="box ">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									<cfoutput>#url.course_dept#</cfoutput>
								</h3>
								<ul class="tabs">
									<li class="active">
										<a data-toggle="tab" href="#t1">Faculty List</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#t2">Student List</a>
									</li>
									
									<li class="">
										<a data-toggle="tab" href="#t3">Course List</a>
									</li>									
								</ul>
							</div>
							<div class="box-content">
								<div class="tab-content">
									<!--- BEGIN: tab1 List by Faculty --->
									<div id="t1" class="tab-pane active">
										<h4>Faculty List</h4>
										<!---
										 <div class="search-results">
											<ul>
												<cfoutput query="getFacultyList"  group="prof_last_name">
													<li>
														<div class="search-info">
															<div class="span12">
																<h4>#getFacultyList.prof_id# - #getFacultyList.prof_first_name#  #getFacultyList.prof_last_name#</h4>
															</div>

															<cfset count = 1>
															<cfoutput group="course_crn">
																<div class="span4">
																<a href="courseenrollments.cfm?prof_id=#getFacultyList.prof_id#">#getFacultyList.course_sub#  #getFacultyList.course_num# - #getFacultyList.course_title#  - #getFacultyList.course_crn#</a>
																</div>
																<cfset count = count + 1>
															</cfoutput>
														</div>
													</li>
												</cfoutput>
											</ul>									
										</div><!--- end of searc-results --->
										
										<!-- begin dynamic table FACULTY LIST --->
										<div class="row-fluid">
											<div class="span12">
												<div class="box box-color box-bordered darkblue">
													<div class="box-title">
														<h3>
															<i class="icon-table"></i>
															Faculty List
														</h3>
													</div>
													
													<div class="box-content nopadding">
														<table id="facultytable" class="table table-hover table-nomargin dataTable table-bordered">
															<thead>
																<tr>
																	
																	<th>Last Name</th>
																	<th class='hidden-350'>First Name</th>
																	<th>ZNUMBER</th>
																	<th>Status</th>
																	<th class='hidden-1024'>Action</th>
																	
																</tr>
															</thead>
															<tbody>
																<cfoutput query="getFacultyList" group="prof_last_name" >
																
																<cfquery name="countfacultyrisks" datasource="#application.dsn#">
																	SELECT  count(*) AS riskcount
																	FROM            Professors_Courses INNER JOIN
																					Professors ON Professors_Courses.prof_id = Professors.id INNER JOIN
																					Status INNER JOIN Students_Courses ON Status.student_course_id = Students_Courses.id ON Professors_Courses.course_id = Students_Courses.course_id
																	WHERE 0=0
																	AND status.status = 1
																	AND   professors.prof_id = <cfqueryparam value="#getFacultyList.prof_id#" CFSQLType="cf_sql_varchar" />
																</cfquery>

																<tr>
																	
																	<td>#getFacultyList.prof_last_name#</td>
																	<td class='hidden-350'>#getFacultyList.prof_first_name#</td>
																	<td>#getFacultyList.prof_id#</td>

																	<cfif countfacultyrisks.riskcount >
																		<td class='alert alert-error'>Warning</td>
																	<cfelse>
																		<td class='alert alert-info'>None indicated</td>
																	</cfif>

																	<td class='hidden-1024'><a href="courseenrollments.cfm?prof_id=#getFacultyList.prof_id#">View courses taught</a></td>	
														
																</tr>
																</cfoutput>												
															</tbody>
														</table>
													</div>
													
												</div>
											</div>
										</div>


										<!-- end dynamic table FACULTY LIST -->
									</div>
									<!-- END: tab1 List by Faculty -->
									<!-- BEGIN: tab2 List by Student -->
									<div id="t2" class="tab-pane">
										<h4>Student List</h4>
										
										<!---
										<div class="search-results">
											<ul>
												<cfoutput query="getStudentList">
													<li>
														<div class="search-info">
															<div class="span12">
																<h4>#getStudentList.znumber# - #getStudentList.student_last_name#  #getStudentList.student_first_name#</h4>
															</div>
															
															<!---
															<cfset count = 1>
															<cfoutput group="course_crn">
																<div class="span4">
																<a href="courseenrollments.cfm?prof_id=#getFacultyList.prof_id#">#getFacultyList.course_sub#  #getFacultyList.course_num# - #getFacultyList.course_title#  - #getFacultyList.course_crn#</a>
																</div>
																<cfset count = count + 1>
															</cfoutput>
															--->
														</div>
													</li>
												</cfoutput>
											</ul>									
										</div><!--- end of searc-results --->
										--->

										<!--- begin dynamic table STUDENT LIST --->
										<div class="row-fluid">
											<div class="span12">
												<div class="box box-color box-bordered darkblue">
													<div class="box-title">
														<h3>
															<i class="icon-table"></i>
															Student List
														</h3>
													</div>
													<div class="box-content nopadding">
														<table id="studenttable" class="table table-hover table-nomargin dataTable table-bordered">
															<thead>
																<tr>
																	
																	<th>Last Name</th>
																	<th class='hidden-350'>First Name</th>
																	<th>ZNUMBER</th>
																	<th>Status</th>
																	<th class='hidden-1024'>Action</th>
																</tr>
															</thead>
															<tbody>
																<cfoutput query="getStudentList">
																<tr>
																	<td>#getStudentList.student_last_name#</td>
																	<td class='hidden-350'>#getStudentList.student_first_name#</td>
																	<td>#getStudentList.znumber#</td>
																	<cfif getStudentList.status eq 1>
																		<td class='alert alert-error'>Warning</td>
																	<cfelse>
																		<td class='alert alert-info'>None indicated</td>
																	</cfif>
																	
																	<td class='hidden-1024'><a href="studentenrollments.cfm?znumber=#getStudentList.znumber#">View all courses</a></td>											
																</tr>
																</cfoutput>
																
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!--- end dynamic table STUDENT LIST --->
									</div>
									<!--- END: tab2 List by Student --->
									
									<!--- BEGIN: tab3 Course List --->
									<div id="t3" class="tab-pane">
										<h4>Course List</h4>
										<!--- begin dynamic table COURSE LIST --->
										<div class="row-fluid">
											<div class="span12">
												<div class="box box-color box-bordered red">
													<div class="box-title">
														<h3>
															<i class="icon-table"></i>
															Course List
														</h3>
													</div>
													<div class="box-content nopadding">
														<table id="studenttable" class="table table-hover table-nomargin dataTable table-bordered">
															<thead>
																<tr>
																	
																	<th>Course Title</th>
																	<th>Course CRN</th>
																	<th class='hidden-350'>Course Type</th>
																	<th>Course Campus</th>
																	<th>Course Term</th>
																	<th class='hidden-1024'>Action</th>
																</tr>
															</thead>
															<tbody>
																<cfoutput query="getCourseList">
																<tr>
																	<td>#getCourseList.course_sub# - #getCourseList.course_num# - #getCourseList.course_title#</td>
																	<td>#getCourseList.course_crn#</td>
																	<td class='hidden-350'>#getCourseList.course_type#</td>
																	<td>#getCourseList.course_campus#</td>
																	<td>#getCourseList.course_term#</td>
																	<td class='hidden-1024'><a href="completeenrollments.cfm?crn=#getCourseList.course_crn#">View enrollment</a></td>											
																</tr>
																</cfoutput>
																
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!--- end dynamic table COURSE LIST --->
									</div>
									<!--- END: tab3 Course List --->
								</div>
							</div>
						</div>
					</div>
					
					</div>
		<!--- end tabs --->

	
	<!---
			<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									<cfoutput>#url.course_dept#</cfoutput> - Faculty & Courses 
								</h3>
							</div>
							<div class="box-content">
								
								
								<div class="search-results">
									
									<ul>

										<cfoutput query="getFacultyList"  group="prof_last_name">
											<li>
												<div class="search-info">
													<div class="span12">
														<h4>#getFacultyList.prof_id# - #getFacultyList.prof_first_name#  #getFacultyList.prof_last_name#</h4>
													</div>

													<cfset count = 1>
													<cfoutput group="course_crn">
														<div class="span4">
														<a href="courseenrollments.cfm?prof_id=#getFacultyList.prof_id#">#getFacultyList.course_sub#  #getFacultyList.course_num# - #getFacultyList.course_title#  - #getFacultyList.course_crn#</a>
														</div>
														<cfset count = count + 1>
													</cfoutput>
												</div>
											</li>
										</cfoutput>

									
										
									</ul>
									
								</div>
								
							</div>

						</div>
					</div>
				</div>
		--->
	</div><!-- end of container-fluid -->
</body>
 
</html>