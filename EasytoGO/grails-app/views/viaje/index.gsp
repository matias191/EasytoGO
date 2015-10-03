
<%@ page import="easytogo.Viaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-viaje" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
			<ul>
			
			<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			
				
				
			</ul>
		</div>
		
		<div id="list-viaje" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fechasalida')}" />
					
						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />
					
						<g:sortableColumn property="plazas_disponibles" title="${message(code: 'viaje.plazas_disponibles.label', default: 'Plazasdisponibles')}" />
					
						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costoplaza')}" />
					
						<g:sortableColumn property="comentario" title="${message(code: 'viaje.comentario.label', default: 'Comentario')}" />
					
						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>
					
					</tr>
				</thead>
				
   				<g:each in="${viajeInstanceList}" status="i" var="viajeInstance">	
												
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						
						<td>${fieldValue(bean: viajeInstance, field: "origen")}</td>
						
						<td>${fieldValue(bean: viajeInstance, field: "destino")}</td>
					
						<td><g:link action="show" id="${viajeInstance.id}">${fieldValue(bean: viajeInstance, field: "fecha_salida")}</g:link></td>
					
						<td><g:formatDate date="${viajeInstance.fecha_llegada}" /></td>
					
						<td>${fieldValue(bean: viajeInstance, field: "plazas_disponibles")}</td>
					
						<td>${fieldValue(bean: viajeInstance, field: "costoplaza")}</td>
					
						<td>${fieldValue(bean: viajeInstance, field: "comentario")}</td>
					
						<td>${fieldValue(bean: viajeInstance, field: "conductor")}</td>
					
					</tr>
					
				</g:each>
				
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${viajeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
