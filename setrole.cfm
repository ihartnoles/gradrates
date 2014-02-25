
<cfswitch expression="#url.role#">
	
	<cfcase value="8">
		<!--- admin role --->
		<cfset session.gras.role = 8>
		<cfset session.gras.home_dept = "">
		<cfset session.gras.home_college = "">
		<cfset redirect="index.cfm" />
	</cfcase>

	<cfcase value="4">
		<!--- advisor role --->
		<cfset session.gras.role = 4>
		<cfset session.gras.home_dept = "">
		<cfset session.gras.home_college = "College of Business">
		<cfset redirect="index.cfm?course_college=College%20of%20Business" />
	</cfcase>

	<cfcase value="2">
		<!--- department role --->
		<cfset session.gras.role = 2>
		<cfset session.gras.home_dept = "Info Tech and Oper Mgmt">
		<cfset redirect="index.cfm?course_college=College%20of%20Business&course_dept=Info%20Tech%20and%20Oper%20Mgmt" />
	</cfcase>

	<cfdefaultcase>
		<!--- default to faculty --->
		<cfset session.gras.role = 1>
		<cfset session.gras.home_dept = "Info Tech and Oper Mgmt">
		<cfset redirect="courseenrollments.cfm?prof_id=Z00009867&course_dept=Info%20Tech%20and%20Oper%20Mgmt&course_college=College%20of%20Business" />
	</cfdefaultcase>

</cfswitch>

<cflocation url="#redirect#" addtoken="true" />