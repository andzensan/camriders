
Hello ${userInstance?.username},
<br><br>
Please click the link below to confirm your email address:

<g:link  controller="confirm" params="[id:userInstance?.emailUUID]" base="${confirmationURL}">Click Here</g:link>