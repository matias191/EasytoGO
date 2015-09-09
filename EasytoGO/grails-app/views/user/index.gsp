
<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nombre" title="${message(code: 'user.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'user.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="fecNac" title="${message(code: 'user.fecNac.label', default: 'Fecha de nacimiento')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'user.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'user.mail.label', default: 'E-mail')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'user.telefono.label', default: 'Telefono')}" />
						
						<g:sortableColumn property="direccion" title="${message(code: 'user.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="fecVencCarnet" title="${message(code: 'user.fecVencCarnet', default: 'Vencimiento Carnet')}" />
					
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "nombre")}</g:link></td>
					
						
						<td>${fieldValue(bean: userInstance, field: "apellido")}</td>
					
						<td><g:formatDate date="${userInstance.fecNac}" format="yyyy-MM-dd"  /></td>
					
						<!--  <td>${fieldValue(bean: userInstance, field: "sexo")}</td>-->
						
						<td>${userInstance.sexo == 1 ? 'Masculino' : 'Femenino'}</td>
					
						<td>${fieldValue(bean: userInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "telefono")}</td>
						
						<td>${fieldValue(bean: userInstance, field: "direccion")}</td>
						
						<td><g:formatDate date="${userInstance.fecVencCarnet}" format="yyyy-MM"  /></td>
						
						
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
