<!---
 <cfdump var="#session#" abort="true" />
 --->
<cfswitch expression="#session.gras.role#">
	
	<cfcase value="8">
		<!--- admin role --->
		<!--- 
		<cfset session.gras.role = 8>
		<cfset session.gras.home_dept = "">
		<cfset session.gras.home_college = ""> 
		--->
		<cfset redirect="main.cfm" />
	</cfcase>

	<cfcase value="4">
		<!--- advisor role --->
		<!--- 
		<cfset session.gras.role = 4>
		<cfset session.gras.home_dept = "">
		<cfset session.gras.home_college = "College of Business">
		 --->
		<cfset redirect="main.cfm?course_college=" & session.gras.home_college />
	</cfcase>

	<cfcase value="2">
		<!--- department role --->
		<!--- 
		<cfset session.gras.role = 2>
		<cfset session.gras.home_dept = "Info Tech and Oper Mgmt"> 
		<cfset redirect="main.cfm?course_college=College%20of%20Business&course_dept=Info%20Tech%20and%20Oper%20Mgmt" />
		--->
		<cfset redirect="main.cfm?course_college=" & session.gras.home_college & "&course_dept=" & session.gras.home_dept />
	</cfcase>

	<cfdefaultcase>
		<!--- default to faculty --->
		<!---
		<cfset session.gras.role = 1>
		<cfset session.gras.home_dept = "Info Tech and Oper Mgmt">
		<cfset redirect="courseenrollments.cfm?prof_id=Z00009867&course_dept=Info%20Tech%20and%20Oper%20Mgmt&course_college=College%20of%20Business" /> 
		--->
		<cfif cgi.SERVER_NAME eq "10.16.8.235">
			<cfset redirect="courseenrollments.cfm?prof_id=Z23105885&course_college=" & session.gras.home_college & "&course_dept=" & session.gras.home_dept />
		<cfelse>
			<cfset redirect="courseenrollments.cfm?prof_id=" & session.casuser.getznumber() & "&course_college=" & session.gras.home_college & "&course_dept=" & session.gras.home_dept />
		</cfif>
		

	</cfdefaultcase>

</cfswitch>

<cflocation url="#redirect#" addtoken="true" />