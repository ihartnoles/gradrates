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
			
				
				<cfif session.gras.role gte 4 >
					<li class=''>
					 	<a href="main.cfm">College & Dept. Listing</a>	
					</li>
				</cfif>
				<cfif session.gras.role eq 8 >
					<li class=''>
					 	<a href="stats.cfm">Quick Stats</a>	
					</li>
				</cfif>
				
				<!--- 
					<cfdump var="#session#" label="dash_navigation" abort="true"/>
				
				--->
				<!---
				<li>
					
					<a href="##" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Main Menu</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="main.cfm">College & Dept. Listing</a>
						</li>
						<li>
							<a href="stats.cfm">Quick Statistics</a>
						</li>
						<!---
						<li>
							<a href="index.cfm?event=showUserDashboard">My Calendar</a>
						</li>
						<li>
							<a href="index.cfm?event=messagecenter">My Messages</a>
						</li>
						--->						
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
							<a href="logout.cfm">Sign out</a>
						</li>
					</ul>
				</div>
			</div>

			
		</div>
	</div>
<!---
	<div class="row-fluid">
		<div class="alert alert-info center span12">
				
				<div class="span2" <cfif session.gras.role eq 8 >style="font-weight:bold"</cfif>>
					<a href="setrole.cfm?role=8">ADMIN ACCESS</a>
				</div>
				
				<div class="span2" <cfif session.gras.role eq 4 >style="font-weight:bold"</cfif>>
					<a href="setrole.cfm?role=4">COLLEGE LEVEL ACCESS </a>
				</div> 
				
				<div class="span2" <cfif session.gras.role eq 2 >style="font-weight:bold"</cfif>> 
					<a href="setrole.cfm?role=2">DEPT. LEVEL ACCESS</a> 
				</div> 

				<div class="span2" <cfif session.gras.role eq 1 >style="font-weight:bold"</cfif>> 
					<a href="setrole.cfm?role=1">FACULTY LEVEL ACCESS</a>
				</div>
				
				<cfif StructKeyExists(session['gras'], "role")>
					<cfoutput>
					<b>#session.gras.role#</b>
					</cfoutput>
				</cfif>
				
		</div>
	</div>--->