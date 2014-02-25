<!--- security redirects --->

<cfif structKeyExists(session['gras'], "role")>
	
	<cfif session.gras.role EQ 1 AND session.gras.home_dept NEQ url.course_dept>
		<!--- your a faculty memeber. you shouldn't be here --->
		<cflocation url="unauthorized.cfm" />
	</cfif>

	<cfif session.gras.role EQ 2 AND session.gras.home_dept NEQ url.course_dept>
		<!--- your a dept memeber. you shouldn't be here --->
		<cflocation url="unauthorized.cfm" />
	</cfif>

	<cfif session.gras.role EQ 4 AND session.gras.home_college NEQ url.course_college>
		<!--- your an advisor. you shouldn't be here --->
		<cflocation url="unauthorized.cfm" />
	</cfif>

<cfelse>
	<!--- OMGWTFBBQSAUCE --->
	<cflocation url="unauthorized.cfm" />
</cfif>

<!--- security redirects --->