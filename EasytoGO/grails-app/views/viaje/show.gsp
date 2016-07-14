
<%@ page import="easytogo.Viaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Mi viaje <small></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i>Puedes editar o eliminar tu viaje publicado</i> 
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
 </div>
		<div id="show-viaje" class="content scaffold-show" role="main">
			<div class="container">
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			  </div>
			
			<div class="form-horizontal">
			<div class="container">
			 <div class="panel panel-default">
			<div class="panel-body">
				<g:if test="${viajeInstance?.origen}">
				
    				 <div class="form-group">
						<span id="origen-label" class="col-md-4 control-label"><g:message code="viaje.origen.label" default="Origen" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="origen-label" value="${viajeInstance?.origen}" readonly>
					</div>
				   	</div>
				
				</g:if>
				
				<g:if test="${viajeInstance?.destino}">
				 <div class="form-group">
					<span id="destino-label" class="col-md-4 control-label"><g:message code="viaje.destino.label" default="Destino" /></span>
						<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="destino-label" value="${viajeInstance?.destino}" readonly>
						</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_salida}">
				 <div class="form-group">
					<span id="fecha_salida-label" class="col-md-4 control-label"><g:message code="viaje.fecha_salida.label" default="Fecha de salida" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fecha_salida-label" value="${viajeInstance?.fecha_salida}" readonly>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_llegada}">
				<div class="form-group">
					<span id="fecha_llegada-label" class="col-md-4 control-label"><g:message code="viaje.fecha_llegada.label" default="Fecha de llegada" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md formatdate" aria-labelledby="fecha_llegada-label" value="${viajeInstance?.fecha_llegada}" readonly>
				</div>
				   	</div>
				</g:if>
				
			
				
		
				
				
				
							
				<g:if test="${viajeInstance?.plazas_disponibles}">
				<div class="form-group">
					<span id="plazas_disponibles-label" class="col-md-4 control-label"><g:message code="viaje.plazas_disponibles.label" default="Plazas disponibles" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="plazas_disponibles-label"  value="${viajeInstance?.plazas_disponibles}" readonly>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.costoplaza}">
				<div class="form-group">
					<span id="costoplaza-label" class="col-md-4 control-label"><g:message code="viaje.costoplaza.label" default="Costo por plaza" /> ARS$</span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="costoplaza-label" value="${viajeInstance?.costoplaza}" readonly><span></span>
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
					<span id="conductor-label" class="col-md-4 control-label"><g:message code="viaje.conductor.label" default="Perfil del conductor" /></span>
					<div class="col-md-6" >	
						<g:form controller="user"action="show" id="${viajeInstance?.conductor?.id}" >
						<button class="form-control btn btn-info" aria-labelledby="conductor-label" ><span class="glyphicon glyphicon-user " ></span> 	${viajeInstance?.conductor?.encodeAsHTML()} </button>
						</g:form>
					</div>
				   	</div>
				</g:if>
			
				
			
				
				<div class="form-group">
					<span id="equipaje-label" class="col-md-4 control-label"><g:message code="viaje.equipaje.label" default="¿Permite equipaje?" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="equipaje-label" value="${viajeInstance?.equipaje == 0 ? 'NO' : viajeInstance?.equipaje == 1 ? 'Pequeño (bolsa o maletín)' : viajeInstance.equipaje == 2 ? 'Mediano (bolso hasta 15 kg)' : 'Grande (valija)'}"readonly>
					</div>
				   	</div>
				
			
				
				<div class="form-group">
					<span id="fumar-label" class="col-md-4 control-label"><g:message code="viaje.fumar.label" default="¿Permite fumar?" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fumar-label" value="${viajeInstance?.fumar == true ? 'SI': 'NO'}"readonly>
					</div>
				   	</div>
				
			
				
				<div class="form-group">
					<span id="mascota-label" class="col-md-4 control-label"><g:message code="viaje.mascota.label" default="¿Permite mascotas?" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="mascota-label" value="${viajeInstance.mascota == 0 ? 'SI' : 'NO'}"readonly>
					</div>
				   	</div>
				
				
	
				
			
			
			<g:form url="[resource:viajeInstance, action:'delete']" method="DELETE">
				<div class="form-group">
				<span id="mascota-label" class="col-md-4 control-label"></span>
				<fieldset class="buttons col-md-6">
					<g:link class="edit btn btn-success" action="edit" resource="${viajeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
					</div>
			</g:form>
		</div>
		</div>
		</div>
		</div>
			</div>
	</body>
</html>
