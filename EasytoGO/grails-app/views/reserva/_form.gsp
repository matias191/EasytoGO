<%@ page import="easytogo.Reserva" %>
<%@ page import="easytogo.Viaje" %>



<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'cant_plaz', 'error')} required">
	<label for="cant_plaz">
		<g:message code="reserva.cant_plaz.label" default="Cantplaz" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cant_plaz" type="number" value="${reservaInstance.cant_plaz}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'fecha_res', 'error')} required">
	<label for="fecha_res">
		<g:message code="reserva.fecha_res.label" default="Fechares" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha_res" precision="day"  value="${reservaInstance?.fecha_res}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="reserva.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${reservaInstance?.usuario?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'viajes', 'error')} required">
	<label for="viajes">
		<g:message code="reserva.viajes.label" default="Viajes" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="viajes" name="viajes.id" from="${easytogo.Viaje.list()}" optionKey="id" required="" value="${reservaInstance?.viajes?.id}" class="many-to-one"/>

</div>

<ol class="property-list viaje">
			
				<g:if test="${viajeInstance?.origen}">
				<li class="fieldcontain">
					<span id="origen-label" class="property-label"><g:message code="viaje.origen.label" default="Origen" /></span>
					
						<span class="property-value" aria-labelledby="origen-label"><g:fieldValue bean="${viajeInstance.origen}" field="origen"/></span>
					
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
					<span id="fecha_salida-label" class="property-label"><g:message code="viaje.fecha_salida.label" default="Fechasalida" /></span>
					
						<span class="property-value" aria-labelledby="fecha_salida-label"><g:formatDate date="${viajeInstance?.fecha_salida}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_llegada}">
				<li class="fieldcontain">
					<span id="fecha_llegada-label" class="property-label"><g:message code="viaje.fecha_llegada.label" default="Fechallegada" /></span>
					
						<span class="property-value" aria-labelledby="fecha_llegada-label"><g:formatDate date="${viajeInstance?.fecha_llegada}" /></span>
					
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="plazas_disponibles-label" class="property-label"><g:message code="viaje.plazas_disponibles.label" default="Plazasdisponibles" /></span>
					
						<span class="property-value" aria-labelledby="plazas_disponibles-label"><g:fieldValue bean="${viajeInstance}" field="plazas_disponibles"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="costoplaza-label" class="property-label"><g:message code="viaje.costoplaza.label" default="Costoplaza" /></span>
					
						<span class="property-value" aria-labelledby="costoplaza-label"><g:fieldValue bean="${viajeInstance}" field="costoplaza"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="equipaje-label" class="property-label"><g:message code="viaje.equipaje.label" default="Equipaje" /></span>
					
						<span class="property-value" aria-labelledby="equipaje-label"><g:fieldValue bean="${viajeInstance}" field="equipaje"/></span>
					
				</li>
				
							
				<g:if test="${viajeInstance?.plazas_disponibles}">
				<li class="fieldcontain">
					<span id="plazas_disponibles-label" class="property-label"><g:message code="viaje.plazas_disponibles.label" default="Plazasdisponibles" /></span>
					
						<span class="property-value" aria-labelledby="plazas_disponibles-label"><g:fieldValue bean="${viajeInstance}" field="plazas_disponibles"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${viajeInstance?.costoplaza}">
				<li class="fieldcontain">
					<span id="costoplaza-label" class="property-label"><g:message code="viaje.costoplaza.label" default="Costoplaza" /></span>
					
						<span class="property-value" aria-labelledby="costoplaza-label"><g:fieldValue bean="${viajeInstance}" field="costoplaza"/></span>
					
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


