<%@ page import="easytogo.Mascota" %>



<div class="fieldcontain ${hasErrors(bean: mascotaInstance, field: 'mascota', 'error')} required">
	<label for="mascota">
		<g:message code="mascota.mascota.label" default="Mascota" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mascota" required="" value="${mascotaInstance?.mascota}"/>

</div>

