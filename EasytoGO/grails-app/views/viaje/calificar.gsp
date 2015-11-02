<%@ page import="easytogo.Calificacion" %>
<%@ page import="easytogo.Viaje" %>
<%@ page import="easytogo.Reserva" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
			
		<div id="show-viaje" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			<div class="container">

<span class="property-value">
				<img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:usuario.id)}" />
</span>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'calificado', 'error')} required">
	<label for="calificado">
		<g:message code="calificacion.calificado.label" default="Pasajero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField  name="calificado.id" required="" value="${usuario.username}" class="many-to-one"/>

</div>

<fieldset class="form">
<g:form url="[resource:calificacionInstance, controller:'calificacion', action:'save']" >
<div class="fieldcontain">
<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'calificador', 'error')} required">
	
	<g:hiddenField  name="calificador" required="" value="${sec.loggedInUserInfo(field:'id')}" class="many-to-one"/>

</div>
		<g:hiddenField  name="calificado.id" required="" value="${usuario.id}" class="many-to-one"/>
<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} required">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comentario" required="" value="${calificacionInstance?.comentario}"/>

</div>
<div>
	<g:hiddenField name="reserva.id" required="" value="${reserva.id}"/>
	<g:hiddenField name="calificacion.id" required="" value="${calificacionInstance?.id}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'fecha', 'error')} required">
	
	<g:hiddenField name="fecha" required="" value="${new Date().format('dd/MM/yyyy HH:mm')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="calificacion.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" type="number" value="${calificacionInstance?.valor}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'viaje_c', 'error')} required">
	
	<g:hiddenField name="viaje_c.id" required="" value="${reserva.viajes.id}" class="many-to-one"/>

</div>
<g:actionSubmit controller="calificacion" name="create" action="save_calificacion" class="save btn btn-success" value="calificar"/>
</div>
		
</g:form>
</fieldset>
</div>
			</div>
		</div>
	</body>
</html>