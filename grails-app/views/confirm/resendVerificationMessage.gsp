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
		
					<h1>Verification email sent</h1>
				</div>
				<hr />
				<div class="large-12 columns">
					<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			Verification email has been sent to your email id, kindly verify email for create IP Cam Stream details.
				</div>
			</div>
			
	</body>
</html>
