<%@ page import="easytogo.Calificacion" %>



<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'calificado', 'error')} required">
	<label for="calificado">
		<g:message code="calificacion.calificado.label" default="Calificado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="calificado" name="calificado.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${calificadoid}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'calificador', 'error')} required">
	<label for="calificador">
		<g:message code="calificacion.calificador.label" default="Calificador" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField  name="calificador" required="" value="${sec.loggedInUserInfo(field:'id')}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} required">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comentario" required="" value="${calificacionInstance?.comentario}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="calificacion.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fecha" required="" value="${calificacionInstance?.fecha}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="calificacion.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" type="number" value="${calificacionInstance.valor}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'viaje_c', 'error')} required">
	<label for="viaje_c">
		<g:message code="calificacion.viaje_c.label" default="Viajec" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="viaje_c.id" required="" value="${calificacionInstance.viaje_c}" class="many-to-one"/>

</div>

