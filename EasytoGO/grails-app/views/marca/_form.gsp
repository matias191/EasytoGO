<%@ page import="easytogo.Marca"%>

<div class="form-group">
<div
	class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombre', 'error')} required">
	<label for="nombre" class="col-md-4 control-label"> <g:message code="marca.nombre.label"
			default="Nombre" /> <span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<input name="nombre"  class="form-control input-md" required="" value="${marcaInstance?.nombre}" Placeholder="Ingrese Nuevo nombre de Marca"/>
	</div>
	</div>
</div>	
<!-- 
<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'modelos', 'error')} ">
	<label for="modelos">
		<g:message code="marca.modelos.label" default="Modelos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${marcaInstance?.modelos?}" var="m">
    <li><g:link controller="modelo" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="modelo" action="create" params="['marca.id': marcaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'modelo.label', default: 'Modelo')])}</g:link>
</li>
</ul>


</div>
 -->