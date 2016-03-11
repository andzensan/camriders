<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>
<div class="row">
		<div class="large-8 columns">

			<h1>Login</h1>
		</div>
		<hr />
		 <g:if test="${flash.message}">
		    <div class="message">${flash.message}</div>
		  </g:if>
		  <g:form action="signIn">
		    <input type="hidden" name="targetUri" value="${targetUri}" />
		    <fieldset>
					<div class="row">
						<div class="large-6 columns">
							<label>User Name</label> <input type="text" name="username" value="${username}" maxlength="200" placeholder="Please enter your email"/>
						</div>
					</div>
					<div class="row">
						<div class="large-6 columns">
							<label>Password </label> <input type="password" name="password" value=""  maxlength="50"/>
						</div>
					</div>
					<%--<div class="row">
						<div class="large-6 columns">
							Remember me?:<g:checkBox name="rememberMe" value="${rememberMe}" />
						</div>
					</div>
					--%>
					<div class="row">
						<div class="large-6 columns">
							<g:submitButton name="submit" class="button" value="Login"/>
							<g:link class="button" action="register" controller="auth"> Register</g:link>
                            <g:link class="button" action="forgotPassword" controller="auth"> Forgot Password</g:link>
						</div>
					</div>

				</fieldset>
		  </g:form>
	</div>
 
</body>
</html>
