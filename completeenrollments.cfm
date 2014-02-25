<cfinclude template="securityrestrictions.cfm" />

<cfinclude template="layout/header.cfm" />


<cfparam name="url.course_dept" default="" />
<cfparam name="url.course_college" default="" />

<cfquery name="getCompleteEnrollment" datasource="#application.dsn#" cachedwithin="#createtimespan(0,1,0,0)#">
	SELECT  DISTINCT  Courses.id, Students.student_id, Students.student_last_name, Students.student_first_name, Professors.prof_first_name, Professors.prof_last_name, 
	                         Courses.course_crn, Courses.course_sub, Courses.course_num, Courses.course_title
	FROM            Professors INNER JOIN
	                         Professors_Courses ON Professors.id = Professors_Courses.prof_id INNER JOIN
	                         Courses INNER JOIN
	                         Students_Courses ON Courses.id = Students_Courses.course_id INNER JOIN
	                         Students ON Students_Courses.student_id = Students.id ON Professors_Courses.course_id = Courses.id
	WHERE Courses.course_crn = <cfqueryparam value="#url.crn#" CFSQLType="cf_sql_integer">
</cfquery>



<!--- first query returned no results; The course probably doesn't have an instructor --->
<cfif NOT getCompleteEnrollment.recordcount>
	<!--- query for course enrollments minus the professors and professors_course tables --->
	<cfquery name="getCompleteEnrollment" datasource="#application.dsn#" cachedwithin="#createtimespan(0,1,0,0)#">
		SELECT DISTINCT Courses.id, Students.student_id, Students.student_last_name, Students.student_first_name,  NULL as prof_first_name, NULL as  prof_last_name, Courses.course_crn, Courses.course_sub, Courses.course_num, Courses.course_title 
	FROM Courses 
			INNER JOIN Students_Courses ON Courses.id = Students_Courses.course_id 
			INNER JOIN Students ON Students_Courses.student_id = Students.id 
		WHERE Courses.course_crn = <cfqueryparam value="#url.crn#" CFSQLType="cf_sql_integer">
	</cfquery>
</cfif>

<!--- 
<cfdump var="#getCompleteEnrollment#" abort="false" />
--->

<body class="theme-darkblue" data-theme="theme-darkblue">

	<div class="loader"></div>

	<cfoutput>
		<cfinclude template="dash_navigation.cfm">
	</cfoutput>

