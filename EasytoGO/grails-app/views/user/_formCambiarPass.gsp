<%@ page import="easytogo.User" %>
<div class="container">
     <div class="form-group">
			<div class="fieldcontain required">
	<label for="password1" class="col-md-4 control-label">
		<g:message code="user.password.label" default="Contraseña actual" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:passwordField name="passActual" class="form-control input-md" required="" value="${params.passActual}"/>
</div>
</div>
</div>
 <div class="form-group">
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password" class="col-md-4 control-label">
		<g:message code="user.password.label" default="Nueva contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:passwordField name="passwordNueva" class="form-control input-md" required="" value="${params.passwordNueva}"/>
</div>
</div>
</div>
<div class="form-group">
<div class="fieldcontain required">
	<label for="password2" class="col-md-4 control-label">
		<g:message code="user.password.label" default="Confirme nueva contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:passwordField name="confirmaPassword"  class="form-control input-md" required="" value="${params.confirmaPassword}"/>
</div>
</div>
</div>
</div>