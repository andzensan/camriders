<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Profile</title>
</head>
<body>
<div class="row">
		<div class="large-4 columns">

			<h1>Profile</h1>
		</div>
		<hr />
		 <g:if test="${flash.message}">
		    <div class="message">${flash.message}</div>
		  </g:if>
		  <g:form action="updateProfile" controller="profile">
		  	<g:hiddenField name="userId" value="${userInstance?.id}"/>
		    <fieldset>
					<div class="row">
						<div class="large-4 columns ${hasErrors(bean: userInstance, field: 'username', 'error')}">
							<label>User Name</label> <input type="text" name="username" value="${userInstance?.username}" readonly="readonly"/>
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')}">
							<label>Password </label> <input type="password" name="passwordHash" value="${userInstance?.passwordHash }" readonly="readonly" />
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns">
							<label>Phone Number</label> <input type="text" name="phoneNumber" placeholder="Please enter Phone Number" value="${userInstance?.phoneNumber}" /> 
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns">
							<label>Zip code </label> <input type="text" name="zipCode" placeholder="Please enter Zip code" value="${userInstance?.zipCode}" />
						</div>
					</div>
					
					<div class="row">
						<div class="large-4 columns ${hasErrors(bean: userInstance, field: 'firstName', 'error')}">
							<label>First Name</label> <input type="text" name="firstName" value="${userInstance?.firstName}" placeholder="Please enter First Name" maxlength="200"/>
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns ${hasErrors(bean: userInstance, field: 'lastName', 'error')}">
							<label>Last Name</label> <input type="text" name="lastName" value="${userInstance?.lastName}" placeholder="Please enter Last Name" maxlength="200"/>
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns ${hasErrors(bean: userInstance, field: 'gender', 'error')}">
							<label>Gender</label> <g:radio name="gender" value="male" checked="${userInstance?.gender?.equalsIgnoreCase('male') ? true : false}"/>Male  <g:radio name="gender" value="female" checked="${userInstance?.gender?.equalsIgnoreCase('female') ? true : false}"/>Female
						</div>
					</div>
					<div class="row">
						<div class="large-4 columns ${hasErrors(bean: userInstance, field: 'dob', 'error')}">
							<label>Birthdate</label>  <input type="text" id="birthDate" name="dob" value="<g:formatDate format="MM/dd/yyyy" date="${userInstance?.dob}"/>" maxlength="200" readonly="readonly"/>
						</div>
					</div>
			
					<div class="row">
						<div class="large-4 columns">
							<g:submitButton name="submit" class="button" value="Save"/>
							<g:link class="button"> Cancel</g:link>
						</div>
					</div>

				</fieldset>
		  </g:form>
	</div>
 
</body>
</html>
