<%@ page import="easytogo.Modelo" %>


<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marca', 'error')} required">
	<label for="marca" class="col-md-4 control-label">
		<g:message code="modelo.marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	
	<g:select class="form-control" id="marca" name="marca.id" from="${easytogo.Marca.list()}" optionKey="id" required="" value="${modeloInstance?.marca?.id}" class="many-to-one"/>
	
</div>
</div>
</div>
<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'nombre', 'error')} required">
	<label for="nombre" class="col-md-4 control-label">
		<g:message code="modelo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<input name="nombre"  class="form-control input-md
	" required="" value="${modeloInstance?.nombre}" />
</div>
</div>
</div>



<!-- 
<div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'vehiculos', 'error')} ">
	<label for="vehiculos">
		<g:message code="modelo.vehiculos.label" default="Vehiculos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${modeloInstance?.vehiculos?}" var="v">
    <li><g:link controller="vehiculo" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehiculo" action="create" params="['modelo.id': modeloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehiculo.label', default: 'Vehiculo')])}</g:link>
</li>
</ul>


</div>

 -->