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
		
					<h1>Verification Succeed</h1>
				</div>
				<hr />
				<div class="large-12 columns">
					<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			Congratulation, Your email is verified successfully now you can add IP Cam stream details.
				</div>
			</div>
			
	</body>
</html>


