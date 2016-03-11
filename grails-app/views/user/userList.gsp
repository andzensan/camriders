<%@ page import="com.camriders.domains.CamRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>User List</title>
	</head>
	<body>
			<div class="row">
				<div class="large-12 columns">
		
					<h1>User List</h1>
				</div>
				<hr />
					
					<table>
						<thead>
							<tr>
					
								<g:sortableColumn property="username"
									title="${message(code: 'user.username.label', default: 'Username')}" />
					
								<g:sortableColumn property="password"
									title="${message(code: 'user.firstName.label', default: 'First Name')}" />
					
								<g:sortableColumn property="camURL"
									title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
					
								<g:sortableColumn property="dateCreated"
									title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />
					
								<g:sortableColumn property="lastUpdated"
									title="${message(code: 'user.lastLoginDate.label', default: 'Last Login')}" />
					
								<g:sortableColumn property="lastUpdated"
									title="${message(code: 'user.ipAddress.label', default: 'IP Address')}" />
					
								<g:sortableColumn property="status"
									title="${message(code: 'user.enabled.label', default: 'Status')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${usersList}" status="i" var="userInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
									<td>
											${fieldValue(bean: userInstance, field: "username")}
										</td>
					
									<td>
										${fieldValue(bean: userInstance, field: "firstName")}
									</td>
					
									<td>
										${fieldValue(bean: userInstance, field: "lastName")}
									</td>
					
									<td><g:formatDate date="${userInstance.dateCreated}" type="datetime" style="MEDIUM" timeStyle="SHORT"/></td>
					
									<td><g:formatDate date="${userInstance.lastLoginDate}" type="datetime" style="MEDIUM" timeStyle="SHORT"/></td>
					
									<td>
										${fieldValue(bean: userInstance, field: "ipAddress")}
									</td>
					
									<td><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
					
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${usersListSize}"/>
					</div>
				</div>
			</div>
			
	</body>
</html>
