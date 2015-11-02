
<%@ page import="easytogo.Modelo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'modelo.label', default: 'Modelo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="container">
			
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">	
                        <h1 class="page-header">
                            Administracion <small>ABM-Modelos</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> En este Apartado muestra detalle de modelos de Vehiculos
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
		<div class="row">
		 <div class="container">
		<div id="show-modelo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			
				<g:if test="${modeloInstance?.marca}">
				<div class="form-group">
					<span id="marca-label" class="col-md-4 control-label"><g:message code="modelo.marca.label" default="Marca" /></span>
					<div class="col-md-6">
							<input class="form-control input-md" aria-labelledby="marca-label" value="${modeloInstance?.marca?.encodeAsHTML()}" readonly>
				</div>
				</div>
				</g:if>
			
				<g:if test="${modeloInstance?.nombre}">
				<div class="form-group">
					<span id="nombre-label"  class="col-md-4 control-label"><g:message code="modelo.nombre.label" default="Nombre" /></span>
					<div class="col-md-6">
							<input class="form-control input-md" aria-labelledby="nombre-label" value="${modeloInstance.nombre}" readonly>
				</div>
				</div>
				</g:if>
			
				<g:if test="${modeloInstance?.vehiculos}">
				<div class="form-group">
					<span id="vehiculos-label"  class="col-md-4 control-label"><g:message code="modelo.vehiculos.label" default="Vehiculos" /></span>
					
						
						<g:each in="${modeloInstance.vehiculos}" var="v">
						
						<span class="col-md-6">
							<input class="form-control input-md" aria-labelledby="vehiculos-label" value="${v?.encodeAsHTML()}" readonly/>
						</span>
						
						</g:each>
						
				
				</div>
				</g:if>
			
			
			<g:form url="[resource:modeloInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-lg btn-primary" action="edit" resource="${modeloInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		</div>
		</div>
		</div>
		</div>
	</body>
</html>
