
<%@ page import="easytogo.Calificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-calificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-calificacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list calificacion">
			
				<g:if test="${calificacionInstance?.calificado}">
				<li class="fieldcontain">
					<span id="calificado-label" class="property-label"><g:message code="calificacion.calificado.label" default="Calificado" /></span>
					
						<span class="property-value" aria-labelledby="calificado-label"><g:link controller="user" action="show" id="${calificacionInstance?.calificado?.id}">${calificacionInstance?.calificado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.calificador}">
				<li class="fieldcontain">
					<span id="calificador-label" class="property-label"><g:message code="calificacion.calificador.label" default="Calificador" /></span>
					
						<span class="property-value" aria-labelledby="calificador-label"><g:link controller="user" action="show" id="${calificacionInstance?.calificador?.id}">${calificacionInstance?.calificador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.comentario}">
				<li class="fieldcontain">
					<span id="comentario-label" class="property-label"><g:message code="calificacion.comentario.label" default="Comentario" /></span>
					
						<span class="property-value" aria-labelledby="comentario-label"><g:fieldValue bean="${calificacionInstance}" field="comentario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="calificacion.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:fieldValue bean="${calificacionInstance}" field="fecha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="calificacion.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${calificacionInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.viaje_c}">
				<li class="fieldcontain">
					<span id="viaje_c-label" class="property-label"><g:message code="calificacion.viaje_c.label" default="Viajec" /></span>
					
						<span class="property-value" aria-labelledby="viaje_c-label"><g:link controller="reserva" action="show" id="${calificacionInstance?.viaje_c?.id}">${calificacionInstance?.viaje_c?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:calificacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${calificacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
