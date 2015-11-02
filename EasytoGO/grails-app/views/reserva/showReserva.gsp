
<%@ page import="easytogo.Reserva" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





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
			<h1>Has reservado con éxito!</h1>
			
			<h3>A continuación te recordamos los datos del viaje.</h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			
			
								
				
				<h5>Número de reserva ${idRese}</h5>
				<h5>Fecha de la reserva: ${fechaRes}</h5>
				<h5>Origen: ${origen}</h5>
				<h5>Fecha y hora de salida: ${fechaSalida}</h5>
				<h5>Destino: ${destino}</h5>
				<h5>Fecha y hora de llegada estimada: ${fechaLlegada}</h5>
				<h5>Plazas reservadas: ${cantidad}</h5>
				<h5>Costo por plaza: ${costoPlaza}</h5>
				<h5>Gastos de gestión: ${costoGestion}</h5>
				<h5>Vehículo en el que viajarás: ${marca} ${modelo}</h5>
				<br/> 
				
			<h3>Contacta al conductor ${nombreConductor} ${apellidoConductor} para ultimar los detalles del viaje.</h3>
				<g:if test="${reservaInstance?.viajes.conductor.avatar}">
				<div class="fieldcontain col-md-2">
				<span class="property-value">
				<img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:reservaInstance?.viajes.conductor.id)}" />
				</span>
				</div>	
				</g:if>
				<h4>Teléfono: ${celular}</h4>
				<h4>E-mail: ${mail}</h4>
				
				
				
				<br/>
				
				<h2>Buen viaje!</h2>
				
				
				
			
				<%--<g:if test="${reservaInstance?.viajes}">
				<li class="fieldcontain">
					<span id="viajes-label" class="property-label"><g:message code="reserva.viajes.label" default="Viajes" /></span>
					
						<span class="property-value" aria-labelledby="viajes-label"><g:link controller="viaje" action="show" id="${reservaInstance?.viajes?.id}">${reservaInstance?.viajes?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>--%>
				
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
	</body>
</html>
