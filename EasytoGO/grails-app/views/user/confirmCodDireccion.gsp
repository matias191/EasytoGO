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
<h3>Verificación de dirección postal</h3>


			<g:form action="verifCodDireccion" method="GET">
				<g:hiddenField name="version" value="${userInstance?.version}" />
				
				<fieldset class="form">
					<div class="fieldcontain required">
						<label for="verifSMS">
							<g:message code="user.password.label" default="Ingrese el código recibido en la carta" />
							<span class="required-indicator">*</span>
						</label>
					<g:passwordField name="codigo" required="" value="${params.codigo}"/>
					</div>
					<p>Si no recibes la carta en el transcurso de 10 días, por favor escribenos a easytogo.viajescompartidos@gmail.com</p>
				</fieldset>
				
				<fieldset class="buttons">
					<input type="submit" value="Verificar" class="btn btn-success btn-sm">
				</fieldset>
			</g:form>
	
		</div>
	</body>
</html>