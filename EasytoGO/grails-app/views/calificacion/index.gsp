
<%@ page import="easytogo.Calificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-calificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-calificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="calificacion.calificado.label" default="Calificado" /></th>
					
						<th><g:message code="calificacion.calificador.label" default="Calificador" /></th>
					
						<g:sortableColumn property="comentario" title="${message(code: 'calificacion.comentario.label', default: 'Comentario')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'calificacion.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'calificacion.valor.label', default: 'Valor')}" />
					
						<th><g:message code="calificacion.viaje_c.label" default="Viajec" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calificacionInstanceList}" status="i" var="calificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${calificacionInstance.id}">${fieldValue(bean: calificacionInstance, field: "calificado")}</g:link></td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "calificador")}</td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "comentario")}</td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "fecha")}</td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "valor")}</td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "viaje_c")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calificacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
