<%@ page import="easytogo.Pregunta" %>

<h3 class="page-header">Hazle una pregunta al conductor</h3>
<br>
<br>
<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'duda', 'error')} ">
	<div class="row">
	
	<div class="col-md-3">
	<label for="duda">
		<asset:image src="pregunta3.png" width="250" height="95" />
		
		
	</label>
	</div>
		<textArea name="duda" class="col-md-6 " placeholder="Realiza aqui tu pregunta" rows="4" value="${preguntaInstance?.duda}" style="margin-left:1em !important;"></textArea>
	</div>
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
