<%@ page import="com.camriders.domains.CamRegistration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camRegistration.label', default: 'CamRegistration')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
			<div class="row">
				<div class="large-12 columns">
		
					<h1>IP Cam registration</h1>
				</div>
				<hr />
				<g:if test="${userInstance?.phoneNumber == null || userInstance?.zipCode == null}">
					<div data-alert class="alert-box info radius">
						Following steps require before post stream. You cannot post unless these additional details are set.
					</div>
				</g:if>
				<div class="large-12 columns">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
			
			<g:hasErrors bean="${camRegistrationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${camRegistrationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
					<g:if test="${userInstance?.isVerified == false || userInstance?.phoneNumber == null || userInstance?.zipCode == null}">
						<g:if test="${userInstance?.isVerified == false }">
							-> Please go to your inbox and verify your email address than only you can add IP Cam Details.<br>
							 	If your not get any verification email you can send verifcation mail again by
								<g:link action="resendVerificationEmail" controller="confirm">Click Here</g:link>
						</g:if>
						<g:if test="${!userInstance?.phoneNumber}">
							<br><br> -> Please update Phone Number from Profile page.	
						</g:if>
						<g:if test="${!userInstance?.zipCode}">
								<br><br> -> Please update Zip code from Profile page.	
						</g:if>
					</g:if>
					<g:else>
					<g:form action="save" >
						<fieldset class="form">
							<g:render template="form"/>
							<br>
							<div class="row">
								<div class="large-12 columns">
									<g:submitButton name="submit" class="button" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
								</div>
							</div>
						</fieldset>
						<g:render template="camRegistrationList"></g:render>							
					</g:form>
					</g:else>
				</div>
			</div>
			
	</body>
</html>
