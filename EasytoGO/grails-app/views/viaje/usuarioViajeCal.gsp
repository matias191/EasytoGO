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
                            Calificar<small> mis viajes</small>
                        </h1>
                        <div class="alert alert-success" role="alert">Gracias por calificar a tu compañero.</div>
                        <div class="alert alert-success" role="alert">Felicitaciones, no tienes más calificaciones que hacer.</div>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i >Selecciona un viaje, califica a tus compañeros, y comenta como fue tu experiancia con ellos.</i> 
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
 </div>

<%--<g:if test="${flash.message}">
<div class="alert alert-success" role="alert">${flash.message}</div>
</g:if>
--%><%--<fieldset class="form">--%>
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
  <h4 class="page-header">Viajes como conductor</h4>
  <div class="table-responsive" > 
  		<table class="table table-hover"  >
			<thead>
					<tr>
						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="Fecha de salida" />
					
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />--%>
					
						<g:sortableColumn property="plazas_disponibles" title="Plazas disponibles" />
					
						<g:sortableColumn property="costoplaza" title="Costo por plaza" />
					
<%--						<g:sortableColumn property="comentario" title="${message(code: 'viaje.comentario.label', default: 'Comentario')}" />--%>
					
						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>
					
						<g:sortableColumn property="calificar" title="${message(code: 'Calificar', default: 'Calificar')}" />
					</tr>
				</thead>
	
	

    
	</tbody>
	</table>
    </div>
  </div>
  
  <div class="container">
    <h4 class="page-header">Viajes como  pasajero</h4>
 <div class="table-responsive" > 
  		<table class="table table-hover"  >
			<thead>
					<tr>
					<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="Fecha de salida" />
					
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />--%>
					
						<g:sortableColumn property="cant_plaz" title="${message(code: 'reserva.cant_plaz.label', default: 'Cantidad de plazas')}" />
					
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
	
	

    
	</tbody>
	</table>
   </div>
  </div>
  

</body>
</html>