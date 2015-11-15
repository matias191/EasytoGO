
<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<%--
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	--%>
	
	</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
			<div id="page-body" role="main">
			<h2 class="page-header">Cambiar contraseña</h2>
		<div class="form-horizontal">
			<div class="container">
		<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="formCambiarPass"/>
				</fieldset>
				<fieldset class="buttons">
				<div class="form-group">
				<label for="pepe" class="col-md-4 control-label">
					
		
				</label>
				<div class="col-md-3">
				<g:form url="[resource:userInstance, action:'update']" method="PUT" >
					<button action="update" class="btn btn-warning"  > Actualizar</button>
				</g:form>
				</div>
				</div>
				</fieldset>
			</g:form>
			</div>
			</div>
	</div>
	</div>
	</div>
		</div>
</body>
</html>