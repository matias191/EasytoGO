<%@ page import="easytogo.Viaje" %>


<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'origen', 'error')} required">
	<label for="origen">
		<g:message code="viaje.origen.label" default="Origen" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="pac-input2" class="controls" name="origen" required="" placeholder="origen" value="${viajeInstance?.origen}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'destino', 'error')} required">
	<label for="destino">
		<g:message code="viaje.destino.label" default="Destino" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="pac-input" class="controls" name="destino" required="" placeholder="destino" value="${viajeInstance?.destino}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fecha_salida', 'error')} required">
	<label for="fecha_salida">
		<g:message code="viaje.fecha_salida.label" default="Fecha de Salida" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha_salida" precision="minute"  value="${viajeInstance?.fecha_salida}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fecha_llegada', 'error')} required">
	<label for="fecha_llegada">
		<g:message code="viaje.fecha_llegada.label" default="Fecha de Llegada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha_llegada" precision="minute"  value="${viajeInstance?.fecha_llegada}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'plazas_disponibles', 'error')} required">
	<label for="plazas_disponibles">
		<g:message code="viaje.plazas_disponibles.label" default="Plazas disponibles" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="plazas_disponibles" type="number" value="${viajeInstance.plazas_disponibles}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'costoplaza', 'error')} required">
	<label for="costoplaza">
		<g:message code="viaje.costoplaza.label" default="Costo por plaza" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="costoplaza" type="number" value="${fieldValue(bean: viajeInstance, field: 'costoplaza')}" required=""/>

</div>


<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'equipaje', 'error')} required">
	<label for="equipaje">
		<g:message code="viaje.equipaje.label" default="¿Permite equipaje?" />
		<span class="required-indicator">*</span>
	</label>
	<!--<g:field name="equipaje" type="number" value="${viajeInstance.equipaje}" required=""/>-->
	<!--<g:select id="tamanio" name="tamanio" from="${easytogo.Equipaje.list(sort: tamanio)}" optionKey="tamanio" required="" value="${equipajeInstance?.tamanio}"/>-->
	<g:select id="myselect" name="equipaje" value="${viajeInstance.equipaje}"
          from="${[0: 'NINGUNO', 1: 'CHICO', 2: 'MEDIANO', 3: 'GRANDE']}"
          optionKey="key" optionValue="value" />
  			
	
</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fumar', 'error')} ">
	<label for="fumar">
		<g:message code="viaje.fumar.label" default="¿Se permite fumar?" />
		
	</label>
	<g:checkBox name="fumar" value="${viajeInstance?.fumar}" />

</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'mascota', 'error')} required">
	<label for="mascota">
		<g:message code="viaje.mascota.label" default="¿Permite mascota?" />
		<span class="required-indicator">*</span>
	</label>
	<!--<g:field name="mascota" type="number" value="${viajeInstance.mascota}" required=""/>-->
	<g:select id="myselect" name="mascota" value="${viajeInstance.mascota}"
          from="${[0: 'SI', 1: 'NO']}"
          optionKey="key" optionValue="value" />
  			
	

</div>




<div
	class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'comentario', 'error')}">
	<label for="comentario"> <g:message code="viaje.comentario.label"
			default="Comentario" />
	</label>
	<g:textField name="comentario" 
		value="${viajeInstance?.comentario}" />
<span>(opcional)</span>
</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'conductor', 'error')} required">
<%--
	<label for="conductor">  
	<g:message code="viaje.conductor.label" default="Conductor" />
	<span class="required-indicator">*</span> </label> 
	
	--%>
	
	<g:hiddenField name="conductor.id" type="" value="${sec.loggedInUserInfo(field:'id')}"/>
	
<%--<g:select id="conductor" name="conductor.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${viajeInstance?.conductor?.id}" class="many-to-one"/> --%>

</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>