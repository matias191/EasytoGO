
<%@ page import="easytogo.Pregunta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pregunta.label', default: 'Pregunta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pregunta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pregunta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pregunta">
			
				<g:if test="${preguntaInstance?.duda}">
				<li class="fieldcontain">
					<span id="duda-label" class="property-label"><g:message code="pregunta.duda.label" default="Duda" /></span>
					
						<span class="property-value" aria-labelledby="duda-label"><g:fieldValue bean="${preguntaInstance}" field="duda"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preguntaInstance?.respuesta}">
				<li class="fieldcontain">
					<span id="respuesta-label" class="property-label"><g:message code="pregunta.respuesta.label" default="Respuesta" /></span>
					
						<span class="property-value" aria-labelledby="respuesta-label"><g:link controller="respuesta" action="show" id="${preguntaInstance?.respuesta?.id}">${preguntaInstance?.respuesta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preguntaInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="pregunta.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${preguntaInstance?.user?.id}">${preguntaInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preguntaInstance?.viaje}">
				<li class="fieldcontain">
					<span id="viaje-label" class="property-label"><g:message code="pregunta.viaje.label" default="Viaje" /></span>
					
						<span class="property-value" aria-labelledby="viaje-label"><g:link controller="viaje" action="show" id="${preguntaInstance?.viaje?.id}">${preguntaInstance?.viaje?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:preguntaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${preguntaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
