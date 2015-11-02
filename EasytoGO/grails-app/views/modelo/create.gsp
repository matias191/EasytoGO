<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'modelo.label', default: 'Modelo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
                                <i class="fa fa-dashboard"></i> En este Apartado se permite la Creacion de Nuevos Modelos de Vehiculos
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
		<div class="row">
		 <div class="container">
		<div id="create-modelo" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${modeloInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${modeloInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:modeloInstance, action:'save']" class="form-horizontal" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<div class="form-group col-md-2">
				<br>
					<g:submitButton name="create" class="save btn btn-primary btn-lg"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
		</div>
		</div>
		</div>
	</body>
</html>
