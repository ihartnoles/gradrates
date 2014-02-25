<cfinclude template="layout/header.cfm" />



<cfquery name="getQuickStats" datasource="#application.dsn#">
	

SELECT   TOP 1
			(SELECT DISTINCT count(*)
				FROM            courses 
						 
			
			
			) as coursecount,

			(SELECT DISTINCT count(*)
				FROM            Students 
						 
			
			
			) as studentcount

			, (SELECT DISTINCT count(*)
				FROM            Students INNER JOIN
                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
                         Courses ON Students_Courses.course_id = Courses.id 
						 LEFT OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id
			 WHERE status.status = 1
			
			) as atriskcount

			

	FROM            Students 
    WHERE 0=0


</cfquery>

<cfquery name="toptenstudentsflagged" datasource="#application.dsn#">
	
SELECT  DISTINCT TOP 10 Students.student_id AS znumber, Students.student_last_name, Students.student_first_name, Students.student_middle_i, (SELECT count(*)
													 FROM       Status INNER JOIN
																Students_Courses ON Status.student_course_id = Students_Courses.id 
													 WHERE      students_courses.student_id =   Students.id
													 AND status.status = 1
													
													) as statuscount

											FROM            Students INNER JOIN
										                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
										                         Courses ON Students_Courses.course_id = Courses.id LEFT OUTER JOIN
										                         Status ON Students_Courses.id = Status.student_course_id
										    WHERE 0=0
											
ORDER BY statuscount DESC, student_last_name
</cfquery>



<cfquery name="toptencoursesflagged" datasource="#application.dsn#">
	
SELECT  DISTINCT TOP 10    c.*, (
					
					SELECT       DISTINCT     count(*)
																	FROM            Courses INNER JOIN
																	                         Students_Courses ON Courses.id = Students_Courses.course_id INNER JOIN
																	                         Status ON Students_Courses.id = Status.student_course_id
																	WHERE         0=0
																	AND        Status.status = 1
																	AND       Courses.course_crn = c.course_crn
																	
					) as riskcount
	FROM            Courses c INNER JOIN 
                         Students_Courses ON c.id = Students_Courses.course_id LEFT OUTER JOIN
                         Status ON Students_Courses.id = Status.student_course_id 
						 

ORDER BY riskcount DESC, course_title
</cfquery>


<cfquery name="toptenfacultyflagged" datasource="#application.dsn#">
	SELECT   DISTINCT TOP 10     Professors.prof_id, Professors.prof_first_name, Professors.prof_last_name, c.course_dept, 
						(
							SELECT   DISTINCT   count(*)
							FROM            Professors p INNER JOIN
													 Professors_Courses ON p.id = Professors_Courses.prof_id 
													 INNER JOIN	 Courses ON Professors_Courses.course_id = Courses.id
													 INNER JOIN  Students_Courses ON Professors_Courses.course_id = Students_Courses.course_id 
													 INNER JOIN	 Students ON Students_Courses.student_id = Students.id
													 INNER JOIN	 Status ON Students_Courses.id = Status.student_course_id
							WHERE  0=0

							AND status.status = 1		
							AND courses.course_dept = c.course_dept
							AND professors.prof_id = p.prof_id
							--ORDER BY Professors.prof_id
						) as riskcount
	FROM     Courses c  INNER JOIN
                         Professors_Courses ON c.id = Professors_Courses.course_id INNER JOIN
                         Professors ON Professors_Courses.prof_id = Professors.id 
	WHERE 0=0

ORDER by riskcount DESC, Professors.prof_last_name
</cfquery>

 

<!--- 
<cfdump var="#toptenfacultyflagged#" label="toptenfacultyflagged" />
<cfdump var="#getFacultyZnumbers#" label="getFacultyZnumbers"/>
 --->
