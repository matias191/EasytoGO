<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:javascript library='jquery' />
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
		
		<div id="create-vehiculo" class="content scaffold-create" role="main">
			<h1>Agrega tu vehículo</h1>
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
			<g:form url="[resource:vehiculoInstance, action:'save']" class="form-horizontal" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
				<div class="container">
					<div class="form-group">
						<label class="col-md-4 control-label" for="singlebutton"></label>
					<g:submitButton name="create" class="save btn btn-success btn-lg" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
					</div>
    			
				</fieldset>
			</g:form>
		</div>
	</body>
</html>










