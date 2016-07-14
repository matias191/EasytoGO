<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="administracion"/>
<title>Reportes</title>
</head>
<body>
<div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administración <small>Reportes</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Este apartado  muestra los reportes relevantes del sistema
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
<div class="container">
<g:if test="${flash.message}">
<div class="alert alert-success" role="alert">${flash.message}</div>
</g:if>
<h3 class="page-header">Selecciona el rango de fechas</h3>
<div class="panel panel-default">
			<div class="panel-body">
<fieldset>
	<g:form action="Reportes" method="GET" class="form-horizontal">
		<div class="container">
		
<%--					<div class="form-group">--%>
<%--					<label class="col-md-4 control-label" for="query"><span class="glyphicon glyphicon-map-marker"></span>Reporte</label>--%>
<%--					<div class="col-md-6">--%>
<%--					<g:select id="myselect" name="tReport" value="${params.report}"--%>
<%--         	 		from="${[0: 'CANTIDAD DE VIAJES PUBLICADOS', 1: 'CANTIDAD DE VIAJES REALIZADOS', 2: 'CANTIDAD DE VIAJES NO CONCRETADOS', --%>
<%--						  3: 'CANTIDAD DE RESERVAS REALIZADAS', 4: 'CANTIDAD DE RESERVAS CANCELADAS', 5: 'GANANCIAS POR DESTINOS', --%>
<%--						  6: 'GANANCIAS POR ORIGEN']}"--%>
<%--         	 		optionKey="key" optionValue="value" />	--%>
<%--         	 		</div>--%>
<%--								--%>
<%--					</div>--%>
<%--		<div class="form-group">--%>
<%--					<label class="col-md-4 control-label" for="query"><span class="glyphicon glyphicon-map-marker"></span>Origen</label>--%>
<%--					<div class="col-md-4">--%>
<%--					--%>
<%--					<g:textField id="pac-input2" class="form-control input-md" name="origen" value="${params.origen}"/> <br>--%>
<%--					</div>--%>
<%--		</div>--%>
<%--		<div class="form-group">--%>
<%--					<label class="col-md-4 control-label" for="query"><span class="glyphicon glyphicon-map-marker"></span>Destino</label>--%>
<%--					<div class="col-md-4">--%>
<%--					--%>
<%--					<g:textField id="pac-input2" class="form-control input-md" name="destino" value="${params.destino}"/> <br>--%>
<%--					</div>--%>
<%--					</div>--%>
		<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fecha_desde', 'error')} required controls">
			<label for="fecha_desde" class="col-md-4 control-label"> <g:message code="fecha_desde"
			default="Fecha Desde" /> 
			</label>
<%--			<div class="col-md-6">--%>
<%--			<g:datePicker name="desde" precision="day" class="form-control input-md" value="${params.desde}"  />  --%>
<%--			</div>--%>
			<div class="fieldcontain" style="margin-top:0.3em; padding: 0 25% 0 25%;" >						
						       <div class="input-group date input-group-sm col-lg-12" >
      							<input id="date" type="text" class="form-control" name="desde" value="${params.desde}" placeholder="Fecha de Viaje"><span class="input-group-addon" ><i class="glyphicon glyphicon-th"></i></span>
    						   </div>
			</div>
		</div>
		</div>
		<div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: viajeInstance, field: 'fecha_llegada', 'error')} required controls">
			<label for="fecha_hasta" class="col-md-4 control-label"> <g:message code="fecha_hasta"
			default="Fecha Hasta" /> 
			</label>
<%--			<div class="col-md-6">--%>
<%--			<g:datePicker name="hasta" precision="day" class="form-control input-md" value="${params.hasta}"  />  --%>
<%--			</div>--%>
			<div class="fieldcontain" style="margin-top:0.3em; padding: 0 25% 0 25%;" >						
						       <div class="input-group date input-group-sm col-lg-12" >
      							<input id="date" type="text" class="form-control" name="hasta" value="${params.hasta}" placeholder="Fecha de Viaje"><span class="input-group-addon" ><i class="glyphicon glyphicon-th"></i></span>
    						   </div>
			</div>
		</div>
	</div>
	
	</div>
					
					<div class="form-group">
					<label class="col-md-4 control-label" for="singlebutton"></label>
					<div class="col-md-4">
					<button type="submit" class="controls btn btn-success btn-md rounded"  value="Buscar">Generar</button>
					</div>
					</div>
					
		
      
	</g:form>