<body class="theme-darkblue" data-theme="theme-darkblue">

	<div class="loader"></div>

	<cfoutput>
		<cfinclude template="dash_navigation.cfm">
	</cfoutput>



	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				
					<h4>
					Quick Stats
					</h4>
					
			</div>
		</div>
		<div class="row-fluid">
										

										<div class="span12">									
											<div class="alert alert-info text-center">
												<cfoutput>
													<strong>Total Courses</strong> : #getQuickStats.coursecount# | 
													<strong>Total Students</strong> : #getQuickStats.studentcount# |
													<strong>At-risk flags issued</strong>: #getQuickStats.atriskcount#								
												</cfoutput>
											</div>
										</div>
										
										
		</div>
		<div class="row-fluid">
			<div class="span12">
				<!---
				<h5>Top 10 flagged students</h5>
				<ol>
				<cfoutput query="toptenstudentsflagged">
					<li>
					#toptenstudentsflagged.znumber# 
					#toptenstudentsflagged.student_last_name# 
					#toptenstudentsflagged.student_first_name#
					<b>#toptenstudentsflagged.statuscount#</b>
					</li>
				</cfoutput>	
				</ol>		
				--->

				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h4>
									<i class="icon-table"></i>
									Top 10 flagged students
								</h4>
							</div>
							<div class="box-content nopadding">
								<table class="table table-hover table-nomargin table-condensed">
									<thead>
										<tr>
											<th>ZNUMBER</th>
											<th>Last name</th>
											<th class="hidden-350">First name</th>
											<th class="hidden-480">Risk count</th>
										</tr>
									</thead>
									<tbody>
										<cfoutput query="toptenstudentsflagged">
										<tr>
											<td>#toptenstudentsflagged.znumber#</td>
											<td>#toptenstudentsflagged.student_last_name#</td>
											<td class="hidden-350">#toptenstudentsflagged.student_first_name#</td>
											<td class="hidden-480">#toptenstudentsflagged.statuscount#</td>
										</tr>
										</cfoutput>
									</tbody>
								</table>
							</div>
						</div>
					</div>				
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">
				<!---
				<h5>Top 10 flagged courses</h5>
				<ol>
				<cfoutput query="toptencoursesflagged">
					<li>
					#toptencoursesflagged.course_crn# 
					#toptencoursesflagged.course_sub# 
					#toptencoursesflagged.course_num#
					#toptencoursesflagged.course_title#					
					<b>#toptencoursesflagged.riskcount#</b>
					</li>
				</cfoutput>	
				</ol>	
				--->

				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h4>
									<i class="icon-table"></i>
									Top 10 flagged courses
								</h4>
							</div>
							<div class="box-content nopadding">
								<table class="table table-hover table-nomargin table-condensed">
									<thead>
										<tr>
											<th>Course CRN</th>
											<th>Course sub</th>
											<th class="hidden-350">Course num</th>
											<th class="hidden-480">Title</th>
											<th class="hidden-480">Risk count</th>
										</tr>
									</thead>
									<tbody>
										<cfoutput query="toptencoursesflagged">
										<tr>
											<td>#toptencoursesflagged.course_crn#</td>
											<td>#toptencoursesflagged.course_sub#</td>
											<td class="hidden-350">#toptencoursesflagged.course_num#</td>
											<td class="hidden-1024">#toptencoursesflagged.course_title#</td>
											<td class="hidden-480">#toptencoursesflagged.riskcount#</td>
										</tr>
										</cfoutput>
									</tbody>
								</table>
							</div>
						</div>
					</div>			
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12">
			<!---	
			<h5>Top 10 flagged professors</h5>
				<ol>
				
				<cfoutput query="toptencoursesflagged">
					<li>
					#toptencoursesflagged.course_crn# 
					#toptencoursesflagged.course_sub# 
					#toptencoursesflagged.course_num#
					#toptencoursesflagged.course_title#					
					<b>#toptencoursesflagged.riskcount#</b>
					</li>
				</cfoutput>	
				

				<cfoutput query="toptenfacultyflagged" group="prof_id">
						<li>#toptenfacultyflagged.prof_id# - #toptenfacultyflagged.prof_first_name# - #toptenfacultyflagged.prof_last_name# - #toptenfacultyflagged.course_dept# - #toptenfacultyflagged.riskcount# </li>

				</cfoutput>

				</ol>	
--->
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h4>
									<i class="icon-table"></i>
									Top 10 flagged instructors
								</h4>
							</div>
							<div class="box-content nopadding">
								<table class="table table-hover table-nomargin table-condensed">
									<thead>
										<tr>
											<th>ZNUMBER</th>
											<th>First name</th>
											<th class="hidden-350">Last name</th>
											<th class="hidden-480">Dept</th>
											<th class="hidden-480">Risk count</th>
										</tr>
									</thead>
									<tbody>
										<cfoutput query="toptenfacultyflagged" group="prof_id">
										<tr>
											<td>#toptenfacultyflagged.prof_id#</td>
											<td>#toptenfacultyflagged.prof_first_name#</td>
											<td class="hidden-350">#toptenfacultyflagged.prof_last_name#</td>
											<td class="hidden-1024">#toptenfacultyflagged.course_dept#</td>
											<td class="hidden-480">#toptenfacultyflagged.riskcount#</td>
										</tr>
										</cfoutput>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div><!--- end of container-fluid --->


</body>
</html>
