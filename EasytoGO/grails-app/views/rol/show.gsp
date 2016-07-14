
<%@ page import="easytogo.Rol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	    <div id="container">
			
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">	
                        <h1 class="page-header">
                            Administracion <small>Rol</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> En este Apartado podras dar de Alta/baja o Modificar roles                             </li>
                        </ol>
                    </div>
                </div>
          </div>
	<div class="row">
		 <div class="container">
		<div id="show-rol" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			
				<g:if test="${rolInstance?.authority}">
				<div class="form-group">
					<span id="authority-label" class="col-md-4 control-label"><g:message code="rol.authority.label" default="Authority" /></span>
						<div class="col-md-6">
						<input class="form-control input-md"  aria-labelledby="authority-label" value="${rolInstance.authority}" readonly>
						</div>
				</div>
				</g:if>
			
			</div>
			<g:form url="[resource:rolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-lg btn-primary" action="edit" resource="${rolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete  btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
			</div>
		</div>
		</div>
		
	</body>
</html>
