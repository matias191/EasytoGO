
<%@ page import="easytogo.Marca" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="administracion">
		<g:set var="entityName" value="${message(code: 'marca.label', default: 'Marca')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
                                <i class="fa fa-dashboard"></i> Este Apartado  Muestra las Marcas Existentes de Vehiculos
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
		
			<div class="container">
		<h3 class="page-header">
                            Crear nueva Marca 
                        </h3>
		<g:link class="btn  btn-primary" action="create" resource="${marcaInstance}"><g:message code="default.button.create.label" default="Crear" /></g:link>
		 </div>
		
		
		
		<div class="row">
		 <div class="container">
		<div id="list-marca" class="content scaffold-list" role="main">
			<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			
			
			
			  <div class="table-responsive" > 
  				<table class="table table-hover"  >

   			<thead>

       

            <tr>		
            			
            			
						<g:sortableColumn property="nombre" title="${message(code: 'marca.nombre.label', default: 'Marca')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'Accion.nombre.label', default: 'Accion')}" />
						
			</tr>

        

    		</thead>

    <tbody>

       <g:each in="${marcaInstanceList}" status="i" var="marcaInstance">
						
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
											
						<td><g:link action="show" id="${marcaInstance.id}">${fieldValue(bean: marcaInstance, field: "nombre")}</g:link></td>
																		
						<Td>
						<sec:ifLoggedIn>
						<g:link action="edit" class="btn-sm btn-primary"id="${marcaInstance.id}"><span class="glyphicon glyphicon-pencil"></span></g:link>
					
						<g:link  resource="marca" method="DELETE"class="btn btn-sm btn-danger" id="${marcaInstance.id}" action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ><span class="glyphicon glyphicon-remove"></span>
						</g:link>
						
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
						 <a class="home" href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-pencil"></span></a>
						 <a class="home" href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-remove"></span></a>
						</sec:ifNotLoggedIn>
						</Td>
						
							
					 							
						
					</tr>
						

												
                      
					
		</g:each>

    </tbody>

</table>
  
 </div>   
 
 
			<nav>
			<ul class="pagination">
				<li>
				 <a href="#" aria-label="Previous">
       			 <span aria-hidden="true">&laquo;</span>
      				</a>
      			 </li>
				<li><g:paginate total="${marcaInstanceCount ?: 0}" /> </li>
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
	</body>
</html>
