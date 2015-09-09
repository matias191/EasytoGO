
<%@ page import="easytogo.Vehiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vehiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<!-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> Link a crear vehículo que nunca se va usar-->
			</ul>
		</div>
		<div id="list-vehiculo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="vehiculo.modelo.marca.label" default="Marca" /></th>
						
						<th><g:message code="vehiculo.modelo.label" default="Modelo" /></th>
					
						<g:sortableColumn property="anio" title="${message(code: 'vehiculo.anio.label', default: 'Año')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'vehiculo.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="combustible" title="${message(code: 'vehiculo.combustible.label', default: 'Combustible')}" />
					
						<g:sortableColumn property="seguro" title="${message(code: 'vehiculo.seguro.label', default: 'Seguro')}" />
					
						<th><g:message code="vehiculo.user.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vehiculoInstanceList}" status="i" var="vehiculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: vehiculoInstance.modelo.marca, field: "nombre")}</td>
						
						<td>${fieldValue(bean: vehiculoInstance, field: "modelo")}</td>
					
						<td><g:link action="show" id="${vehiculoInstance.id}">${fieldValue(bean: vehiculoInstance, field: "anio")}</g:link></td>
					
						<td>${fieldValue(bean: vehiculoInstance, field: "color")}</td>
					
						<td>${vehiculoInstance.combustible == 1 ? 'Nafta' : vehiculoInstance.combustible == 2 ? 'Gasoil' : 'GNC'}</td>
					
						<td>${vehiculoInstance.seguro.equals(true) ? 'SI' : 'NO'}</td>
					
						<td>${fieldValue(bean: vehiculoInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vehiculoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
