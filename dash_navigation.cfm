<div id="navigation">
		<div class="container-fluid">
			<a href="index.cfm" id="brand">
			<cfoutput>
				#application.displayname#
			</cfoutput></a>
			
			<!---
			<a href="##" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation"><i class="icon-reorder"></i></a>
			--->
			
			<ul class='main-nav'>
				<!---
				<li class='active'>
					<a href="index.cfm">
						<span>Course Listing</span>
					</a>
				</li>
				--->
				
				<!---
					<cfdump var="#session#" label="dash_navigation" abort="true"/>
				--->
				
				<!---
				<li>
					<a href="##" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Navigate</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="index.cfm?event=showreportingunits">Reporting Units</a>
						</li>
						<li>
							<a href="index.cfm?event=reports">Reports</a>
						</li>
						<li>
							<a href="index.cfm?event=showUserDashboard">My Calendar</a>
						</li>
						<li>
							<a href="index.cfm?event=messagecenter">My Messages</a>
						</li>						
					</ul>
				</li>
				--->
				
				
				
			</ul>
			<div class="user">
				<ul class="icon-nav">
					
					<div class="dropdown">
						<a href="##" class='dropdown-toggle' data-toggle="dropdown">
							<i>
										<cfoutput>
											#session.casuser.getusername()#
										</cfoutput>
							</i>
						</a>
					<ul class="dropdown-menu pull-right">
						<li>
							<a href="index.cfm?event=logout">Sign out</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>