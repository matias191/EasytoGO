<%@ page import="easytogo.Pregunta" %>



<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'duda', 'error')} ">
	<label for="duda">
		<g:message code="pregunta.duda.label" default="Duda" />
		
	</label>
	<g:textField name="duda" value="${preguntaInstance?.duda}"/>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'respuesta', 'error')} ">
	<label for="respuesta">
		<g:message code="pregunta.respuesta.label" default="Respuesta" />
		
	</label>
	<g:select id="respuesta" name="respuesta.id" from="${easytogo.Respuesta.list()}" optionKey="id" value="${preguntaInstance?.respuesta?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>--%>

<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="pregunta.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${preguntaInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'viaje', 'error')} required">
	<label for="viaje">
		<g:message code="pregunta.viaje.label" default="Viaje" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="viaje" name="viaje.id" from="${easytogo.Viaje.list()}" optionKey="id" required="" value="${preguntaInstance?.viaje?.id}" class="many-to-one"/>

</div>

