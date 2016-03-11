
<%@ page import="com.camriders.domains.CamRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camRegistration.label', default: 'CamRegistration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-camRegistration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-camRegistration" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="camURL" title="${message(code: 'camRegistration.camURL.label', default: 'Cam URL')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'camRegistration.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'camRegistration.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'camRegistration.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'camRegistration.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'camRegistration.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${camRegistrationInstanceList}" status="i" var="camRegistrationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${camRegistrationInstance.id}">${fieldValue(bean: camRegistrationInstance, field: "camURL")}</g:link></td>
					
						<td>${fieldValue(bean: camRegistrationInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: camRegistrationInstance, field: "password")}</td>
					
						<td><g:formatDate date="${camRegistrationInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${camRegistrationInstance.lastUpdated}" /></td>
					
						<td><g:formatBoolean boolean="${camRegistrationInstance.status}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${camRegistrationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
