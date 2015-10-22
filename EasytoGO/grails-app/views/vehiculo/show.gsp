
<%@ page import="easytogo.Vehiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="show-vehiculo" class="content scaffold-show" role="main">
			<h1>Mi vehículo</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			<div class="container">
			
			<g:if test="${vehiculoInstance?.avatar}">
			<div class="form-group">
				<span class="col-md-4 control-label" >
				
				<img class="avatar" src="${createLink(controller:'vehiculo', action:'avatar_image', id:vehiculoInstance.id)}" />
				
				</span>
				</div>
			</g:if>
			
			<g:if test="${vehiculoInstance?.modelo.marca}">
				<div class="form-group">
					<span id="marca-label" class="col-md-4 control-label"><g:message code="vehiculo.modelo.marca.label" default="Marca" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="marca-label" value="${vehiculoInstance?.modelo?.marca?.encodeAsHTML()}"readonly>
					</div>
				   	</div>
				</g:if>
			
				<g:if test="${vehiculoInstance?.modelo}">
				<div class="form-group">
					<span id="modelo-label"  class="col-md-4 control-label"><g:message code="vehiculo.modelo.label" default="Modelo" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="modelo-label" value="${vehiculoInstance?.modelo?.encodeAsHTML()}"readonly>
					</div>
				   	</div>
				</g:if>
			
				<g:if test="${vehiculoInstance?.anio}">
				<div class="form-group">
					<span id="anio-label" class="col-md-4 control-label"><g:message code="vehiculo.anio.label" default="Año" /></span>
					<div class="col-md-6">
						<input class="form-control input-md" aria-labelledby="anio-label"value="${vehiculoInstance.anio}"readonly>
					</div>
				   	</div>
				</g:if>
			
				<g:if test="${vehiculoInstance?.color}">
				<div class="form-group">
					<span id="color-label" class="col-md-4 control-label"><g:message code="vehiculo.color.label" default="Color" /></span>
						<div class="col-md-6">
						<input class="form-control input-md" aria-labelledby="color-label"value="${vehiculoInstance.color}"readonly>
					</div>
				   	</div>
				</g:if>
			
				<g:if test="${vehiculoInstance?.combustible}">
				<div class="form-group">
					<span id="combustible-label" class="col-md-4 control-label"><g:message code="vehiculo.combustible.label" default="Combustible" /></span>
					<div class="col-md-6">
							<input class="form-control input-md" aria-labelledby="combustible-label" value="${vehiculoInstance.combustible == 1 ? 'Nafta' : vehiculoInstance.combustible == 2 ? 'Gasoil' : 'GNC'}"readonly>
				</div>
				   	</div>
				</g:if>
				
				
				
				
			
				<g:if test="${vehiculoInstance?.seguro}">
				<div class="form-group">
					<span id="seguro-label"class="col-md-4 control-label"><g:message code="vehiculo.seguro.label" default="Seguro" /></span>
					<div class="col-md-6">
						<input class="form-control input-md" aria-labelledby="seguro-label" value="${vehiculoInstance?.seguro == 1 ? 'SI' : 'NO'}" readonly>
					</div>
				   	</div>
				
				</g:if>
			<!-- 
				<g:if test="${vehiculoInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="vehiculo.user.label" default="User" /></span>
						
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${vehiculoInstance?.user?.id}">${vehiculoInstance?.user?.encodeAsHTML()}kjhk</g:link></span>
					
				</li>
				</g:if>
			 -->
			</div>
			
				<div class="form-group">
					<span id="seguro-label"class="col-md-4 control-label"></span>
					<div class="col-md-6">
					<g:form url="[resource:vehiculoInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
				    	<g:link class="edit btn btn-success btn-lg" action="edit" resource="${vehiculoInstance}"><g:message code="default.button.edit.label" default="Edit" /> /Agregar foto</g:link>
					<!-- <g:link class="edit" action="edit" resource="${vehiculoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link> editar q nunca se usa, se elimina directamente--> 
						<g:actionSubmit class="delete btn btn-success btn-lg" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</g:form>
				</div>
				
				   	</div>
			
		</div>
	</body>
</html>
