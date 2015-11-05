
<%@ page import="easytogo.Respuesta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'respuesta.label', default: 'Respuesta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-respuesta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-respuesta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list respuesta">
			
				<g:if test="${respuestaInstance?.resp}">
				<li class="fieldcontain">
					<span id="resp-label" class="property-label"><g:message code="respuesta.resp.label" default="Resp" /></span>
					
						<span class="property-value" aria-labelledby="resp-label"><g:fieldValue bean="${respuestaInstance}" field="resp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${respuestaInstance?.pregunta}">
				<li class="fieldcontain">
					<span id="pregunta-label" class="property-label"><g:message code="respuesta.pregunta.label" default="Pregunta" /></span>
					
						<span class="property-value" aria-labelledby="pregunta-label"><g:link controller="pregunta" action="show" id="${respuestaInstance?.pregunta?.id}">${respuestaInstance?.pregunta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${respuestaInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="respuesta.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${respuestaInstance?.user?.id}">${respuestaInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:respuestaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${respuestaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
