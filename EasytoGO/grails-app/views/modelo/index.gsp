
<%@ page import="easytogo.Modelo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'modelo.label', default: 'Modelo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	 <div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administracion <small>ABM-Modelos</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Este Apartado  Muestra los Modelos Existentes de Vehiculos
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
		<div class="container">
		<h3 class="page-header">
                            Crear nuevo modelo 
                        </h3>
		<g:link class="btn  btn-primary" action="create" resource="${modeloInstance}"><g:message code="default.button.create.label" default="Crear" /></g:link>
		 </div>
		
		
		<div class="row">
		 <div class="container">
		<div id="list-modelo" class="content scaffold-list" role="main">
			<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			
			
		<div class="table-responsive" > 
  			<table class="table table-hover"  >
			<thead>
					<tr>
						<g:sortableColumn property="nombre" title="${message(code: 'modelo.nombre.label', default: 'Modelo')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'marca.nombre.label', default: 'Marca')}" />
						<g:sortableColumn property="nombre" title="Accion" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${modeloInstanceList}" status="i" var="modeloInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					<td><g:link action="show" id="${modeloInstance.id}">${fieldValue(bean: modeloInstance, field: "nombre")}</g:link></td>
					
					<td>${fieldValue(bean: modeloInstance, field: "marca")}</td>
					<td>
					<sec:ifLoggedIn>
						<g:link action="edit" id="${modeloInstance.id}"><span class="glyphicon glyphicon-pencil"></span></g:link>
						<g:link action="delete" method="DELETE"  controller="modelo" resource="modeloInstance"id="${modeloInstance.id}"><span class="glyphicon glyphicon-remove"></span></g:link>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
						 <a class="home" href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-pencil"></span></a>
						 <a class="home" href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-remove"></span></a>
					</sec:ifNotLoggedIn>
					</td>	
					</tr>
				</g:each>
				</tbody>
			</table>
			<nav>
			<ul class="pagination">
				<li>
				 <a href="#" aria-label="Previous">
       			 <span aria-hidden="true">&laquo;</span>
      				</a>
      			 </li>
				<li><g:paginate total="${modeloInstanceCount ?: 0}" /></li>
				<li> <a href="#" aria-label="Next">
      			  <span aria-hidden="true">&raquo;</span>
    				  </a>
				</li>
			</ul>
			</nav>
			</div>
		</div>
		</div>
		</div>
		</div>
	</body>
</html>