<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="icon-reorder"></i>
										<b>Spring 2014 -</b>  <cfoutput> <b>CRN: <i> #getCompleteEnrollment.course_crn# </i></b> -  <b> COURSE: <i>#getCompleteEnrollment.course_sub#  #getCompleteEnrollment.course_num# - #getCompleteEnrollment.course_title# </i></b> - <b>Instructor: 
										<i>
										<cfif len(trim(getCompleteEnrollment.prof_first_name)) AND len(trim(getCompleteEnrollment.prof_last_name)) >
											#getCompleteEnrollment.prof_first_name#  #getCompleteEnrollment.prof_last_name#
										<cfelse>
											NONE ASSIGNED
										</cfif>
										</i></b> 
									</cfoutput>
									</h3>
								</div>
								<div class="box-content">
	
									<div class="row-fluid">
										<cfoutput>
										<a href="facultylist.cfm?course_college=#urlencodedformat(url.course_college)#&course_dept=#urlencodedformat(url.course_dept)#">Go Back</a>
										</cfoutput>
									</div>


									<div id="accordion2" class="accordion">
										
										
										<cfoutput query="getCompleteEnrollment" group="course_crn">


											<cfquery name="getEnrollments" datasource="#application.dsn#" cachedwithin="#createtimespan(0,1,0,0)#">
												SELECT   DISTINCT     Students.id, Students.student_id, Students.student_last_name, Students.student_first_name, Courses.course_crn, Courses.course_sub, 
												                         Courses.course_num, Courses.course_title, Students_Courses.ID as students_courses_id
												FROM            Students INNER JOIN
												                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
												                         Courses ON Students_Courses.course_id = Courses.id

												WHERE Courses.course_crn =  <cfqueryparam value="#getCompleteEnrollment.course_crn#" CFSQLType="cf_sql_integer">
												      
												order by Students.student_last_name, Students.student_id ,  Courses.course_crn
											</cfquery>
											
											<!-- 
											<cfdump var="#getEnrollments#" label="getEnrollments" />
											-->

											<div class="accordion-group">
												<div class="accordion-heading">
													<h4>
													<a href="##collapse#getCompleteEnrollment.currentrow#" data-parent="##accordion2" data-toggle="collapse" class="accordion-toggle">
														<i class="glyphicon-book"></i> #getCompleteEnrollment.course_sub#  #getCompleteEnrollment.course_num# - #getCompleteEnrollment.course_title#  - #getCompleteEnrollment.course_crn#
													</a>
													</h4>
												</div>
												<div class="accordion-body in collapse"  id="collapse#getCompleteEnrollment.currentrow#" style="height: auto;">
													<div class="accordion-inner">
														<!-- BEGIN FORM -->
													<div class="row-fluid">
														<div class="span12">
															<div class="box">
																<div class="box-title">
																	<h3>
																		<i class="glyphicon-group"></i>
																		Course Enrollment
																	</h3>
																</div>
																<div class="box-content nopadding">
																	<table class="table table-hover table-nomargin">
																		<thead>
																			<tr>
																				<th>znumber</th>
																				<th>Last name</th>
																				<th>First name</th>
																				<th class="hidden-350">Status</th>
																				<th class="hidden-1024">Comments</th>																			
																			</tr>
																		</thead>
																		<tbody>
																		<cfloop query="getEnrollments">
																			
																			<cfquery name="getStatuses" datasource="#application.dsn#">
																				SELECT        Students_Courses.id, Students_Courses.student_id, Students_Courses.course_id, Status.status, Status.created_by, Status.student_course_id, 																				                         Status.created_on
																				FROM       Status INNER JOIN
																				                         Students_Courses ON Status.student_course_id = Students_Courses.id
																				WHERE  Students_Courses.id = #getEnrollments.students_courses_id#
																			</cfquery>
																			
																			<!--- 
																				<cfdump var="#getStatuses#" label="getStatuses" /> <br>
																			--->
																			
																			<cfquery name="getComments" datasource="#application.dsn#">
																				SELECT        Comments.student_course_id, Students_Courses.student_id, Comments.comments, Students_Courses.course_id, Students.student_id AS Expr1, 
																				                         Students.student_last_name, Students.student_first_name
																				FROM            Comments INNER JOIN
																				                         Students_Courses ON Comments.student_course_id = Students_Courses.id INNER JOIN
																				                         Students ON Students_Courses.student_id = Students.id
																				WHERE 		 Comments.student_course_id = <cfqueryparam value="#getEnrollments.students_courses_id#" CFSQLType="cf_sql_integer" />
																			</cfquery>

																			<cfif getStatuses.status GTE 1>
																				<tr class="alert">
																			<cfelse>
																				<tr>
																			</cfif>

																				<td>#getEnrollments.student_id#</td>
																				<td>#getEnrollments.student_last_name#</td>
																				<td>
																					#getEnrollments.student_first_name#
																				</td>
																				<td class="hidden-350">
																					<div class="control-group">
																						<!-- <label class="control-label">Radios</label> -->
																						<div class="controls">
																							<label class="radio">
																								<input type="radio" name="atrisk-#getCompleteEnrollment.currentrow#-#getEnrollments.currentrow#" value="1" class="atrisk" data-modal="#getCompleteEnrollment.currentrow#-#getEnrollments.currentrow#" <cfif getStatuses.status EQ 1>checked</cfif>> At-Risk
																							</label>
																							<label class="radio">
																								<input type="radio" class="noissues notify" name="atrisk-#getCompleteEnrollment.currentrow#-#getEnrollments.currentrow#" value="0" data-notify-message="The status has been updated." data-notify-title="Success!" data-notify-time="6000" data-students_courses_id="#getEnrollments.STUDENTS_COURSES_ID#" <cfif getStatuses.status EQ 0>checked</cfif>> No issues
																							</label>

																							<cfif session.gras.role gte 4 >
																								<label class="radio">
																									<input type="radio" class="noissues outreach" name="atrisk-#getCompleteEnrollment.currentrow#-#getEnrollments.currentrow#" value="3" data-notify-message="The status has been updated." data-notify-title="Success!" data-notify-time="6000" data-students_courses_id="#getEnrollments.STUDENTS_COURSES_ID#" <cfif getStatuses.status EQ 3>checked</cfif>> Outreach completed
																								</label>
																							</cfif>																							
																						</div>
																					</div>
																				</td>
																				<td class="hidden-1024">
																				   <a href="##modal-#getCompleteEnrollment.currentrow#-#getEnrollments.currentrow#" role="button" class="btn btn-small btn-darkblue" data-toggle="modal" data-checklistTypeid="1">
																																	<i class="icon-plus-sign"></i>
																																		Add a comment
																																	</a>
																				<cfif getComments.recordcount >
																																							
																				  <a href="viewcomments.cfm?student_course_id=#getEnrollments.students_courses_id#" role="button" class="btn btn-small btn-red popup">
																																<i class="icon-search"></i>
																																View comments</a>	
																				<cfelse>
																					
																					<a class="btn btn-small btn-lightgrey" href="javascript:void(0)"><i class="glyphicon-ban"></i> No Comments</a>

																				</cfif>

																				</td>

																				
																			</tr>
																			
																			<!-- Modal-->
																			<div id="modal-#getCompleteEnrollment.currentrow#-#getEnrollments.currentrow#" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
																							<div class="modal-header">				
																								<h3 id="myModalLabel">#getCompleteEnrollment.course_sub#  #getCompleteEnrollment.course_num# - #getCompleteEnrollment.course_title#  - #getCompleteEnrollment.course_crn#</h3><br>
																								<h4>Comments for <i>#getEnrollments.student_first_name# #getEnrollments.student_last_name#</i></h4>
																							</div>
																							
																							
																						<div class="grid text-center alert alert-success hidden">
																							<button class="close" data-dismiss="alert" type="button">×</button>
																						</div>

																							<div class="modal-body">
																								
																								<input type="hidden" name="student_id"  value="#getEnrollments.id#" />
																								<input type="hidden" name="students_courses_id" class="students_courses_id" value="#getEnrollments.students_courses_id#" />
																								

																									<div class="control-group">
																									<label for="textarea" class="control-label"><strong>Comment</strong></label>
																										<div class="controls">
																										<textarea name="comment" rows="5" class="input-block-level comment"></textarea>
																										</div>
																									</div>

																								<div class="modal-footer">
																									<button type="btn btn-primary" class="btn btn-red commentButton">Save Comment</button>
																									<button class="btn btn-primary closeButton" data-dismiss="modal">Close</button>
																								</div>

																							</div>
																				</div>

																		</cfloop>
																			
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
												<!-- END FORM --> 
													</div>
												</div>
											</div>


										</cfoutput>
										

								</div> <!--- end of ACCORDION 2 --->
								</div>
							</div>
						</div>
					</div>

	</div><!-- end of container-fluid -->
	
