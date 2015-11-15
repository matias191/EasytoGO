<%@ page import="easytogo.User" %>
<%@ page import="easytogo.Reserva" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main2"/>
<title>Viajes de Usuario</title>
</head>
<body>
<div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Mi viajes <small>Calificar Pasejero</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i >Califica a tus compañeros de viaje, comentanos de tus experiancias con los mismos</i> 
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
 </div>

<g:if test="${flash.message}">
<div class="alert alert-success" role="alert">${flash.message}</div>
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
   <h4 class="page-header">Califica al conductor del viaje</h4>
   <div class="table-responsive" > 
  		<table class="table table-hover"  >
			<thead>
					<tr>
					
						<g:sortableColumn property="Conductor" title="${message(code: 'Conductor', default: 'Conductor')}" />
						
						
						
						<g:sortableColumn property="calificar" title="${message(code: 'Calificar', default: 'Calificar')}" />
					
					</tr>
				</thead>
	
	<g:each in="${calificacion}" status="i" var="Reserva1">	
			
						
						<tr class= "success">		
						
						
					
<%--						<td>${Reserva.viajes.costoplaza}</td>--%>
<%--					--%>
						<td>${Reserva1.viajes.conductor}</td>
<%--					--%>
					
<%--					--%>
<%--						<td>${Viaje.conductor}</td>--%>
						<td><g:link action="calificar" id="${Reserva1.id}" params="[reservaid: Reserva1.id, calificadoid: Reserva1.viajes.conductor.id, conductor: Reserva1.viajes.conductor.id]">${"Calificar"}</g:link></td>

					</tr>
					

												
                      
					
				</g:each>

    
	</tbody>
	</table>	
    </div>
  </div>

  <div class="container">
     <h4 class="page-header">Califica a tus compañeros de viaje</h4>
  <div class="table-responsive" > 
  		<table class="table table-hover"  >
			<thead>
					<tr>
					
						<g:sortableColumn property="usuario" title="${message(code: 'reserva.usuario.label', default: 'Pasajero')}" />
						
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
						
					
						<td>${Reserva.usuario}</td>
<%--					--%>
<%--						<td>${Viaje.conductor}</td>--%>
						<td><g:link action="calificar" id="${Reserva.id}" params="[reservaid: Reserva.id, calificadoid: Reserva.usuario.id, conductor: Reserva.viajes.conductor.id]">${"Calificar"}</g:link></td>
					
					</tr>
					

												
                      
					
				</g:each>

    
	</tbody>
	</table>
    </div>
  </div>

</body>
</html>