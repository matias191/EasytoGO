<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'vehiculos', 'error')} ">
	<label for="vehiculos">
		<g:message code="usuario.vehiculos.label" default="Vehiculos" />
		
	</label>

<ul class="one-to-many">
<g:each in="${usuarioInstance?.vehiculos?}" var="v">
    <li><g:link controller="vehiculo" action="show" id="${v.id}">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehiculo" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehiculo.label', default: 'Vehiculo')])}</g:link>
</li>
</ul>
</div>
	</body>
</html>