</fieldset>
</div>
</div>
<div class="container">
<h3 class="page-header">Cantidad de viajes con Origen</h3>
<br>
<center>
<div id=piechart4></div>
<gvisualization:pieCoreChart dynamicLoading="${true}" elementId="piechart4" title="${titulo3}"
 width="${450}" height="${300}" columns="${columnas3}" data="${datos3}" />
 </center>
<center>
<div id=piechart1></div>
<gvisualization:pieCoreChart dynamicLoading="${true}" elementId="piechart1" title="${titulo}"
 width="${450}" height="${300}" columns="${columnas}" data="${datos}" />
 </center>
<h3 class="page-header">Cantidad de viajes con Destino</h3>
<br>
<center>
<div id=piechart2></div>
<gvisualization:pieCoreChart dynamicLoading="${true}" elementId="piechart2" title="${titulo1}"
 width="${450}" height="${300}" columns="${columnas1}" data="${datos1}" />
</center>
<h3 class="page-header">Cantidad de reservas realizadas</h3>
<br>
<center>
<div id=piechart3></div>
<gvisualization:pieCoreChart dynamicLoading="${true}" elementId="piechart3" title="${titulo2}"
 width="${450}" height="${300}" columns="${columnas2}" data="${datos2}" />
</center>

<center>
<div id=linechart></div>
<gvisualization:lineCoreChart dynamicLoading="${true}" elementId="linechart" title="${titulo4}"
 width="${450}" height="${300}" columns="${columnas4}" data="${datos4}" />
</center>




</div>
<%-- <div class="body">--%>
<%-- <div class="table-responsive" > --%>
<%--  <table class="table table-hover"  >--%>
<%----%>
<%--    <thead>--%>
<%----%>
<%--       --%>
<%----%>
<%--            <tr>		--%>
<%--            			--%>
<%--            			--%>
<%--						<g:sortableColumn property="origen" title="${message(code: 'viaje.origen.label', default: 'Origen')}" />--%>
<%--						--%>
<%--						<g:sortableColumn property="destino" title="${message(code: 'viaje.destino.label', default: 'Destino')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="fecha_salida" title="${message(code: 'viaje.fecha_salida.label', default: 'Fecha de salida')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="fecha_llegada" title="${message(code: 'viaje.fecha_llegada.label', default: 'Fecha de llegada')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="plazas_disponibles" title="${message(code: 'viaje.plazas_disponibles.label', default: 'Plazas disponibles')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="costoplaza" title="${message(code: 'viaje.costoplaza.label', default: 'Costo plaza')}" />--%>
<%--						--%>
<%--						<g:sortableColumn property="conductor" title="${message(code: 'viaje.conductor.label', default: 'Conductor')}" />										--%>
<%--															--%>
<%--						--%>
<%--			</tr>--%>
<%----%>
<%--        --%>
<%----%>
<%--    </thead>--%>
<%----%>
<%--    <tbody>--%>
<%----%>
<%--        <g:each in="${viajes1}" status="i" var="Viaje">	--%>
<%--						--%>
<%--						<tr>--%>
<%--						--%>
<%--						--%>
<%--						--%>
<%--						<td>${Viaje.origen}</td>--%>
<%--						--%>
<%--						<td>${Viaje.destino}</td>--%>
<%--					--%>
<%--						<td>${Viaje.fecha_salida}</td>--%>
<%--					--%>
<%--						<td>${Viaje.fecha_llegada}</td>--%>
<%--					--%>
<%--						<td>${Viaje.plazas_disponibles}</td>--%>
<%--					--%>
<%--						<td>${Viaje.costoplaza}</td>--%>
<%--					--%>
<%--						<td>${Viaje.conductor}</td>--%>
<%--						--%>
<%--						--%>
<%--						--%>
<%--					</tr>--%>
<%--						--%>
<%----%>
<%--												--%>
<%--                      --%>
<%--					--%>
<%--		</g:each>--%>
<%----%>
<%--    </tbody>--%>
<%----%>
<%--</table>--%>
<%--  --%>
<%-- </div> --%>
<%-- </div>  --%>
 </div>
  </div>
 
<asset:javascript  src="scripts.js" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>