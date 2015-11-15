<%@ page import="easytogo.Viaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="edit-viaje" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${viajeInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${viajeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:viajeInstance, action:'update']" method="PUT" class="form-horizontal" >
				<g:hiddenField name="version" value="${viajeInstance?.version}" />
				<fieldset >
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
				<div class="container">
					<div class="form-group">
					<label class="col-md-4 control-label" for="singlebutton"></label>
					<div class="col-md-4">
					<g:actionSubmit class="save btn btn-success btn-lg" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</div>
					</div>
    			</div>	
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
