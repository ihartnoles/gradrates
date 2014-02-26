<cfinclude template="securityrestrictions.cfm" />


<cfinclude template="layout/header.cfm" />

<cfparam name="url.course_dept" default="" />
<cfparam name="url.course_college" default="" />

<!--- faculty detail query --->
<cfquery name="getFacultyList" datasource="#application.dsn#">
	SELECT   DISTINCT     Courses.*, Professors.prof_id, Professors.prof_first_name, Professors.prof_last_name
	FROM     Courses INNER JOIN
                         Professors_Courses ON Courses.id = Professors_Courses.course_id INNER JOIN
                         Professors ON Professors_Courses.prof_id = Professors.id
	WHERE 0=0
	
	AND courses.course_college <> 'C.E. Schmidt Coll  Med'

	<cfif len(trim(url.course_dept))>
	AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>
	
	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>

	ORDER BY prof_last_name, course_title
</cfquery>

<!---
<cfquery name="getFacultyList" datasource="#application.dsn#" >
	SELECT  DISTINCT      Professors.prof_id, Professors.prof_first_name, Professors.prof_last_name, Professors_Courses.course_id, Courses.course_crn, Status.status
FROM            Professors FULL OUTER JOIN
                         Professors_Courses ON Professors.id = Professors_Courses.prof_id FULL OUTER JOIN
                         Courses ON Professors_Courses.course_id = Courses.id FULL OUTER JOIN
                         Students_Courses ON Professors_Courses.course_id = Students_Courses.course_id FULL OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id
	WHERE 0=0
	
	<cfif len(trim(url.course_dept))>
	AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>
	
	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>

	ORDER BY  Professors.prof_last_name
</cfquery>
 --->

 <!---
<cfdump var="#getFacultyList#" label="getFacultyList - facultylist.cfm - line 46" />
 --->

 <cfquery name="getFacultyZnumbers" datasource="#application.dsn#" >
 SELECT   DISTINCT   Professors.prof_id
	FROM            Professors INNER JOIN
	                         Professors_Courses ON Professors.id = Professors_Courses.prof_id INNER JOIN
	                         Courses ON Professors_Courses.course_id = Courses.id INNER JOIN
	                         Students_Courses ON Professors_Courses.course_id = Students_Courses.course_id INNER JOIN
	                         Status ON Students_Courses.id = Status.student_course_id
	WHERE  0=0

	AND courses.course_college <> 'C.E. Schmidt Coll  Med'
	AND status.status = 1

	
	<cfif len(trim(url.course_dept))>
		AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>

	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>
ORDER BY Professors.prof_id
</cfquery>

<!---
<cfdump var="#getFacultyZnumbers#" label="getFacultyZnumbers" />

<cfdump var="#ValueList(getFacultyZnumbers.prof_id)#" label="znumbervaluelist" />
 --->

<cfquery name="getStudentList" datasource="#application.dsn#">
	SELECT   DISTINCT  Students.student_id AS znumber, Students.student_last_name, Students.student_first_name, Students.student_middle_i, courses.course_crn

	FROM            Students INNER JOIN
                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id LEFT OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id
    WHERE 0=0
	
	AND courses.course_college <> 'C.E. Schmidt Coll  Med'

	<cfif len(trim(url.course_dept))>
		AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>	

	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>

	ORDER BY Students.student_last_name, Students.student_id
</cfquery>

<cfquery name="getStudentZnumbersAtRisk" datasource="#application.dsn#" >
	SELECT Students.student_id
			 FROM       Status INNER JOIN
						Students_Courses ON Status.student_course_id = Students_Courses.id INNER JOIN
						Students ON Students.id = Students_Courses.student_id  INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id
			 WHERE      students_courses.student_id =   Students.id
			 AND status.status = 1

	AND courses.course_college <> 'C.E. Schmidt Coll  Med'

	<cfif len(trim(url.course_dept))>
		AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>	

	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>
</cfquery>

<cfquery name="getStudentZnumbersOutreach" datasource="#application.dsn#" >
	SELECT Students.student_id
			 FROM       Status INNER JOIN
						Students_Courses ON Status.student_course_id = Students_Courses.id INNER JOIN
						Students ON Students.id = Students_Courses.student_id  INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id
			 WHERE      students_courses.student_id =   Students.id
			 AND status.status = 3

	AND courses.course_college <> 'C.E. Schmidt Coll  Med'

	<cfif len(trim(url.course_dept))>
		AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>	

	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>
</cfquery>

 
<!---
<cfquery name="getStudentList" datasource="#application.dsn#">
 SELECT DISTINCT      Students.student_id AS znumber, Students.student_last_name, Students.student_first_name, Students.student_middle_i , Status.status

	FROM            Students INNER JOIN
                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id LEFT OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id
    WHERE 0=0

	<cfif len(trim(url.course_dept))>
		AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>	

	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>

	ORDER BY Students.student_last_name
 </cfquery>                        
--->


<!--- get course list --->
<cfquery name="getCourseList" datasource="#application.dsn#">
	SELECT  DISTINCT     Courses.*
	FROM            Courses INNER JOIN
                         Students_Courses ON Courses.id = Students_Courses.course_id LEFT OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id

	where 0=0

	AND courses.course_college <> 'C.E. Schmidt Coll  Med'
	
	<cfif len(trim(url.course_dept))>
		AND	course_dept =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>
	
	<cfif len(trim(url.course_college))>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>

	ORDER BY Courses.course_crn
</cfquery>

<!--- 

