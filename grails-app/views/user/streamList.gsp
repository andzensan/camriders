<%@ page import="com.camriders.domains.CamRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Streams List</title>
	</head>
	<body>
			<div class="row">
				<div class="large-12 columns">
		
					<h1>Streams List</h1>
				</div>
				<g:if test="${flash?.message}">
					${flash?.message}
				</g:if>
				<hr />
					
					<table>
						<thead>
							<tr>
							
								<g:sortableColumn property="camURL" title="${message(code: 'camRegistration.camURL.label', default: 'Cam URL')}" />
							
								<g:sortableColumn property="username" title="${message(code: 'camRegistration.username.label', default: 'Username')}" />
								
								<g:sortableColumn property="username" title="${message(code: 'camRegistration.username.label', default: 'Added By')}" />
							
								<g:sortableColumn property="dateCreated" title="${message(code: 'camRegistration.dateCreated.label', default: 'Date Created')}" />
							
								<g:sortableColumn property="lastUpdated" title="${message(code: 'camRegistration.lastUpdated.label', default: 'IP Address')}" />
							
								<g:sortableColumn property="status" title="${message(code: 'camRegistration.status.label', default: 'Status')}" />
								
								<th>Delete</th>
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${streamList}" status="i" var="camRegistrationInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
								<td><g:link action="show" id="${camRegistrationInstance.id}">${fieldValue(bean: camRegistrationInstance, field: "camURL")}</g:link></td>
							
								<td>${fieldValue(bean: camRegistrationInstance, field: "username")}</td>
								
								<td>${fieldValue(bean: camRegistrationInstance, field: "user.username")}</td>
							
								<td><g:formatDate date="${camRegistrationInstance.dateCreated}" type="datetime" style="MEDIUM" timeStyle="SHORT"/></td>
							
								<td>${fieldValue(bean: camRegistrationInstance, field: "ipAddress")}</td>
							
								<td><g:formatBoolean boolean="${camRegistrationInstance.status}" /></td>
								
								<td><a href="#" id="myModal${i}">Delete</a></td>
							
							</tr>
							
									 <script>
										$(document).ready(function() {
										    $("#myModal${i}").click(function(e) {
										    	$('#myModalDialog${i}').foundation('reveal', 'open');
										    });
										    $("#closeDialog${i}").click(function(e) {
										    	$('#myModalDialog${i}').foundation('reveal', 'close');
										    });
										  });
										</script>
									    <div id="myModalDialog${i}" class="reveal-modal tiny">
										    <h2>Are you sure you want to delete this record?</h2>
											  <a id="confirmDelete${i}" class="tiny.button button" href="${createLink(action: 'deleteStream', controller:'user', id : camRegistrationInstance?.id)}">Delete</a>
											  <a class="tiny.secondary button" id="closeDialog${i}">Cancel</a>
										</div>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${streamListSize}" />
					</div>
				</div>
			
	</body>
</html>
