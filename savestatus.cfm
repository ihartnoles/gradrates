<!-- 
	need to check for existing status!
	If a status exists then UPDATE
	otherwise INSERT NEW RECORD!
-->

<cfquery name="getExistingStatus" datasource="#application.dsn#">
	select top 1 * 
	from status 
	where  student_course_id = <cfqueryparam value="#form.students_courses_id#" CFSQLType="cf_sql_integer" />
</cfquery>


<cfif getExistingStatus.recordcount >
	<!-- its an existin record we need to update it -->
	<cfquery name="updatestatus" datasource="#application.dsn#">
		UPDATE status
		SET 
			status = <cfqueryparam value="#form.status#" CFSQLType="cf_sql_varchar" />
		WHERE id   = <cfqueryparam value="#getExistingStatus.id#" CFSQLType="cf_sql_integer" />
	</cfquery>

<cfelse>
	<!-- insert new record -->
	<cfif len(trim(form.status))>
		<cfquery name="savestatus" datasource="#application.dsn#">
		INSERT INTO status (student_course_id, status, created_by)
		VALUES (
				 <cfqueryparam value="#form.students_courses_id#" CFSQLType="cf_sql_integer" />,
				 <cfqueryparam value="#form.status#" CFSQLType="cf_sql_varchar" />,
				 <cfqueryparam value="#session.casuser.getusername()#" CFSQLType="cf_sql_varchar" />
				)
		</cfquery>
	</cfif>
</cfif>




