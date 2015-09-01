
<%@ page import="easytogo.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" />(vuela mas adelante)</g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" />(vuela mas adelante)</g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="usuario.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${usuarioInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fecNac}">
				<li class="fieldcontain">
					<span id="fecNac-label" class="property-label"><g:message code="usuario.fecNac.label" default="Fecha de Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fecNac-label"><g:formatDate date="${usuarioInstance?.fecNac}" format="yyyy-MM-dd" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="usuario.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label">${usuarioInstance.sexo == 1 ? 'Masculino' : 'Femenino'}</span>
					
					
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="usuario.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${usuarioInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="usuario.telefono.label" default="Teléfono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${usuarioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="usuario.direccion.label" default="Dirección" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${usuarioInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fecVencCarnet}">
				<li class="fieldcontain">
					<span id="fecVencCarnet-label" class="property-label"><g:message code="usuario.fecVencCarnet.label" default="Vencimiento carnet de conducir" /></span>
					
						<span class="property-value" aria-labelledby="fecVencCarnet-label"><g:formatDate date="${usuarioInstance?.fecVencCarnet}" format="yyyy-MM"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="usuario.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${usuarioInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.pass}">
				<li class="fieldcontain">
					<span id="pass-label" class="property-label"><g:message code="usuario.pass.label" default="Password" /></span>
					
						<span class="property-value"  aria-labelledby="pass-label"><g:fieldValue bean="${usuarioInstance}" field="pass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.vehiculos}">
				<li class="fieldcontain">
					<span id="vehiculos-label" class="property-label"><g:message code="usuario.vehiculos.label" default="Vehículos" /></span>
					
						<g:each in="${usuarioInstance.vehiculos}" var="v">
						<span class="property-value" aria-labelledby="vehiculos-label"><g:link controller="vehiculo" action="show" id="${v.id}">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /> /Agregar Vehículo</g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
