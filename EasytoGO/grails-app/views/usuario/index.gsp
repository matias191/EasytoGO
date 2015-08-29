
<%@ page import="easytogo.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="fecNac" title="${message(code: 'usuario.fecNac.label', default: 'Fecha de nacimiento')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'usuario.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'usuario.mail.label', default: 'E-mail')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'usuario.telefono.label', default: 'Telefono')}" />
						
						<g:sortableColumn property="direccion" title="${message(code: 'usuario.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="fecVencCarnet" title="${message(code: 'usuario.fecVencCarnet', default: 'Vencimiento Carnet')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
					
						<td><g:formatDate date="${usuarioInstance.fecNac}" format="yyyy-MM-dd"  /></td>
					
						<!--  <td>${fieldValue(bean: usuarioInstance, field: "sexo")}</td>-->
						
						<td>${usuarioInstance.sexo == 1 ? 'Masculino' : 'Femenino'}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "telefono")}</td>
						
						<td>${fieldValue(bean: usuarioInstance, field: "direccion")}</td>
						
						<td><g:formatDate date="${usuarioInstance.fecVencCarnet}" format="yyyy-MM"  /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
