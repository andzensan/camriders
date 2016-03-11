<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Camriders</title>

</head>
<body>
	<div class="row">
		<div class="large-12 columns">
			<h1>${camRegistrationInstance?.name}</h1>
			
			<p>${camRegistrationInstance?.modelIpCam}</p>
			<hr />
			<div id='playerurwHainvdbPu'></div>
<script type='text/javascript'>
    jwplayer('playerurwHainvdbPu').setup({
        file: '${camRegistrationInstance?.wowzaURL?:(camRegistrationInstance.id % 2 == 0)?'rtmp://87.106.222.225:1935/test/cam2.stream':'rtmp://87.106.222.225:1935/test/cam1.stream'}',
        title: 'Test',
        width: '100%',
        aspectratio: '16:9',
        fallback: 'false',
        autostart: 'true',
        primary: 'flash'
    });
</script>


	</div>
</body>
</html>
