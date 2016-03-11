<%@page import="com.camriders.domains.Tag"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Camriders</title>

</head>
<body>
	<div class="row">
		<div class="large-12 columns">

			<h1>Welcome to Camriders</h1>

			<p>This is version 0.1</p>
			<hr />
		</div>
	</div>
	<div class="row">
		<div class="large-9 columns">
			<h3>The Streams</h3>
			<div class="row">

				<div class="panel">
					<h6>Tag Filter</h6>
					<g:formRemote name="tags"
						url="[controller:'stream', action: 'list']"
						update="[success:'view',failure:'blia']" asynchronous="true">
						<g:each in="${Tag.list()}" var="tag">
							<g:submitButton name="tag_${tag.id}" value="${tag.title}"
								class="round secondary label"
								onclick="changeTagClass('tag_${tag.id}')" />
						</g:each>
						<g:hiddenField name="selected" value="" />
					</g:formRemote>
				</div>
			</div>
			<div id="blia"></div>
			<div id="view">
				<g:render template="/streams"></g:render>
			</div>


		</div>
		<div class="large-3 columns">
			<h3>Getting Started</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Phasellus hendrerit velit ut felis fermentum tincidunt. Lorem ipsum
				dolor sit amet, consectetur adipiscing elit.</p>
			<a href="#" class="button">Open Tutorial</a>
		</div>

	</div>

	<script type="text/javascript">
		function changeTagClass(id) {
			var className = document.getElementById(id).className;
			if (className.search('secondary') > -1) {
				document.getElementById(id).className = "round label";
			} else {
				document.getElementById(id).className = "round secondary label";
			}
			var selected = document.getElementsByClassName('round label');
			document.getElementById('selected').value = "";
			for (i = 0; i < selected.length; i++) {
				if (selected[i].className.search('secondary') <= -1) {
					document.getElementById('selected').value += selected[i].id.substring(4) + ' ';
				}
			}
		}
	</script>
</body>
</html>
