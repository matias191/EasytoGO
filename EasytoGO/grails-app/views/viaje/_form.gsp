<%@ page import="easytogo.Viaje" %>


<div class="container">
     <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'origen', 'error')} required controls">
			<label for="origen"class="col-md-4 control-label"> <g:message code="viaje.origen.label"
			default="Origen" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input id="pac-input2" type="text" required="" class="form-control input-md" name="origen"  placeholder="Origen" value="${viajeInstance?.origen}" />
			
			</div>
		</div>
	</div>
     <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'destino', 'error')} required controls">
			<label for="destino"class="col-md-4 control-label"> <g:message code="viaje.destino.label"
			default="Destino" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input id="pac-input" required="" class="form-control input-md" name="destino" placeholder="Destino" value="${viajeInstance?.destino}" />
			</div>
		</div>
	</div>
	<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fecha_salida', 'error')} required controls">
			<label for="fecha_salida"class="col-md-4 control-label"> <g:message code="viaje.fecha_salida.label"
			default="Fecha de Salida" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:datePicker name="fecha_salida" precision="minute" class="form-control input-md" value="${viajeInstance?.fecha_salida}"  />  
			</div>
		</div>
	</div>
	<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fecha_llegada', 'error')} required controls">
			<label for="fecha_llegada" class="col-md-4 control-label"> <g:message code="viaje.fecha_llegada.label"
			default="Fecha de Llegada" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:datePicker  name="fecha_llegada" precision="minute" class="form-control input-md" value="${viajeInstance?.fecha_llegada}" />
			</div>
		</div>
	</div>
	<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'plazas_disponibles', 'error')} required controls">
			<label for="plazas_disponibles"class="col-md-4 control-label"> <g:message code="viaje.plazas_disponibles.label"
			default="Plazas Disponibles" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:field name="plazas_disponibles" type="number"  min="1" max="3" value="${viajeInstance?.plazas_disponibles}" required=""/>
		</div>
		</div>
	</div>
	<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'costoplaza', 'error')} required controls">
			<label for="costoplaza"class="col-md-4 control-label"> <g:message code="viaje.costoplaza.label"
			default="Costo de la Plaza" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:field type="number" min="1" max="1000" name="costoplaza" placeholder="Costo de la Plaza" value="${viajeInstance?.costoplaza}" />
			</div>
		</div>
	</div>
	<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'equipaje', 'error')} required controls">
			<label for="equipaje"class="col-md-4 control-label"> <g:message code="viaje.equipaje.label"
			default="¿Permite Equipaje?" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:select id="myselect" name="equipaje" value="${viajeInstance?.equipaje}"
         	 from="${[0: 'No', 1: 'Pequeño (bolsa o maletín)', 2: 'Mediano (bolso hasta 15 kg)', 3: 'Grande (valija)']}"
         	 optionKey="key" optionValue="value" />	
         	 </div>
		</div>
	</div>


 <div class="form-group">
<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fumar', 'error')} required">
	<label for="fumar" class="col-md-4 control-label">
		<g:message code="viaje.fumar.label" default="¿Se permite Fumar?" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:select id="fumar" name="fumar" value="${viajeInstance?.fumar}" 
	from="${[0:'NO', 1:'SI']}" optionKey="key" optionValue="value"/>

	 </div>
</div>
</div>
 <div class="form-group">
<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'mascota', 'error')} required">
	<label for="mascota" class="col-md-4 control-label">
		<g:message code="viaje.mascota.label" default="¿Permite mascota?" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:select id="myselect" name="mascota" value="${viajeInstance?.mascota}"
          from="${[0: 'SI', 1: 'NO']}"
          optionKey="key" optionValue="value" />
    </div>
</div>
</div>




<div class="form-group">
<div
	class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'comentario', 'error')}">
	<label for="comentario" class="col-md-4 control-label"> <g:message code="viaje.comentario.label"
			default="Comentario" />
	</label>
	<div class="col-md-6">	
	<textarea  name="comentario" class="form-control" rows="4"  value="${viajeInstance?.comentario}"></textarea><span>(opcional)</span>
	<%-- -- <g:textField name="comentario" 
		value="${viajeInstance?.comentario}" /> --%>

</div>
</div>
</div>

		<g:hiddenField name="conductor.id" type="" value="${sec.loggedInUserInfo(field:'id')}"/>
	
<%--<g:select id="conductor" name="conductor.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${viajeInstance?.conductor?.id}" class="many-to-one"/> --%>
</div>


<asset:javascript  src="scripts.js" />	
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>



















<%--







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
	<g:field name="equipaje" type="number" value="${viajeInstance.equipaje}" required=""/>
	<%--<g:select id="tamanio" name="tamanio" from="${easytogo.Equipaje.list(sort: tamanio)}" optionKey="tamanio" required="" value="${equipajeInstance?.tamanio}"/>-->
	<g:select id="myselect" name="equipaje" value="${viajeInstance.equipaje}"
          from="${[0: 'NINGUNO', 1: 'CHICO', 2: 'MEDIANO', 3: 'GRANDE']}"
          optionKey="key" optionValue="value" />
  			
	
</div>


<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fumar', 'error')} required">
	<label for="fumar">
		<g:message code="viaje.fumar.label" default="¿Se permite Fumar?" />
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="fumar" value="${viajeInstance?.fumar}" />
</div>

<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'mascota', 'error')} required">
	<label for="mascota">
		<g:message code="viaje.mascota.label" default="¿Permite mascota?" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="myselect" name="mascota" value="${viajeInstance.mascota}"
          from="${[0: 'SI', 1: 'NO']}"
          optionKey="key" optionValue="value" />
</div>



<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'destino', 'error')} required">
	<label for="destino">
		<g:message code="viaje.destino.label" default="Destino" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="pac-input" class="controls" name="destino" required="" placeholder="destino" value="${viajeInstance?.destino}"/>

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
	

	
<%--<g:select id="conductor" name="conductor.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${viajeInstance?.conductor?.id}" class="many-to-one"/> --%>
<%--
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>


--%>
