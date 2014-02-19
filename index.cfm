<!doctype html class="no-js">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	
	<title><cfoutput>#application.displayname#</cfoutput></title>

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
	
	<!-- Just for demonstration 
	<script src="js/demonstration.min.js"></script>
-->
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


<cfquery name="getCourses" datasource="#application.dsn#">
SELECT   DISTINCT     Courses.course_sub, Courses.course_num, Courses.course_title, Courses.course_crn, Professors.prof_id, Professors.prof_first_name, Professors.prof_last_name
FROM     Courses INNER JOIN
                         Professors_Courses ON Courses.id = Professors_Courses.course_id INNER JOIN
                         Professors ON Professors_Courses.prof_id = Professors.id
WHERE Professors.prof_id = 'Z00010456'
ORDER BY Professors.prof_id
</cfquery>

<!-- 
<cfdump var="#getCourses#" abort="false" />
-->

<body class="theme-darkblue" data-theme="theme-darkblue">
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
										Spring 2014 - Courses Taught
									</h3>
								</div>
								<div class="box-content">
									<div id="accordion2" class="accordion">
										
										
										<cfoutput query="getCourses">


											<cfquery name="getEnrollments" datasource="#application.dsn#">
												SELECT   DISTINCT     Students.id, Students.student_id, Students.student_last_name, Students.student_first_name, Courses.course_crn, Courses.course_sub, 
												                         Courses.course_num, Courses.course_title, Students_Courses.ID as students_courses_id
												FROM            Students INNER JOIN
												                         Students_Courses ON Students.id = Students_Courses.student_id INNER JOIN
												                         Courses ON Students_Courses.course_id = Courses.id

												WHERE Courses.course_crn = #getCourses.course_crn#

												order by Students.student_last_name, Students.student_id ,  Courses.course_crn
											</cfquery>
											
											<!-- 
											<cfdump var="#getEnrollments#" label="getEnrollments" />
											-->

											<div class="accordion-group">
												<div class="accordion-heading">
													<h4>
													<a href="##collapse#getCourses.currentrow#" data-parent="##accordion2" data-toggle="collapse" class="accordion-toggle">
														<i class="glyphicon-book"></i> #getCourses.course_sub#  #getCourses.course_num# - #getCourses.course_title#  - #getCourses.course_crn#
													</a>
													</h4>
												</div>
												<div class="accordion-body in collapse"  id="collapse#getCourses.currentrow#" style="height: auto;">
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
																			<tr>
																				<td>#getEnrollments.student_last_name#</td>
																				<td>
																					#getEnrollments.student_first_name#
																				</td>
																				<td class="hidden-350">
																					<div class="control-group">
																						<!-- <label class="control-label">Radios</label> -->
																						<div class="controls">
																							<label class="radio">
																								<input type="radio" name="atrisk-#getCourses.currentrow#-#getEnrollments.currentrow#" value="1" class="atrisk" data-modal="#getCourses.currentrow#-#getEnrollments.currentrow#" <cfif getStatuses.status EQ 1>checked</cfif>> At-Risk
																							</label>
																							<label class="radio">
																								<input type="radio" class="noissues" name="atrisk-#getCourses.currentrow#-#getEnrollments.currentrow#" value="0" data-students_courses_id="#getEnrollments.STUDENTS_COURSES_ID#" <cfif getStatuses.status EQ 0>checked</cfif>> No issues
																							</label>																							
																						</div>
																					</div>
																				</td>
																				<td class="hidden-1024">
																				   <a href="##modal-#getCourses.currentrow#-#getEnrollments.currentrow#" role="button" class="btn btn-small btn-darkblue" data-toggle="modal" data-checklistTypeid="1">
																																	<i class="icon-plus-sign"></i>
																																		Add a comment
																																	</a>
																				  <a href="viewcomments.cfm?student_course_id=#getEnrollments.students_courses_id#" role="button" class="btn btn-small btn-red popup">
																																<i class="icon-search"></i>
																																View comments</a>	
		
																				</td>
																				
																			</tr>
																			
																			<!-- Modal-->
																			<div id="modal-#getCourses.currentrow#-#getEnrollments.currentrow#" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
																							<div class="modal-header">				
																								<h3 id="myModalLabel">#getCourses.course_sub#  #getCourses.course_num# - #getCourses.course_title#  - #getCourses.course_crn#</h3><br>
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
				      //alert(value);
    				  $("##modal-" + value).modal("show");
    				  
    				  $( ".modal-body" ).removeClass("status");


    				  //end user clicked the at-risk radio button. We'll append a hidden field where status=1 (at-risk)
    				  $('<input>').attr({
						    type: 'hidden',
						    class: 'status',
						    name: 'status',
						    value: 1
						}).appendTo('.modal-body');

				    }
				});


				$(".closeButton").click(function(e) {
						window.location.href = "index.cfm";
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
					alert( 'students_courses_id ' + students_courses_id );
					alert( 'comment ' + comment );
					alert( 'status ' + status );
					
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
					
					var postString = "savestatus.cfm";

					jQuery.post(
						postString,
						{
							students_courses_id: students_courses_id,
							status: status
							
						},

						//callback function
						function(data){
							window.location.href = "index.cfm";
						}
					)
				});
          
        });
        </cfoutput>
    </script>

</html>