</body>



 <script type="text/javascript">
       <cfoutput>
        $(function () {
           
                             
				$('.popup').click(function(event) {
				    event.preventDefault();
				    window.open($(this).attr("href"), "popupWindow", "width=600,height=600,scrollbars=yes");
				});
				


				$(".btn-small").click(function(e) {
					$('.grid').empty();
					$('.grid').addClass('hidden');
					
				});

							

				$('.atrisk').click(function() {
					if ($(this).is(':checked'))
				    {
				      var value = $(this).data('modal');

				      var crn = '#url.crn#' ;

				      //alert(value);
    				  $("##modal-" + value).modal("show");
    				  
    				  $( ".modal-body" ).removeClass("status");
    				  $( ".modal-body" ).removeClass("prof_id");

    				  //end user clicked the at-risk radio button. We'll append a hidden field where status=1 (at-risk)
    				  $('<input>').attr({
						    type: 'hidden',
						    class: 'status',
						    name: 'status',
						    value: 1
						}).appendTo('.modal-body');

    				   //end user clicked the at-risk radio button. We'll append a hidden field with crn
					  $('<input>').attr({
						    type: 'hidden',
						    class: 'crn',
						    name: 'crn',
						    value: crn
						}).appendTo('.modal-body');

				    }
				});


				$(".closeButton").click(function(e) {
						// var prof_id   	  	 = $(this).closest('.modal-body').find('.prof_id').val();
						// window.location.href = "courseenrollments.cfm?prof_id=" + prof_id ;
						var crn  = $(this).closest('.modal-body').find('.crn').val();

						if (! crn){
							var crn = #url.crn#;
						}

						window.location.href = "completeenrollments.cfm?crn=" + crn + "&course_dept=#urlencodedformat(url.course_dept)#&course_college=#urlencodedformat(url.course_college)#";
				});


				$(".commentButton").click(function(e) {
					e.preventDefault();
					//alert('BOOYAH');

					var students_courses_id = $(this).closest('.modal-body').find('.students_courses_id').val();
					var created_by       	= '#session.casuser.getusername()#' ;
					var comment 		  	= $(this).closest('.modal-body').find('.comment').val();
					var status              = $(this).closest('.modal-body').find('.status').val();

					if (!comment.trim()) {
					    alert('Comments are required! Please enter a comment now.');
					    return false;					    			   
					}
															
					var postString = "savecomments.cfm";

					//alert( postString );
					//alert( 'students_courses_id ' + students_courses_id );
					//alert( 'comment ' + comment );
					//alert( 'status ' + status );
					
					//alert( created_by );
					//return false;

					jQuery.post(
						postString,
						{
							students_courses_id: students_courses_id,
							comment:comment,
							created_by:created_by,
							status: status
							
						},

						//callback function
						function(data){
							$('.grid').removeClass('hidden');
							$('.grid').empty().append('Comment Saved! Please click the \'CLOSE\' button to continue');
						}
					)

									
				});


				$(".noissues").click(function(e) {
					//alert('Wide Open');
					var status  = $(this).closest('.controls').find('.noissues').val();
					//alert( 'status ' + status );
					var students_courses_id = $(this).data("students_courses_id");
					//alert( 'students_courses_id ' + students_courses_id );
					
					var crn = '#url.crn#' ;

					var postString = "savestatus.cfm";

					jQuery.post(
						postString,
						{
							students_courses_id: students_courses_id,
							status: status
							
						},

						//callback function
						function(data){
							window.location.href = "completeenrollments.cfm?crn=" + crn + "&course_dept=#urlencodedformat(url.course_dept)#&course_college=#urlencodedformat(url.course_college)#";
						}
					)
				});

				$(".outreach").click(function(e) {
					//alert('Wide Open');
					var status  = $(this).closest('.controls').find('.outreach').val();
					//alert( 'status ' + status );
					var students_courses_id = $(this).data("students_courses_id");
					//alert( 'students_courses_id ' + students_courses_id );
					
					var crn = '#url.crn#' ;

					var postString = "savestatus.cfm";

					jQuery.post(
						postString,
						{
							students_courses_id: students_courses_id,
							status: status
							
						},

						//callback function
						function(data){
							window.location.href = "completeenrollments.cfm?crn=" + crn + "&course_dept=#urlencodedformat(url.course_dept)#&course_college=#urlencodedformat(url.course_college)#";
						}
					)
				});
          
        });
        </cfoutput>
    </script>

</html>