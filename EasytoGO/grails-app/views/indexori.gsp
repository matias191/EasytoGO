<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main2" />
<title>Easy to GO</title>



</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="status" role="complementary">
		<h1>Qué deseas hacer?</h1>
		<ul>
			
			<li><a href="http://localhost:8080/EasytoGO/User/create">Registrarme</a></li>
			<sec:ifLoggedIn>
	
		<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link class="modelo" controller='Modelo' action= 'index'>ABM Modelo</g:link></li>
				<li><g:link class="marca" controller='Marca' action= 'index'>ABM Marca</g:link></li>
		</sec:ifAllGranted>
	</sec:ifLoggedIn>
	
			<li></li>
		</ul>
	</div>

	<div id="page-body" role="main">
		<h1>Bienvenido a Easy to Go</h1>
		<p>Viaja en forma económica, segura, ecológica y divertida...</p>
		

		<!--
			  <div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		 -->
	</div>
</body>
</html>
