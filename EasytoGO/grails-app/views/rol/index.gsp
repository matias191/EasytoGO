
<%@ page import="easytogo.Rol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administracion <small>ABM-Rol</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Este Apartado  Muestra los Roles existentes para los usuarios del sistema
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
          
        <div class="container">
		<h3 class="page-header">
                            Crear nuevo Rol 
                        </h3>
		<g:link class="btn  btn-primary" action="create" resource="${rolInstance}"><g:message code="default.button.create.label" default="Crear" /></g:link>
		 </div>
		<div class="row">
		 <div class="container">
		<div id="list-rol" class="content scaffold-list" role="main">
			<h3>Lista de Roles</h3>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<div class="table-responsive" > 
  			<table class="table table-hover"  >
			<thead>
					<tr>
					
						<g:sortableColumn property="authority" title="${message(code: 'rol.authority.label', default: 'Authority')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${rolInstanceList}" status="i" var="rolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${rolInstance.id}">${fieldValue(bean: rolInstance, field: "authority")}</g:link></td>
					
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
				 <li><g:paginate total="${rolInstanceCount ?: 0}" /></li>
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
