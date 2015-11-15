<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main2"/>
<title>Busca tu viaje</title>
</head>
<body>
 <div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Buscar<small> Viajes</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class=""></i> Puedes visualizar los viajes disponibles  y ver los detalles del mismo
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
<div class="container">
<g:if test="${flash.message}">
<div class="alert alert-success" role="alert">${flash.message}</div>
</g:if>
	<div class="panel panel-default">
			<div class="panel-body">
<fieldset>
	<g:form action="buscaViaje" method="GET" class="form-horizontal">
		<div class="container">
					<div class="form-group">
					<label class="col-md-4 control-label" for="query"><span class="glyphicon glyphicon-map-marker"></span>Origen:</label>
					<div class="col-md-4">
					
					<g:textField id="pac-input2" class="form-control input-md" name="query" value="${params.query}"/> <br>
					</div>
					</div>
					<div class="form-group">
					<label class="col-md-4 control-label" for="query1"><span class="glyphicon glyphicon-map-marker"></span>Destino:</label>
					<div class="col-md-4">
					
					<g:textField id="pac-input" class="form-control input-md" name="query1" value="${params.query1}"/> <br>
					</div>
					</div>
					
					<div class="fieldcontain" style="margin-top:0.3em; padding: 0 0% 0 0%;" >	
					<div class="form-group"	>
					<label class="col-md-4 control-label" for="query1"><span >Fecha del viaje:</span></label>
					<div class="col-md-4">				
						       <div class="input-group date input-group-sm " >
      							<input id="date" type="String" class="form-control" placeholder="Fecha de Viaje"><span class="input-group-addon" ><i class="glyphicon glyphicon-th"></i></span>
    				</div>
    				</div>
    				</div>
					</div>
					<div class="form-group">
					<label class="col-md-4 control-label" for="singlebutton"></label>
					<div class="col-md-4">
					<button type="submit" class="controls btn btn-success btn-md rounded"  value="Buscar">Buscar</button>
					</div>
					</div>
					
		</div>
      
	</g:form>
</fieldset>
</div>
</div>
<div class="panel panel-default">
			<div class="panel-body">
  <div class="body">
  <div class="table-responsive" > 
  <table class="table table-hover"  >

    <thead>

       

            <tr>		
            			<th></th>
            			
						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />
						
						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />
					
						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fecha de salida')}" />
					
						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fecha de llegada')}" />
					
						<g:sortableColumn property="plazas_disponibles" title="${message(code: 'viaje.plazas_disponibles.label', default: 'Plazas disponibles')}" />
					
						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costo plaza')}" />
						
						<g:sortableColumn property="conductor" title="${message(code: 'viaje.conductor.label', default: 'Conductor')}" />										
															
						
			</tr>

        

    </thead>

    <tbody>

        <g:each in="${viajes}" status="i" var="Viaje">	
						
						<tr>
						
						<Td>
						<sec:ifLoggedIn>
						<g:link action="reservar" id="${Viaje.id}"><span class="">Más detalles</span></g:link>
						</sec:ifLoggedIn>
						 <sec:ifNotLoggedIn>
						 <g:set var="msg" value="${0}"/>
						 <g:link controller='login' action='auth' params="[msg: msg]" ><span class="glyphicon glyphicon-shopping-cart">Más detalles</span></g:link>

						 </sec:ifNotLoggedIn>
						</Td>
						
						<td>${Viaje.origen}</td>
						
						<td>${Viaje.destino}</td>
					
						<td>${Viaje.fecha_salida}</td>
					
						<td>${Viaje.fecha_llegada}</td>
					
						<td>${Viaje.plazas_disponibles}</td>
					
						<td>${Viaje.costoplaza}</td>
					
						<td>${Viaje.conductor}</td>
						
						
						
					</tr>
						

												
                      
					
		</g:each>

    </tbody>

</table>
  </div>
</div>
 </div>   
 </div>
 </div>
 </div>
<asset:javascript  src="scripts.js" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>