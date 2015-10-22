<%@ page import="easytogo.Viaje" %>
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
			
				<g:if test="${viajeInstance?.origen}">
				
    				 <div class="form-group">
						<span id="origen-label" class="col-md-4 control-label"><g:message code="viaje.origen.label" default="Origen" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="origen-label" value="${viajeInstance.origen}" readonly>
					</div>
				   	</div>
				
				</g:if>
				
				<g:if test="${viajeInstance?.destino}">
				 <div class="form-group">
					<span id="destino-label" class="col-md-4 control-label"><g:message code="viaje.destino.label" default="Destino" /></span>
						<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="destino-label" value="${viajeInstance.destino}" readonly>
						</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_salida}">
				 <div class="form-group">
					<span id="fecha_salida-label" class="col-md-4 control-label"><g:message code="viaje.fecha_salida.label" default="Fecha de salida" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fecha_salida-label" value="${viajeInstance.fecha_salida}" readonly>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_llegada}">
				<div class="form-group">
					<span id="fecha_llegada-label" class="col-md-4 control-label"><g:message code="viaje.fecha_llegada.label" default="Fecha de llegada" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md formatdate" aria-labelledby="fecha_llegada-label" value="${viajeInstance.fecha_llegada}" readonly>
				</div>
				   	</div>
				</g:if>
				
			
				
		
				
				
				
							
				<g:if test="${viajeInstance?.plazas_disponibles}">
				<div class="form-group">
					<span id="plazas_disponibles-label" class="col-md-4 control-label"><g:message code="viaje.plazas_disponibles.label" default="Plazas disponibles" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="plazas_disponibles-label" value="${viajeInstance.plazas_disponibles}" readonly>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.costoplaza}">
				<div class="form-group">
					<span id="costoplaza-label" class="col-md-4 control-label"><g:message code="viaje.costoplaza.label" default="Costo por plaza" /> ARS$</span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="costoplaza-label" value="${viajeInstance.costoplaza}" readonly><span></span>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.comentario}">
				<div class="form-group">
					<span id="comentario-label" class="col-md-4 control-label"><g:message code="viaje.comentario.label" default="Comentario" /></span>
					<div class="col-md-6">	
						<textarea class="form-control input-md uneditable-input" aria-labelledby="comentario-label" readonly >${viajeInstance?.comentario?.encodeAsHTML()}</textarea>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.conductor}">
				<div class="form-group">
					<span id="conductor-label" class="col-md-4 control-label"><g:message code="viaje.conductor.label" default="Conductor Perfil" /></span>
					<div class="col-md-6" >	
						<g:form controller="user"action="show" id="${viajeInstance?.conductor?.id}" >
						<button class="form-control btn btn-info" aria-labelledby="conductor-label" ><span class="glyphicon glyphicon-user " ></span> 	${viajeInstance?.conductor?.encodeAsHTML()} </button>
						</g:form>
					</div>
				   	</div>
				</g:if>
			
				
			
				<g:if test="${viajeInstance?.equipaje}">
				<div class="form-group">
					<span id="equipaje-label" class="col-md-4 control-label"><g:message code="viaje.equipaje.label" default="Equipaje" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="equipaje-label" value="${viajeInstance.equipaje == 1 ? 'PEQUEÑO' : viajeInstance.equipaje == 2 ? 'MEDIANO'  : 'GRANDE' }" readonly>
					</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fumar}">
				<div class="form-group">
					<span id="fumar-label" class="col-md-4 control-label"><g:message code="viaje.fumar.label" default="Fumar" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fumar-label" value="${viajeInstance.fumar == true ? 'SI' : 'NO'}" readonly>
					</div>
				   	</div>
				</g:if>
			
				
				<div class="form-group">
					<span id="mascota-label" class="col-md-4 control-label"><g:message code="viaje.mascota.label" default="Mascota" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="mascota-label" value="${viajeInstance.mascota == 1 ? 'SI' : 'NO' }"readonly>
					</div>
				   	</div>
	
				
			<fieldset class="form">
			<g:form url="[resource:reservaInstance, controller:'reserva', action:'save']" >
			<div class="fieldcontain">
			<g:if test = "${viajeInstance?.plazas_disponibles}" >
			<div class="form-group">
			<span id="cant_plaz-label" class="col-md-4 control-label" ><g:message code="reserva.cant_plaz.label" default="Cantidad de plazas" /></span>
					<div class="col-md-6">	
			<span class="property-value" aria-labelledby="cant_plaz-label"><g:field name="cant_plaz" type="number" value="${reservaInstance?.cant_plaz}" required=""/><g:actionSubmit controller="reserva" name="create" action="save_reserva" class="save btn btn-success" value="reservar"/></span>
			</div>
			</div>
			</g:if>
			
			<g:hiddenField name="plazas_disponibles" type="number" value="${viajeInstance?.plazas_disponibles-1}" required=""/>
			
			
			<g:hiddenField name="fecha_res" type="String"  value="${new Date().format('dd/MM/yyyy HH:mm')}"  />
			
			<g:hiddenField name="usuario.id" type="" value="${sec.loggedInUserInfo(field:'id')}"/>
			<g:hiddenField name="viajes.id" type=""  value="${viajeInstance.id}"/>
			
			
			
			</div>
		
				</g:form>
			</fieldset>
				
			</div>
			</div>
		</div>
	</body>
</html>