<cfdump var="#getCourseList#" label="getCourseList" />
--->
<body class="theme-darkblue" data-theme="theme-darkblue">

	<div class="loader"></div>

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
									<b><cfoutput>#url.course_college# - 
									<cfif len(trim(#url.course_dept#))>
										#url.course_dept#
									<cfelse>
										All Departments
									</cfif>
								</cfoutput></b>
								</h3>
								<ul class="tabs">
									<li class="">
										<a data-toggle="tab" href="#t1">Faculty List</a>
									</li>
									<li class="active">
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
									<div id="t1" class="tab-pane">
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
																	
																	<th>Status</th>
																	<th>Last Name</th>
																	<th class='hidden-350'>First Name</th>
																	<th>ZNUMBER</th>
																	<th class='hidden-1024'>Action</th>
																	
																</tr>
															</thead>
															<tbody>
																<cfoutput query="getFacultyList" group="prof_id" >
																
																<!---
																<cfquery name="countfacultyrisks" datasource="#application.dsn#">
																	SELECT  count(*) AS riskcount
																	FROM            Professors_Courses INNER JOIN
																					Professors ON Professors_Courses.prof_id = Professors.id INNER JOIN
																					Status INNER JOIN Students_Courses ON Status.student_course_id = Students_Courses.id ON Professors_Courses.course_id = Students_Courses.course_id
																	WHERE 0=0
																	AND status.status = 1
																	AND   professors.prof_id = <cfqueryparam value="#getFacultyList.prof_id#" CFSQLType="cf_sql_varchar" />
																</cfquery>
																--->
										
																<tr>
																	<cfif ListContains(#ValueList(getFacultyZnumbers.prof_id)#, getFacultyList.prof_id) >
																		<td class='alert alert-error'>At-risk</td>
																	<cfelse>
																		<td class='alert alert-info'>None indicated</td>
																	</cfif>
																	<td>#getFacultyList.prof_last_name#</td>
																	<td class='hidden-350'>#getFacultyList.prof_first_name#</td>
																	<td>#getFacultyList.prof_id#</td>
																	<td class='hidden-1024'><a href="courseenrollments.cfm?prof_id=#getFacultyList.prof_id#&course_dept=#urlencodedformat(url.course_dept)#&course_college=#urlencodedformat(course_college)#">View courses taught</a></td>	
														
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
									<div id="t2" class="tab-pane active">
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
										
										<!---
										<cfdump var="#getStudentList#" label="getStudentList - 313" />
										--->

										<!--- begin dynamic table STUDENT LIST --->
										<div class="row-fluid">
											<div class="span12">
												<div class="box box-color box-bordered red">
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
																	
																	<th>Status</th> 
																	<th>Last Name</th>
																	<th class='hidden-350'>First Name</th>
																	<th>ZNUMBER</th>
																	<th>CRN</th>
																	
																	<th class='hidden-1024'>Action</th>
																</tr>
															</thead>
															<tbody>
																<cfoutput query="getStudentList" group="znumber">
																<tr>
																	<!--- <cfif  getStudentList.statuscount GT 0> --->
																	<cfif ListContains(#ValueList(getStudentZnumbersAtRisk.student_id)#, getStudentList.znumber) >
																		<td class='alert alert-error'>At-risk</td>

																	<cfelseif ListContains(#ValueList(getStudentZnumbersOutreach.student_id)#, getStudentList.znumber) >	
																		<td class='alert'>Outreach Completed</td>
																	<cfelse>
																		<td class='alert alert-info'>None indicated </td>
																	</cfif>

																	<td>#getStudentList.student_last_name#</td>
																	<td class='hidden-350'>#getStudentList.student_first_name#</td>
																	<td>#getStudentList.znumber#</td>
																	<td>#getStudentList.course_crn#</td>																	
																	
																	
																	
																	<td class='hidden-1024'><a href="studentenrollments.cfm?znumber=#getStudentList.znumber#&course_dept=#urlencodedformat(url.course_dept)#&course_college=#urlencodedformat(course_college)#">View all courses</a></td>											
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
												<div class="box box-color box-bordered lightgrey">
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
																	<th>Status</th>
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
																
																
																<cfquery name="countCourseRisks" datasource="#application.dsn#">
																	SELECT       count(*) as riskcount
																	FROM            Courses INNER JOIN
																	                         Students_Courses ON Courses.id = Students_Courses.course_id INNER JOIN
																	                         Status ON Students_Courses.id = Status.student_course_id
																	WHERE         0=0
																	AND        Status.status = 1
																	AND  Courses.course_crn = <cfqueryparam value="#getCourseList.course_crn#" CFSQLType="cf_sql_integer" />
																</cfquery>
																

																<tr>
																	 <cfif countCourseRisks.riskcount>
																	<!---<cfif getCourseList.status eq 1> --->
																		<td class='alert alert-error'>At-risk</td>
																	<cfelse>
																		<td class='alert alert-info'>None indicated</td>
																	</cfif>
																	<td>#getCourseList.course_sub# - #getCourseList.course_num# - #getCourseList.course_title#</td>
																	<td>#getCourseList.course_crn#</td>
																	<td class='hidden-350'>#getCourseList.course_type#</td>
																	<td>#getCourseList.course_campus#</td>
																	<td>#getCourseList.course_term#</td>
																	
																	<td class='hidden-1024'><a href="completeenrollments.cfm?crn=#getCourseList.course_crn#&course_dept=#urlencodedformat(url.course_dept)#&course_college=#urlencodedformat(course_college)#">View enrollment</a></td>											
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