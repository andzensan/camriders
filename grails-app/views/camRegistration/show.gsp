
<%@ page import="com.camriders.domains.CamRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camRegistration.label', default: 'CamRegistration')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-camRegistration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-camRegistration" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list camRegistration">
			
				<g:if test="${camRegistrationInstance?.camURL}">
				<li class="fieldcontain">
					<span id="camURL-label" class="property-label"><g:message code="camRegistration.camURL.label" default="Cam URL" /></span>
					
						<span class="property-value" aria-labelledby="camURL-label"><g:fieldValue bean="${camRegistrationInstance}" field="camURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camRegistrationInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="camRegistration.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${camRegistrationInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camRegistrationInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="camRegistration.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${camRegistrationInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camRegistrationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="camRegistration.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${camRegistrationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${camRegistrationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="camRegistration.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${camRegistrationInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${camRegistrationInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="camRegistration.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${camRegistrationInstance?.status}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${camRegistrationInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="camRegistration.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${camRegistrationInstance?.user?.id}">${camRegistrationInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${camRegistrationInstance?.id}" />
					<g:link class="edit" action="edit" id="${camRegistrationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
