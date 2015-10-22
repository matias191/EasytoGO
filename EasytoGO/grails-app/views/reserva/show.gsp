
<%@ page import="easytogo.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1>Mi reserva</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			<div class="container">
			
				<g:if test="${reservaInstance?.cant_plaz}">
					<div class="form-group ">
					<span id="cant_plaz-label" class="col-md-2 control-label"><g:message code="reserva.cant_plaz.label" default="Cantidad de plazas reservadas" /></span>
					<div class="col-md-5">
						<input class="form-control input-sm" aria-labelledby="cant_plaz-label" value="${reservaInstance.cant_plaz}"readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${reservaInstance?.fecha_res}">
					<div class="form-group ">
					<span id="fecha_res-label" class="col-md-2 control-label"><g:message code="reserva.fecha_res.label" default="Fecha de reserva" /></span>
					<div class="col-md-5">
						<input class="form-control input-sm" aria-labelledby="fecha_res-label" value="${reservaInstance.fecha_res}"readonly>
					</div>
				</div>
				
				</g:if>
			
				<g:if test="${reservaInstance?.usuario}">
				<div class="form-group ">
					<span id="usuario-label" class="col-md-2 control-label"><g:message code="reserva.usuario.label" default="Pasajero" /></span>
					<div class="col-md-5">
						<input class="form-control input-sm" aria-labelledby="usuario-label" value="${reservaInstance?.usuario?.encodeAsHTML()}"readonly>
					
					</div>
				</div>
				</g:if>
			
				<%--<g:if test="${reservaInstance?.viajes}">
				<li class="fieldcontain">
					<span id="viajes-label" class="property-label"><g:message code="reserva.viajes.label" default="Viajes" /></span>
					
						<span class="property-value" aria-labelledby="viajes-label"><g:link controller="viaje" action="show" id="${reservaInstance?.viajes?.id}">${reservaInstance?.viajes?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			--%>
			 	 	 	
		<%-- 
			<g:form url="[resource:reservaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>--%>
			</div>
				</div>
		</div>
		</div>
	</body>
</html>
