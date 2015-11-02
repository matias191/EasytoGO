
<%@ page import="easytogo.Marca" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'marca.label', default: 'Marca')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		 <div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administracion <small>ABM-Marcas</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Marca de Vehiculos
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
		<div class="row">
		 <div class="container">
		
		<div id="show-marca" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			
			<div class="form-horizontal">
			
			<g:if test="${marcaInstance?.nombre}">
				<div class="form-group">
					<span id="nombre-label" class="col-md-4 control-label"><g:message code="marca.nombre.label" default="Nombre" /></span>
					<div class="col-md-6">
						<input class="form-control input-md" aria-labelledby="nombre-label" value="${marcaInstance.nombre}"readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${marcaInstance?.modelos}">
				<div class="form-group">
					<span id="modelos-label" class="col-md-4 control-label"><g:message code="marca.modelos.label" default="Modelos" /></span>
					<div class="col-md-6">
						<select id="selectbasic" name="selectbasic" class="form-control">
						<g:each in="${marcaInstance.modelos}" var="m">
						<option value="m" class="property-value" aria-labelledby="modelos-label">${m?.encodeAsHTML()}</option>
						</g:each>
						</select>
					</div>
				</div>
				</g:if>
		    </div>
              </div>
                  </div>
          
          
				
		<div class="row" style="padding-left:30px;">
	
			<g:form url="[resource:marcaInstance, action:'delete']" method="DELETE">
		
			<div class="form-group">	
				<fieldset class="buttons">
				<br>
				<br>	
					<g:link class="edit btn btn-lg btn-primary" action="edit" resource="${marcaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</div>
				
			</g:form>
			</div>
				   
		       </div>
        	</div>
	</body>
</html>
