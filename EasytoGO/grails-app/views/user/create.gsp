<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" language="JavaScript">
<!--
//--------------------------------
// This code compares two fields in a form and submit it
// if they're the same, or not if they're different.
//-------------------------------->
function checkPass(theForm) {
    if (theForm.password.value != theForm.confirmPassword.value)
    {
        alert('La contraseña y la confirmación de la contraseña no son las mismas. Vuélvalas a ingresar.');
        return false;
    } else {
        return true;
    }
}

</script>

	</head>
	<body>
		<div class="container">
		<div class="row">
	
			<h1>Registrarse</h1><!-- "crear usuario" titulo -->
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form url="[resource:userInstance, action:'save']"class="form-horizontal" onsubmit="return checkPass(this);">
				<fieldset>
					<g:render template="useriocreacioneex"/>  <!-- llama al "form" --> 
				</fieldset>
				
				<fieldset class="buttons">
				<div class="container">
					<div class="form-group">
					<label class="col-md-4 control-label" for="singlebutton"></label>
					<div class="col-md-4">
					<g:submitButton name="create" class="save btn btn-success btn-lg" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
					</div>
    			</div>	
				</fieldset>
			</g:form>
			
			
	  </div>
		</div>

		
	</body>
</html>
