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
                            Mis viajes <small>lista</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i >Selecciona uno de los viaje y edita las caracteristicas del mismo</i> 
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
  <h4 class="page-header">Mis viajes disponibles</h4>
   <div class="table-responsive" > 
  		<table class="table table-hover"  >
			<thead>
					<tr>
						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fecha de salida')}" />
					
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fechallegada')}" />--%>
					
						<g:sortableColumn property="plazas_disponibles" title="${message(code: 'viaje.plazas_disponibles.label', default: 'Plazas disponibles')}" />
					
						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costo por plaza')}" />
						
											<g:sortableColumn property="estado" title="${message(code: 'viaje.estado.label', default: 'Estado')}" />
					
<%--						<g:sortableColumn property="comentario" title="${message(code: 'viaje.comentario.label', default: 'Comentario')}" />--%>
					
						<th><g:message code="viaje.conductor.label" default="Conductor" /></th>
					
							<th></th>
					</tr>
				</thead>
	
	<g:each in="${mviaje}" status="i" var="Viaje">	
						
						<tr class= "success">		
						
						<td>${Viaje.origen}</td>
						
						<td>${Viaje.destino}</td>
					
						<td>${Viaje.fecha_salida}</td>
					
<%--						<td>${Viaje.fecha_llegada}</td>--%>
					
						<td>${Viaje.plazas_disponibles}</td>
					
						<td>${Viaje.costoplaza}</td>
						<td>${Viaje.estado}</td>
					
<%--						<td>${Viaje.comentario}</td>--%>
					
						<td>${Viaje.conductor}</td>
						
						<td><g:link action="show" id="${Viaje.id}" params="[viajeid: Viaje.id]">${"Ver"}</g:link></td>
						
					
					</tr>
						

												
                      
					
				</g:each>

    
	</tbody>
	</table>
    </div>
  </div>
  
  
  
  </body>
</html>