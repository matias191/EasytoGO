<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	


<div class="container">
<h1>Verificación de dirección postal</h1>
<p>Recuerda que las verificaciones y calificaciones ayudan a los demás usuarios a elegirte para ser compañeros de viaje.</p>
<p>Hemos enviado una carta a la dirección ${direccion},
por favor ingresa el código que recibirás para completar el proceso de verificación.<p>

<p>Para ello inicia sesión, entra a tu perfil y en la sección Verificaciones encontrarás un link para ingresar el código.</p>

<p>Si no recibes la carta en el transcurso de 10 días, por favor escribenos a support@easytogo.com.ar</p>
	
		</div>
	</body>
</html>