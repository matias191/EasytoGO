<%@ page import="easytogo.User" %>
<%@ page import="easytogo.Reserva" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Viajes de Usuario</title>
</head>
<body>


<g:if test="${flash.message}">
<div class="message" role="status">${flash.message}</div>
</g:if>
<%--<fieldset class="form">--%>
<%--	<g:form action="usuarioViaje" method="GET">--%>
<%--		<div class="fieldcontain">--%>
<%--			<label for="query">Origen:</label>--%>
<%--			<g:textField id="pac-input2" class="controls" name="query" value="${params.query}"/> <br>--%>
<%--			--%>
<%--			<label for="query">Destino:</label>--%>
<%--			<g:textField id="pac-input" class="controls" name="query1" value="${params.query1}"/> <br>--%>
<%--			--%>
<%--			<input type="submit" value="Buscar" class="btn btn-success btn-sm">--%>
<%--		</div>--%>
<%--		--%>
<%--	</g:form>--%>
<%--</fieldset>--%>


  <div class="container">
  
  <table class="table">
			<thead>
					<tr>
						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fechasalida')}" />
					
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />--%>
					
						<g:sortableColumn property="plazas_disponibles" title="${message(code: 'viaje.plazas_disponibles.label', default: 'Plazasdisponibles')}" />
					
						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costoplaza')}" />
					
<%--						<g:sortableColumn property="comentario" title="${message(code: 'viaje.comentario.label', default: 'Comentario')}" />--%>
					
						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>
					
						<g:sortableColumn property="calificar" title="${message(code: 'Calificar', default: 'Calificar')}" />
					</tr>
				</thead>
	
	<g:each in="${viajes}" status="i" var="Viaje">	
						
						<tr class= "success">		
						
						<td>${Viaje.origen}</td>
						
						<td>${Viaje.destino}</td>
					
						<td>${Viaje.fecha_salida}</td>
					
<%--						<td>${Viaje.fecha_llegada}</td>--%>
					
						<td>${Viaje.plazas_disponibles}</td>
					
						<td>${Viaje.costoplaza}</td>
					
<%--						<td>${Viaje.comentario}</td>--%>
					
						<td>${Viaje.conductor}</td>
						
						<td><g:link action="pasajeroViaje" id="${Viaje.id}" params="[viajeid: Viaje.id]">${"Calificar"}</g:link></td>
						
					
					</tr>
						

												
                      
					
				</g:each>

    
	</tbody>
	</table>
    
  </div>
  
  <div class="container">
  
  <table class="table">
			<thead>
					<tr>
					<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fechasalida')}" />
					
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />--%>
					
						<g:sortableColumn property="cant_plaz" title="${message(code: 'reserva.cant_plaz.label', default: 'Cantidad de Plazas')}" />
					
						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costo por plaza')}" />
					
<%--						<g:sortableColumn property="comentario" title="${message(code: 'viaje.comentario.label', default: 'Comentario')}" />--%>
					
						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>
						
						<g:sortableColumn property="calificar" title="${message(code: 'Calificar', default: 'Calificar')}" />
<%--						<g:sortableColumn property="origen" title="${message(code: 'reserva.viajes.label', default: 'Viaje')}" />--%>
<%--						--%>
<%--						<g:sortableColumn property="destino" title="${message(code: 'viaje.usuario.label', default: 'Usuario')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_res.label', default: 'Fecha reserva')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.cant_plaz.label', default: 'Cantidad de Plazas')}" />--%>
<%--					--%>
						
<%--						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>--%>
					
					</tr>
				</thead>
	
	<g:each in="${reserva}" status="i" var="Reserva">	
						
						<tr class= "success">		
						
						<td>${Reserva.viajes.origen}</td>
						
						<td>${Reserva.viajes.destino}</td>
					
						<td>${Reserva.viajes.fecha_salida}</td>
					
						<td>${Reserva.cant_plaz}</td>
					
						<td>${Reserva.viajes.costoplaza}</td>
<%--					--%>
						<td>${Reserva.viajes.conductor}</td>
<%--					--%>
						<td><g:link action="pasajeroViaje" id="${Reserva.viajes.id}" params="[viajeid: Reserva.viajes.id]">${"Calificar"} </g:link></td>
<%--						<td>${Viaje.comentario}</td>--%>
<%--					--%>
<%--						<td>${Viaje.conductor}</td>--%>
                      
					
					</tr>
						

												
                      
					
				</g:each>

    
	</tbody>
	</table>
   
  </div>
  

</body>
</html>