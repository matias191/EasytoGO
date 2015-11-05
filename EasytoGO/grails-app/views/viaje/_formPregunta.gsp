<%@ page import="easytogo.Pregunta" %>



<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'duda', 'error')} ">
	<label for="duda">
		<asset:image src="pregunta3.png" width="250" height="95" />
		<h3>Hazle una pregunta al conductor</h3>
		
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
		<g:hiddenField id="user" name="user.id" type=""  value="${idUser}"/>
<%--	<g:select id="user" name="user.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${preguntaInstance?.user?.id}" class="many-to-one"/>--%>

</div>

<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'viaje', 'error')} required">
	<g:hiddenField id="viaje" name="viaje.id" type=""  value="${viajeInstance.id}"/>
<%--	<g:select id="viaje" name="viaje.id" from="${easytogo.Viaje.list()}" optionKey="id" required="" value="${idUser}" class="many-to-one"/>--%>

</div>
