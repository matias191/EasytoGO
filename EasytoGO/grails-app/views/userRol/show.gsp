
<%@ page import="easytogo.UserRol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'userRol.label', default: 'UserRol')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="container">
			
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">	
                        <h1 class="page-header">
                            Administracion <small>Roles usuarios</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> En este Apartado podras asignar roles a usuarios
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		<a href="#show-userRol" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userRol" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			
				<div class="form-horizontal">
				<g:if test="${userRolInstance?.rol}">
				<div class="form-group">
				
					<span id="rol-label" class="col-md-4 control-label"><g:message code="userRol.rol.label" default="Rol" /></span>
						<div class="col-md-6">
						<span class="property-value" aria-labelledby="rol-label"><g:link controller="rol" action="show" id="${userRolInstance?.rol?.id}">${userRolInstance?.rol?.encodeAsHTML()}</g:link></span>
							</div>
				</div>
				</g:if>
			
				<g:if test="${userRolInstance?.user}">
				<div class="form-group">
					<span id="user-label" class="property-label"><g:message code="userRol.user.label" default="User" /></span>
						<div class="col-md-6">
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${userRolInstance?.user?.id}">${userRolInstance?.user?.encodeAsHTML()}</g:link></span>
					</div>
				</div>
				</g:if>
			
			</div>
			<g:form url="[resource:userRolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-lg btn-primary" action="edit" resource="${userRolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		  </div>
	</body>
</html>
