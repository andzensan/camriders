<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Camriders" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
<script src="${resource(dir: 'js/vendor', file: 'custom.modernizr.js')}"></script>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.9.2.custom.css')}">
 <script src="${resource(dir: 'js', file: 'jquery-1.9.1.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery-ui.js')}"></script>
<script>
	$(function() {
		$( "#birthDate").datepicker({ dateFormat: 'mm/dd/yy' });
	});
</script> 
<script src="http://jwpsrv.com/library/w115giwOEeOcthIxOUCPzg.js"></script>
<script src="js/foundation/foundation.js"></script>
 <script src="js/foundation/foundation.reveal.js"></script>
 
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<nav class="top-bar ">
		<section class="top-bar-section">
			<ul class="left">
				<li class="divider"></li>
				<li <g:if test="${request?.getRequestURI()==createLink(uri: "/")}">class="active"</g:if>><a href="${createLink(uri: '/')}">Home</a></li>
				<li class="divider"></li>
				<li <g:if test="${request?.getRequestURI()==createLink(uri: "/about/")}">class="active"</g:if>><a href="${createLink(uri: '/about/')}">About Us</a></li>
				<li class="divider"></li>
				<li <g:if test="${request?.getRequestURI()==createLink(uri: "/setup/")}">class="active"</g:if>> <g:link action="create" controller="camRegistration"> Setup of IP Cam</g:link></li>

				<shiro:isNotLoggedIn>
					<li class="divider"></li>
					<li><g:link action="login" controller="auth">Login</g:link></li>
				</shiro:isNotLoggedIn>
				<shiro:isLoggedIn>	
					<li class="divider"></li>

					<li><g:link controller="profile">Profile</g:link></li>
                        <shiro:hasPermission permission="profile:activityLog">
                        	<li class="divider"></li>
                            <li <g:if test="${request?.getRequestURI()==createLink(uri: "/activity/")}">class="active"</g:if>> <g:link action="activityLog" controller="profile"> Activity</g:link></li>
                        </shiro:hasPermission>
				</shiro:isLoggedIn>
				
				<shiro:hasPermission permission="user:*">
                  	<li class="divider"></li>
                      <li> <g:link action="userList" controller="user"> User</g:link></li>
                  </shiro:hasPermission>
                  
                  <shiro:hasPermission permission="user:*">
                  	<li class="divider"></li>
                      <li> <g:link action="streamList" controller="user"> Added Streams</g:link></li>
                  </shiro:hasPermission>
			</ul>
			<shiro:isLoggedIn>	
				<ul class="right">
					<li class="divider"></li>
					<li><a href="#"><shiro:principal/></a></li>
					
					<li class="divider"></li>
					<li><g:link action="signOut" controller="auth">Logout</g:link></li>
					
				</ul>
			</shiro:isLoggedIn>	
		</section>
	</nav>

	<g:layoutBody />


	<footer class="row">
		<div class="large-12 columns">
			<hr />
			<div class="row">
				<div class="large-6 columns">
					<p>&copy; Camriders 2013.</p>
				</div>
			</div>
		</div>
	</footer>
	<g:javascript library="application" />
	<script>
		document.write('<script src='
				+ ('__proto__' in {} ? 'js/vendor/zepto' : 'js/vendor/jquery')
				+ '.js><\/script>')
	</script>

	<g:javascript src="foundation/foundation.js" />
	<g:javascript src="foundation/foundation.alerts.js" />
	<g:javascript src="foundation/foundation.clearing.js" />
	<g:javascript src="foundation/foundation.cookie.js" />
	<g:javascript src="foundation/foundation.dropdown.js" />
	<g:javascript src="foundation/foundation.forms.js" />
	<g:javascript src="foundation/foundation.joyride.js" />
	<g:javascript src="foundation/foundation.magellan.js" />
	<g:javascript src="foundation/foundation.orbit.js" />
	<g:javascript src="foundation/foundation.placeholder.js" />
	<g:javascript src="foundation/foundation.reveal.js" />
	<g:javascript src="foundation/foundation.section.js" />
	<g:javascript src="foundation/foundation.tooltips.js" />
	<g:javascript src="foundation/foundation.topbar.js" />
	<g:javascript src="foundation/foundation.interchange.js" />
	<script>
		$(document).foundation();
	</script>
	<r:layoutResources />
</body>
</html>
