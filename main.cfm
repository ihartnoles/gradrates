<cfinclude template="securityrestrictions.cfm" />

<cfinclude template="layout/header.cfm" />

<cfquery name="getQuickStats" datasource="#application.dsn#">
	

SELECT   TOP 1
			(SELECT DISTINCT count(*)
				FROM            courses 
				
				WHERE 0=0

				<cfif StructKeyExists(session['gras'], "role") AND session.gras.role eq 4>
					AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
				</cfif>
			
			) as coursecount,

			(
				<!--- <cfif StructKeyExists(session['gras'], "role") AND session.gras.role eq 8> --->
					SELECT DISTINCT count(*)
					FROM            Students 
				<!--- <cfelse> 
					SELECT  DISTINCT Students.id
					FROM            Departments INNER JOIN
					                         Colleges ON Departments.college_id = Colleges.id INNER JOIN
					                         Students INNER JOIN
					                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
					                         Courses ON Students_Courses.course_id = Courses.id ON Departments.course_dept = Courses.course_dept
					WHERE 0=0
					AND course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
				</cfif> --->
			
			) as studentcount

			, (SELECT DISTINCT count(*)
				FROM            Students INNER JOIN
                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id 
						 LEFT OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id
			 WHERE status.status = 1
				
				<cfif StructKeyExists(session['gras'], "role") AND session.gras.role eq 4>
					AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
				</cfif>

			) as atriskcount

			

	FROM            Students 
    WHERE 0=0
</cfquery>


<cfquery name="getColleges" datasource="#application.dsn#" cachedwithin="#createtimespan(1,0,0,0)#">
	SELECT  DISTINCT  Colleges.id, Courses.course_college, Courses.course_dept, (SELECT  count(*) as no_of_departments
														FROM            Colleges c INNER JOIN
																				 Departments d ON c.id = d.college_id 
														WHERE  c.id = colleges.id
														GROUP BY college_id) as dept_count
FROM            Colleges INNER JOIN
                         Departments ON Colleges.id = Departments.college_id INNER JOIN
                         Courses ON Colleges.course_college = Courses.course_college AND Departments.course_dept = Courses.course_dept
	where 0=0


	<cfif StructKeyExists(session['gras'], "role") AND session.gras.role eq 4>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
	</cfif>

	<cfif StructKeyExists(session['gras'], "role") AND session.gras.role eq 2>
		AND	course_college =  <cfqueryparam value="#url.course_college#" CFSQLType="cf_sql_varchar" />
		AND course_dept    =  <cfqueryparam value="#url.course_dept#" CFSQLType="cf_sql_varchar" />
	</cfif>

	GROUP BY Colleges.id, Courses.course_college, Courses.course_dept
	order by course_college, course_dept
</cfquery>


<!---
<cfdump var="#getColleges#" label="getColleges - main.cfm" />
--->


<body class="theme-darkblue" data-theme="theme-darkblue">
	
	<div class="loader"></div>

	<cfoutput>
		<cfinclude template="dash_navigation.cfm">
	</cfoutput>
	
	<!---
	<cfdump var="#session#" label="session.cas" />
	--->

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
										Colleges & Departments with petitions to graduate
									
								</h3>
								
								<cfif session.gras.role EQ 8>
									<br><br>
									<div class="row-fluid">
										

										<div class="span12">									
											<div class="alert alert-info text-center">
												<cfoutput>
													<strong>Total Courses</strong> : #getQuickStats.coursecount# | 
													<strong>Total Students</strong> : #getQuickStats.studentcount# |
													<strong>At-risk flags issued</strong>: #getQuickStats.atriskcount#
													<!--- <br> <a href="stats.cfm">View Quick Stats</a> --->
												</cfoutput>
											</div>
										</div>
										
										
									</div>
								</cfif>							
							</div>
							<div class="box-content">
								
								
								<div class="search-results">
									<ul>

										<cfoutput query="getColleges"  group="course_college">

										<cfquery name="getStudentStats" datasource="#application.dsn#">
											SELECT   DISTINCT  Students.student_id AS znumber, Students.student_last_name, Students.student_first_name, Students.student_middle_i, (SELECT count(*)
													 FROM       Status INNER JOIN
																Students_Courses ON Status.student_course_id = Students_Courses.id 
													 WHERE      students_courses.student_id =   Students.id
													 AND status.status = 1
													
													) as statuscount,

													Courses.course_dept

											FROM            Students INNER JOIN
										                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
										                         Courses ON Students_Courses.course_id = Courses.id LEFT OUTER JOIN
										                         Status ON Students_Courses.id = Status.student_course_id
										    WHERE 0=0
											
											AND Status.status = 1
											

											<cfif len(trim(getColleges.course_college))>
												AND	course_college =  <cfqueryparam value="#getColleges.course_college#" CFSQLType="cf_sql_varchar" />
											</cfif>

											ORDER BY Students.student_last_name, Students.student_id
										</cfquery>



										

										<li>
											<div class="search-info">
												<div class="span12">
													<h4>#getColleges.course_college# 
														<cfif getStudentStats.recordcount AND session.gras.role GTE 4>
															<span class="badge badge-important">#getStudentStats.recordcount# issues</span>
														</cfif>
													</h4> 
												</div>
												<!---
												<div class="span12">
													
														<div class="alert alert-info">	
															<cfif getStudentStats.recordcount>											
																<span class="badge badge-warning">#getStudentStats.recordcount# issues</span>
															<cfelse>
																<span class="badge badge-success">0 issues</span>
															</cfif>	
														</div>
																									
												</div>
												--->

												<!--- SECURITY: Admins and Advisors can see across colleges --->
												<cfif StructKeyExists(session['gras'], "role") AND session.gras.role gte 4>
													<cfif getColleges.dept_count GT 1 >
														<div class="span12"><a href="facultylist.cfm?&course_college=#urlencodedformat(getColleges.course_college)#">View All Departments</a></div>
													</cfif>													
												</cfif>
												<!--- SECURITY: Admins and Advisors can see across colleges --->


												<cfoutput group="course_dept">

													<cfquery name="deptStats" dbtype="query">
														select count(*) as problemcount
														from getStudentStats
														where course_dept = '#getColleges.course_dept#'
													</cfquery>
													
													<!---
													<cfdump var="#deptStats#" label="deptStats" />
													--->

													<div class="span3">
													<a href="facultylist.cfm?&course_college=#urlencodedformat(getColleges.course_college)#&course_dept=#urlencodedformat(getColleges.course_dept)#">#getColleges.course_dept#</a>
													<cfif deptStats.recordcount>
														<span class="badge badge-important">#deptStats.problemcount#</span>
													</cfif>
													</div>
												</cfoutput>
											</div>
										</li>
										
										<!---
										<cfdump var="#getStudentStats#" label="getStudentStats" />
										--->

										</cfoutput>

									
										
									</ul>
								</div>
								
								
								<!---
								<table class="table table-hover table-nomargin">
									<thead>
										<tr>
											<th>College</th>
											<th>Department</th>
											<th class="hidden-1024">Actions</th>		
										</tr>
									</thead>
									<tbody>
									<cfoutput query="getColleges">
								
										<tr>
											<td>#getColleges.course_college#</td>
											<td>#getColleges.course_dept#</td>
											<td>
												TEST
											</td>			
										</tr>
									</cfoutput>
																			
									</tbody>
								</table>
								--->
							</div>

						</div>
					</div>
				</div>
	</div><!-- end of container-fluid -->
	
</body>



</html>