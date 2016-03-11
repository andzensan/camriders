<%--<script>
$(document).ready(function() {
    $("#myModal").click(function(e) {
    	$('#myModalDialog').foundation('reveal', 'open');
    });
    $("#closeDialog").click(function(e) {
    	$('#myModalDialog').foundation('reveal', 'close');
    });
  });
</script>


--%>
<table style="width: 100%">
  <thead>
    <tr>
      <th width="60%">IP CAM Dyndns URL</th>
      <th width="20%">Username</th>
       <th width="60%">Model of IpCam</th>
      <th width="5%">Delete</th>
    </tr>
  </thead>
  <tbody>
  	<g:if test="${camRegistrationInstanceList?.size() > 0 }">
	  	<g:each in="${camRegistrationInstanceList}" status="i" var="camRegistrationInstance">
		    <tr>
		      <td>${camRegistrationInstance.camURL}</td>
		      <td>${camRegistrationInstance.username}</td>
                <td>${camRegistrationInstance.modelIpCam}</td>
		      <td><a href="#" id="myModal${i}">Delete</a></td>
		    </tr>
		    
		    <script>
			$(document).ready(function() {
			    $("#myModal${i}").click(function(e) {
			    	$('#myModalDialog${i}').foundation('reveal', 'open');
			    });
			    $("#closeDialog${i}").click(function(e) {
			    	$('#myModalDialog${i}').foundation('reveal', 'close');
			    });
			  });
			</script>
		    <div id="myModalDialog${i}" class="reveal-modal tiny">
			    <h2>Are you sure you want to delete this record?</h2>
				  <a id="confirmDelete${i}" class="tiny.button button" href="${createLink(action: 'delete', controller:'camRegistration', id : camRegistrationInstance?.id)}">Delete</a>
				  <a class="tiny.secondary button" id="closeDialog${i}">Cancel</a>
			</div>
	    </g:each>
    </g:if>
    <g:else>
    	<tr>
	      <td colspan="3" style="text-align: center">No record found</td>
	    </tr>
    </g:else>
  </tbody>
</table>
 <div class="pagination-centered">
 		<div class="pagination">
			<g:paginate total="${camRegistrationInstanceTotal?:0}" next="&#62;&#62;" prev="&#60;&#60;" action="create" />
		</div>
	</div>
<%--<div id="myModalDialog" class="reveal-modal tiny">
    <h2>Are you sure you want to delete this record?</h2>
	  <a id="confirmDelete" class="tiny.button button" href="${createLink(action: 'delete', controller:'camRegistration')}">Delete</a>
	  <a class="tiny.secondary button" id="closeDialog">Cancel</a>
</div>


--%><%--<ul id="deleteItem">
    <li><a href="10">Click Me</a></li>
    <li><a href="20">Click Me</a></li>
    <li><a href="30">Click Me</a></li>
</ul>

<div id="myModal" class="reveal-modal">
    <h2>Are you sure you want to delete <span id="targetName">error</span>?</h2>
  <a id="confirmDelete" href="setMe">Yes</a>
  <a class="close-reveal-modal">Cancel</a>
</div>
--%>
