
<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" />(vuela mas adelante)</g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" />(vuela mas adelante)</g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
			
			<g:if test="${userInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="user.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${userInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="user.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${userInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.fecNac}">
				<li class="fieldcontain">
					<span id="fecNac-label" class="property-label"><g:message code="user.fecNac.label" default="Fecha de Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fecNac-label"><g:formatDate date="${userInstance?.fecNac}" format="yyyy-MM-dd" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="user.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label">${userInstance.sexo == 1 ? 'Masculino' : 'Femenino'}</span>
					
					
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="user.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${userInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="user.telefono.label" default="Teléfono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${userInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="user.direccion.label" default="Dirección" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${userInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.fecVencCarnet}">
				<li class="fieldcontain">
					<span id="fecVencCarnet-label" class="property-label"><g:message code="user.fecVencCarnet.label" default="Vencimiento carnet de conducir" /></span>
					
						<span class="property-value" aria-labelledby="fecVencCarnet-label"><g:formatDate date="${userInstance?.fecVencCarnet}" format="yyyy-MM"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				
			<g:if test="${userInstance?.vehiculos}">
				<li class="fieldcontain">
					<span id="vehiculos-label" class="property-label"><g:message code="user.vehiculos.label" default="Vehículos" /></span>
					
						<g:each in="${userInstance.vehiculos}" var="v">
						<span class="property-value" aria-labelledby="vehiculos-label"><g:link controller="vehiculo" action="show" id="${v.id}">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
			
				
			
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" />/Agregar Vehículo</g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
