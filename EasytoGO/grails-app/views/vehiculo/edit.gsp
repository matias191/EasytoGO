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
    		<br>
    		
  		    <input type="submit" class="buttons" value="Añadir" />
  			</g:uploadForm>
			<h1>Editar mi maquina</h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${vehiculoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${vehiculoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:vehiculoInstance, action:'update']" method="PUT" class="form-horizontal" >
				<g:hiddenField name="version" value="${vehiculoInstance?.version}" />
				<fieldset class="form">
					<g:render template="formEdit"/>
				</fieldset>
				<fieldset class="buttons">
					`<span class="col-md-3 control-label"></span>
					<div class="col-md-6">
					<g:actionSubmit class="save btn btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
				</fieldset>
			</g:form>
		</div>
			</div>
	<br>
	<br>
	</body>
</html>
