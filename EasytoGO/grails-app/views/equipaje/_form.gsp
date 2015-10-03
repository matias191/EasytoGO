<%@ page import="easytogo.Equipaje" %>



<div class="fieldcontain ${hasErrors(bean: equipajeInstance, field: 'tamanio', 'error')} required">
	<label for="tamanio">
		<g:message code="equipaje.tamanio.label" default="Tamanio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tamanio" required="" value="${equipajeInstance?.tamanio}"/>

</div>

