
<%@ page import="easytogo.Respuesta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'respuesta.label', default: 'Respuesta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-respuesta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-respuesta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="resp" title="${message(code: 'respuesta.resp.label', default: 'Resp')}" />
					
						<th><g:message code="respuesta.pregunta.label" default="Pregunta" /></th>
					
						<th><g:message code="respuesta.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${respuestaInstanceList}" status="i" var="respuestaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${respuestaInstance.id}">${fieldValue(bean: respuestaInstance, field: "resp")}</g:link></td>
					
						<td>${fieldValue(bean: respuestaInstance, field: "pregunta")}</td>
					
						<td>${fieldValue(bean: respuestaInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${respuestaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
