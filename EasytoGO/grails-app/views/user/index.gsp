
<%@ page import="easytogo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="administracion">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div class="container">

		<div class="row">
			<div class="container">
				<div class="col-lg-12">
					<h1 class="page-header">
						Administracion <small>ABM-Usuario</small>
					</h1>
					<ol class="breadcrumb">
						<li class="active"><i class="fa fa-dashboard"></i> Este
							Apartado Muestra Los usuarios existentes</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="container">
				<div id="list-user" class="content scaffold-list" role="main">
					<h1 class="page-header">
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
					<g:if test="${flash.message}">
						<div class="alert alert-success" role="alert">
							${flash.message}
						</div>
					</g:if>


					<div class="table-responsive">
						<table class="table table-hover">

							<thead>
								<tr>

									<g:sortableColumn property="nombre"
										title="${message(code: 'Accion.nombre.label', default: 'Accion')}" />

									<g:sortableColumn property="nombre"
										title="${message(code: 'user.nombre.label', default: 'Nombre')}" />

									<g:sortableColumn property="apellido"
										title="${message(code: 'user.apellido.label', default: 'Apellido')}" />

									<g:sortableColumn property="usuario"
										title="${message(code: 'user.username.label', default: 'Usuario')}" />

									<g:sortableColumn property="fecNac"
										title="${message(code: 'user.fecNac.label', default: 'Fecha de nacimiento')}" />

									<g:sortableColumn property="sexo"
										title="${message(code: 'user.sexo.label', default: 'Sexo')}" />

									<g:sortableColumn property="email"
										title="${message(code: 'user.email.label', default: 'E-email')}" />

									<g:sortableColumn property="telefono"
										title="${message(code: 'user.telefono.label', default: 'Telefono')}" />

									<g:sortableColumn property="direccion"
										title="${message(code: 'user.direccion.label', default: 'Direccion')}" />

									<g:sortableColumn property="fecVencCarnet"
										title="${message(code: 'user.fecVencCarnet', default: 'Vencimiento Carnet')}" />


								</tr>
							</thead>
							<tbody>
								<g:each in="${userInstanceList}" status="i" var="userInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


										<Td><sec:ifLoggedIn>
												<g:link action="edit" id="${userInstance.id}">
													<span class="glyphicon glyphicon-pencil"></span>
												</g:link>
												
											</sec:ifLoggedIn> <sec:ifNotLoggedIn>
												<a class="home" href="${createLink(uri: '/')}"><span
													class="glyphicon glyphicon-pencil"></span></a>
												
											</sec:ifNotLoggedIn></Td>

										<td><g:link action="show" id="${userInstance.id}">
												${fieldValue(bean: userInstance, field: "nombre")}
											</g:link></td>


										<td>
											${fieldValue(bean: userInstance, field: "apellido")}
										</td>

										<td>
											${fieldValue(bean: userInstance, field: "username")}
										</td>

										<td><g:formatDate date="${userInstance.fecNac}"
												format="yyyy-MM-dd" /></td>

										<!--  <td>${fieldValue(bean: userInstance, field: "sexo")}</td>-->

										<td>
											${userInstance.sexo == 1 ? 'Masculino' : 'Femenino'}
										</td>

										<td>
											${fieldValue(bean: userInstance, field: "email")}
										</td>

										<td>
											${fieldValue(bean: userInstance, field: "telefono")}
										</td>

										<td>
											${fieldValue(bean: userInstance, field: "direccion")}
										</td>

										<td><g:formatDate date="${userInstance.fecVencCarnet}"
												format="yyyy-MM" /></td>




									</tr>
								</g:each>
							</tbody>
						</table>
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><g:paginate total="${userInstanceCount ?: 0}" /></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
