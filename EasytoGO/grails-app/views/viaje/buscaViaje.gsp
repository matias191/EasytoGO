<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>


<g:if test="${flash.message}">
<div class="message" role="status">${flash.message}</div>
</g:if>
<fieldset class="form">
	<g:form action="buscaViaje" method="GET">
		<div class="fieldcontain">
			<label for="query">Origen:</label>
			<g:textField id="pac-input2" class="controls" name="query" value="${params.query}"/> <br>
			
			<label for="query">Destino:</label>
			<g:textField id="pac-input" class="controls" name="query1" value="${params.query1}"/> <br>
			
			<input type="submit" value="Buscar">
		</div>
		
	</g:form>
</fieldset>


  <div class="body">
  
  <table>
			<thead>
					<tr>
						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fechasalida')}" />
					
						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />
					
						<g:sortableColumn property="plazas_disponibles" title="${message(code: 'viaje.plazas_disponibles.label', default: 'Plazasdisponibles')}" />
					
						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costoplaza')}" />
					
						<g:sortableColumn property="comentario" title="${message(code: 'viaje.comentario.label', default: 'Comentario')}" />
					
						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>
					
					</tr>
				</thead>
	
	<g:each in="${viajes}" status="i" var="Viaje">	
						
						<tr>		
						
						<td><g:link action="reservar" id="${Viaje.id}">${Viaje.origen}</g:link></td>
						
						<td>${Viaje.destino}</td>
					
						<td>${Viaje.fecha_salida}</td>
					
						<td>${Viaje.fecha_llegada}</td>
					
						<td>${Viaje.plazas_disponibles}</td>
					
						<td>${Viaje.costoplaza}</td>
					
						<td>${Viaje.comentario}</td>
					
						<td>${Viaje.conductor}</td>
					
					</tr>
						

												
                      
					
				</g:each>

    
	</tbody>
	</table>
    
  </div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>