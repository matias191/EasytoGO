<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-viaje" class="content scaffold-create" role="main">
			<h1>Publicar mi viaje</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${viajeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${viajeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:viajeInstance, action:'save']" class="form-horizontal">
				<fieldset >
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons" style="margin-botton:1em;">
				<div class="container">
					<div class="form-group">
					<label class="col-md-4 control-label" for="singlebutton"></label>
					<div class="col-md-4">
					<g:submitButton name="create" class="save btn btn-success btn-lg"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
					</div>
    			</div>	
				</fieldset>
			</g:form>
		</div>

	
	</body>
</html>
