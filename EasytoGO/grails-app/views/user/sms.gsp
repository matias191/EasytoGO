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
<h1>Verificación de teléfono</h1>
<p>Hemos enviado un SMS a tu teléfono ${telefono},
por favor ingresa el código recibido para completar el proceso de verificación.<p>

<p>Si no recibes el SMS en el transcurso de unos minutos, por favor intenta nuevamente.</p>
<br></br>
<p> Ante dudas o consultas puedes escribir a easytogo.viajescompartidos@gmail.com</p>

			<g:form action="verifSMS" method="GET">
				<g:hiddenField name="version" value="${userInstance?.version}" />
				
				<fieldset class="form">
					<div class="fieldcontain required">
						<label for="verifSMS">
							<g:message code="user.password.label" default="Ingrese el codigo recibido" />
							<span class="required-indicator">*</span>
						</label>
					<g:passwordField name="codigo" required="" value="${params.codigo}"/>
					</div>
				</fieldset>
				
				<fieldset class="buttons">
					<input type="submit" value="Verificar" class="btn btn-success btn-sm">
				</fieldset>
			</g:form>
	
		</div>
	</body>
</html>