<%@ page import="easytogo.Vehiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container">
		
		<div id="edit-vehiculo" class="content scaffold-edit" role="main">
		
		
			<h1>Añade una foto de tu vehículo!</h1>
  		<h5>Es importante que actualices la foto de tu vehículo para facilitar el encuentro a la hora de viajar.</h5>
  
  			<g:uploadForm url="[resource:vehiculoInstance, action:'upload_avatar']">
    <label for="avatar">Selecciona una foto (1 MB Máx.)</label>
    <input type="file" name="avatar" id="avatar" />
    
    <input type="submit" class="buttons" value="Añadir" />
  			</g:uploadForm>
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${vehiculoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${vehiculoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:vehiculoInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${vehiculoInstance?.version}" />
				<fieldset class="form">
					<g:render template="formEdit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
			</div>
	</body>
</html>
