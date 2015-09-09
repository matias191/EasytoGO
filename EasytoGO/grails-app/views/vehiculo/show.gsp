
<%@ page import="easytogo.Vehiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vehiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<!--  <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li> Link a la lista de vehiculos-->
				<!-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> Link a crear vehiculo que nunca se va a usar --> 
			</ul>
		</div>
		<div id="show-vehiculo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vehiculo">
			
			<g:if test="${vehiculoInstance?.modelo.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="vehiculo.modelo.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:link controller="modelo" action="show" id="${vehiculoInstance?.modelo?.marca?.id}">${vehiculoInstance?.modelo?.marca?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="vehiculo.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:link controller="modelo" action="show" id="${vehiculoInstance?.modelo?.id}">${vehiculoInstance?.modelo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.anio}">
				<li class="fieldcontain">
					<span id="anio-label" class="property-label"><g:message code="vehiculo.anio.label" default="Año" /></span>
					
						<span class="property-value" aria-labelledby="anio-label"><g:fieldValue bean="${vehiculoInstance}" field="anio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="vehiculo.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${vehiculoInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.combustible}">
				<li class="fieldcontain">
					<span id="combustible-label" class="property-label"><g:message code="vehiculo.combustible.label" default="Combustible" /></span>
					
						<span class="property-value" aria-labelledby="combustible-label">${vehiculoInstance.combustible == 1 ? 'Nafta' : vehiculoInstance.combustible == 2 ? 'Gasoil' : 'GNC'}</span>
					
				</li>
				</g:if>
				
				
				
				
			
				<g:if test="${vehiculoInstance?.seguro}">
				<li class="fieldcontain">
					<span id="seguro-label" class="property-label"><g:message code="vehiculo.seguro.label" default="Seguro" /></span>
					
						<span class="property-value" aria-labelledby="seguro-label"><g:formatBoolean boolean="${vehiculoInstance?.seguro}" /></span>
					
				</li>
				</g:if>
			<!-- 
				<g:if test="${vehiculoInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="vehiculo.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${vehiculoInstance?.user?.id}">${vehiculoInstance?.user?.encodeAsHTML()}kjhk</g:link></span>
					
				</li>
				</g:if>
			 -->
			</ol>
			<g:form url="[resource:vehiculoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<!-- <g:link class="edit" action="edit" resource="${vehiculoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link> editar q nunca se usa, se elimina directamente--> 
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
