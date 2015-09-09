<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'vehiculos', 'error')} ">
	<label for="vehiculos">
		<g:message code="user.vehiculos.label" default="Vehiculos" />
		
	</label>

<ul class="one-to-many">
<g:each in="${userInstance?.vehiculos?}" var="v">
    <li><g:link controller="vehiculo" action="show" id="${v.id}">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehiculo" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehiculo.label', default: 'Vehiculo')])}</g:link>
</li>
</ul>
</div>
	</body>
</html>