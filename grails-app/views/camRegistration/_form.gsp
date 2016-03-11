<%@ page import="com.camriders.domains.CamRegistration"%>



<div
	class="row ${hasErrors(bean: camRegistrationInstance, field: 'camURL', 'error')} required">
	<label for="camURL"> <g:message
			code="camRegistration.camURL.label"
			default="IP Cam rtsp stream dynamic DNS URL" /> (Only rtsp streams
		are currently accepted e.g. rtsp://mystream.no-ip.org/cam1.cgi ) <span
		class="required-indicator">*</span>
	</label>
	<g:textArea name="camURL" cols="40" rows="5" maxlength="2100"
		value="${camRegistrationInstance?.camURL}" />

</div>
<div
	class="row ${hasErrors(bean: camRegistrationInstance, field: 'name', 'error')} required">
	<label for="modelIpCam"> <g:message
			code="camRegistration.name.label" default="Stream name" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="name" cols="40" rows="5" maxlength="250"
		value="${camRegistrationInstance?.name}" autocomplete="off" />
</div>
<div
	class="row ${hasErrors(bean: camRegistrationInstance, field: 'modelIpCam', 'error')} required">
	<label for="modelIpCam"> <g:message
			code="camRegistration.modelIpCam.label" default="Model of IPCam" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modelIpCam" cols="40" rows="5" maxlength="250"
		value="${camRegistrationInstance?.modelIpCam}" autocomplete="off" />
</div>


<div
	class="row ${hasErrors(bean: camRegistrationInstance, field: 'username', 'error')}">
	<label for="username"> <g:message
			code="camRegistration.username.label" default="Username" />
	</label>
	<g:textField name="username" maxlength="100"
		value="${camRegistrationInstance?.username}" autocomplete="off" />
</div>

<div
	class="row ${hasErrors(bean: camRegistrationInstance, field: 'password', 'error')}">
	<label for="password"> <g:message
			code="camRegistration.password.label" default="Password"
			autocomplete="off" />
	</label>
	<g:passwordField name="password" maxlength="150" value="" />
</div>
<div
	class="row">
	<label for="tags">Tags
	</label>
	 <g:render template="/tags"></g:render>
</div>



