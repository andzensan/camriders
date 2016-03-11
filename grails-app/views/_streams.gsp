<%@page import="com.camriders.domains.CamRegistration"%>
<%
	params.max=9
	def camRegistrations = streams?:CamRegistration.list(params)
	def camRegistrationCount = streams?.size()?:CamRegistration.count()
 %>

<g:each in="${camRegistrations}" var="cam" status="i">
	<g:if test="${(i%3)==0||i==0}">
		<div class="row">
	</g:if>

	<div class="large-4 columns">
			<img src="http://placehold.it/250x200&text=Video" />
		<h6 class="panel">
			<g:link controller="stream" action="view" id="${cam.id}">
			${ cam?.name?:cam?.modelIpCam}
			</g:link>
		</h6>
	</div>
	<g:if test="${((i+1)%3)==0||i==(camRegistrations.size()-1)}">

		</div>
	</g:if>
</g:each>
<div class="pagination-centered">
	<div class="pagination">
		<g:paginate max="9" total="${camRegistrationCount}" />
	</div>
</div>
<div class="pagination-centered">
	<%--
	
	<ul class="pagination">
		<li class="arrow unavailable"><a href="">&laquo;</a></li>
		
		<li class="current"><a href="">1</a></li>
		<li><a href="">2</a></li>
		<li><a href="">3</a></li>
		<li><a href="">4</a></li>
		<li class="unavailable"><a href="">&hellip;</a></li>
		<li><a href="">12</a></li>
		<li><a href="">13</a></li>
		<li class="arrow"><a href="">&raquo;</a></li>
	</ul>--%>
</div>
