
<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<%--
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	--%>
	<script type="text/javascript" language="JavaScript">
<!--
//--------------------------------
// This code compares two fields in a form and submit it
// if they're the same, or not if they're different.
//-------------------------------->
function checkPass(theForm) {
    if (theForm.passwordNueva.value != theForm.confirmaPassword.value)
    {
        alert('La contraseña nueva y la confirmación de la contraseña nueva no son las mismas. Vuélvalas a ingresar.');
        return false;
    } else {
        return true;
    }
}

</script>
	</head>
<body>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
			<div id="page-body" role="main">
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<h2 class="page-header">Cambiar contraseña</h2>
		<div class="form-horizontal">
			<div class="container">
		<g:form url="[resource:userInstance, action:'cambiarPass']" method="PUT" onsubmit="return checkPass(this);">
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
					<button action="cambiarPass" class="btn btn-warning"  > Actualizar</button>
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