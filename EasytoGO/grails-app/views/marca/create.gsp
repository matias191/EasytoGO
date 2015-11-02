<%@ page import="easytogo.Marca" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'marca.label', default: 'Marca')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="container">
			
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">	
                        <h1 class="page-header">
                            Administracion <small>ABM-Marcas</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> En este Apartado se permite la Creacion de Nuevas Marcas de Vehiculos
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
		<div class="row">
		 <div class="container">
		 	
		<div id="create-marca" class="content scaffold-create" role="main">
			<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${marcaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${marcaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:marcaInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<div class="form-group col-md-2">
				<br>
				
					<button name="create" class="save btn btn-primary btn-lg"  >Crear</button>
				</div	>
			</g:form>
			 </div>
		</div>
		 </div>
	
	
	
	
	
	
	
	</div>
	
	</body>
</html>
