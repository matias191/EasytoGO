<%@ page import="easytogo.Viaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-viaje" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-viaje" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list viaje">
			
				<g:if test="${viajeInstance?.origen}">
				<li class="fieldcontain">
					<span id="origen-label" class="property-label"><g:message code="viaje.origen.label" default="Origen" /></span>
					
						<span class="property-value" aria-labelledby="origen-label"><g:fieldValue bean="${viajeInstance}" field="origen"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${viajeInstance?.destino}">
				<li class="fieldcontain">
					<span id="destino-label" class="property-label"><g:message code="viaje.destino.label" default="Destino" /></span>
					
						<span class="property-value" aria-labelledby="destino-label"><g:fieldValue bean="${viajeInstance}" field="destino"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_salida}">
				<li class="fieldcontain">
					<span id="fecha_salida-label" class="property-label"><g:message code="viaje.fecha_salida.label" default="Fecha de salida" /></span>
					
						<span class="property-value" aria-labelledby="fecha_salida-label"><g:formatDate date="${viajeInstance?.fecha_salida}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_llegada}">
				<li class="fieldcontain">
					<span id="fecha_llegada-label" class="property-label"><g:message code="viaje.fecha_llegada.label" default="Fecha de llegada" /></span>
					
						<span class="property-value" aria-labelledby="fecha_llegada-label"><g:formatDate date="${viajeInstance?.fecha_llegada}" /></span>
					
				</li>
				</g:if>
				
			
				
		
				
				
				
							
				<g:if test="${viajeInstance?.plazas_disponibles}">
				<li class="fieldcontain">
					<span id="plazas_disponibles-label" class="property-label"><g:message code="viaje.plazas_disponibles.label" default="Plazas disponibles" /></span>
					
						<span class="property-value" aria-labelledby="plazas_disponibles-label"><g:fieldValue bean="${viajeInstance}" field="plazas_disponibles"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.costoplaza}">
				<li class="fieldcontain">
					<span id="costoplaza-label" class="property-label"><g:message code="viaje.costoplaza.label" default="Costo por plaza" /></span>
					
						<span class="property-value" aria-labelledby="costoplaza-label">$<g:fieldValue bean="${viajeInstance}" field="costoplaza"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.comentario}">
				<li class="fieldcontain">
					<span id="comentario-label" class="property-label"><g:message code="viaje.comentario.label" default="Comentario" /></span>
					
						<span class="property-value" aria-labelledby="comentario-label"><g:fieldValue bean="${viajeInstance}" field="comentario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.conductor}">
				<li class="fieldcontain">
					<span id="conductor-label" class="property-label"><g:message code="viaje.conductor.label" default="Conductor" /></span>
					
						<span class="property-value" aria-labelledby="conductor-label"><g:link controller="user" action="show" id="${viajeInstance?.conductor?.id}">${viajeInstance?.conductor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${viajeInstance?.equipaje}">
				<li class="fieldcontain">
					<span id="equipaje-label" class="property-label"><g:message code="viaje.equipaje.label" default="Equipaje" /></span>
					
						<span class="property-value" aria-labelledby="equipaje-label"><g:fieldValue bean="${viajeInstance}" field="equipaje"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.fumar}">
				<li class="fieldcontain">
					<span id="fumar-label" class="property-label"><g:message code="viaje.fumar.label" default="Fumar" /></span>
					
						<span class="property-value" aria-labelledby="fumar-label"><g:formatBoolean boolean="${viajeInstance?.fumar}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.mascota}">
				<li class="fieldcontain">
					<span id="mascota-label" class="property-label"><g:message code="viaje.mascota.label" default="Mascota" /></span>
					
						<span class="property-value" aria-labelledby="mascota-label"><g:fieldValue bean="${viajeInstance}" field="mascota"/></span>
					
				</li>
				</g:if>
				</ol>
			<fieldset class="form">
			<g:form url="[resource:reservaInstance, controller:'reserva', action:'save']" >
			<div class="fieldcontain">
				
			<g:field name="cant_plaz" type="number" value="${reservaInstance?.cant_plaz}" required=""/>
			<g:datePicker name="fecha_res"  type="date" value="${new Date()}"  precision="minute"/>
			
			<g:hiddenField name="usuario.id" type="" value="${sec.loggedInUserInfo(field:'id')}"/>
			<g:hiddenField name="viajes.id" type=""  value="${viajeInstance.id}"/>
			
			
			<g:submitButton controller="reserva" name="create" class="save" value="Reservar" />
		</div>
		
	</g:form>
</fieldset>
				
			
			
			<g:form url="[resource:viajeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${viajeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
