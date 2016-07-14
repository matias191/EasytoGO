
<%@ page import="easytogo.UserRol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'userRol.label', default: 'UserRol')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administracion <small>ABM-Usuario/Rol</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Este Apartado podras ver los Roles asignados a los usuario
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
		<div class="row">
		 <div class="container">
		 <div class="container">
		<h3 class="page-header">
                            Asignar Rol a usuario
                        </h3>
        <g:link class="btn  btn-primary" action="create" resource="${userRolInstance}">Asignar</g:link>
		</div>
		<div id="list-userRol" class="content scaffold-list" role="main">
				<h3>Lista Usuario/rol</h3>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<div class="table-responsive" > 
  			<table class="table table-hover"  >
			<thead>
					<tr>
					
						<th><g:message code="userRol.rol.label" default="Rol" /></th>
					
						<th><g:message code="userRol.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userRolInstanceList}" status="i" var="userRolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userRolInstance.id}">${fieldValue(bean: userRolInstance, field: "rol")}</g:link></td>
					
						<td>${fieldValue(bean: userRolInstance, field: "user")}</td>
					
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
				 <li>
				 <g:paginate total="${userRolInstanceCount ?: 0}" />
				</li>
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
