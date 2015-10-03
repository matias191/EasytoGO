
<%@ page import="easytogo.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reserva">
			
				<g:if test="${reservaInstance?.cant_plaz}">
				<li class="fieldcontain">
					<span id="cant_plaz-label" class="property-label"><g:message code="reserva.cant_plaz.label" default="Cantplaz" /></span>
					
						<span class="property-value" aria-labelledby="cant_plaz-label"><g:fieldValue bean="${reservaInstance}" field="cant_plaz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.fecha_res}">
				<li class="fieldcontain">
					<span id="fecha_res-label" class="property-label"><g:message code="reserva.fecha_res.label" default="Fechares" /></span>
					
						<span class="property-value" aria-labelledby="fecha_res-label"><g:formatDate date="${reservaInstance?.fecha_res}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="reserva.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="user" action="show" id="${reservaInstance?.usuario?.id}">${reservaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.viajes}">
				<li class="fieldcontain">
					<span id="viajes-label" class="property-label"><g:message code="reserva.viajes.label" default="Viajes" /></span>
					
						<span class="property-value" aria-labelledby="viajes-label"><g:link controller="viaje" action="show" id="${reservaInstance?.viajes?.id}">${reservaInstance?.viajes?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reservaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
