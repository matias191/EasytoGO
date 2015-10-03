<%@ page import="easytogo.User" %>

<div class="fieldcontain required">
	<label for="password1">
		<g:message code="user.password.label" default="Contraseña actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="passwordActual" required="" value=""/>

</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Nueva Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value=""/>

</div>

<div class="fieldcontain required">
	<label for="password2">
		<g:message code="user.password.label" default="Confirme nueva contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="confirmaPassword" required="" value=""/>

</div>