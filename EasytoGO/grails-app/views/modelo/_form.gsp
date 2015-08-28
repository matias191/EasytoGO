<%@ page import="easytogo.Modelo" %>



<div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marca', 'error')} required">
	<label for="marca">
		<g:message code="modelo.marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="marca" name="marca.id" from="${easytogo.Marca.list()}" optionKey="id" required="" value="${modeloInstance?.marca?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="modelo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${modeloInstance?.nombre}"/>

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