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
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${assetPath(src: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${assetPath(src: 'apple-touch-icon-retina.png')}">
<asset:stylesheet src="application.css" />
<asset:javascript src="application.js" />

 


 
 
<g:layoutHead />
</head>
<body>
	
	<div id="grailsLogo" role="banner">
		<a href="http://grails.org"><asset:image src="easy_to_go.png"
				alt="Grails" /></a>
	
<%--	<span><a href="http://localhost:8080/EasytoGO/User/create">Registrarme</a></span>--%>
	
<%--	<span><a href="http://localhost:8080/EasytoGO/Marca">ABM Marca</a></span>--%>
<%--	<span><a href="http://localhost:8080/EasytoGO/Modelo">ABM Modelo</a></span>--%>
	<!-- <span>
	 <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Entrar</button>
          </form>
	</span>
	 -->
	 
	 <%--

para saber que usuario inicio sesion
value="${sec.username()}
value="${sec.loggedInUserInfo(field: 'username')}
<sec:loggedInUserInfo field="username"/>
 

	--%>
	
<%--<span class="property-value" aria-labelledby="usuario-label">${sec.username() ? 'Logueado como:': ''}</span>
<g:if test="${ sec }">
   
    <g:remoteLink class="logout" controller="logout">Salir</g:remoteLink>
</g:if>

--%>

<span class="property-value" aria-labelledby="usuario-label">
	<sec:ifLoggedIn>
		<g:link class="editar" controller='User' action= 'show' id="${sec.loggedInUserInfo(field:'id') }" >Editar</g:link>
	
		<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:link class="modelo" controller='Modelo' action= 'index'>ABM Modelo</g:link>
				<g:link class="marca" controller='Marca' action= 'index'>ABM Marca</g:link>
				<g:link>Reportes</g:link>
		</sec:ifAllGranted>
		
		Bienvenido  <sec:username/>!
		(<g:link class="logout" controller='logout' action= 'index' method="POST">Salir</g:link>)
		<%--(<g:link class="logout" controller='Logout' action= 'index'>Salir</g:link>)--%>
		<%--(<g:remoteLink class="logout" controller='Logout' action= 'index'>Salir</g:remoteLink>)--%>
		
	</sec:ifLoggedIn>

	<sec:ifNotLoggedIn>
		<g:link controller='User' action='create'>Registrarme</g:link>
		<g:link controller='login' action='auth'>Login</g:link>
		
	</sec:ifNotLoggedIn>
	
	<g:link class="viaje" controller='Viaje' action= 'create'>Publica tu viaje!</g:link>
	<g:link class="reserva" controller='Viaje' action= 'buscaViaje'>Busca tu viaje!</g:link>
</span>	

</div>
	  
	 
	 
	
	<g:layoutBody />
	<div class="footer" role="contentinfo">
		<p>Esto es el footer</p>
	</div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
</body>
</html>
