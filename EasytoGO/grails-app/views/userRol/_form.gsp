<%@ page import="easytogo.UserRol" %>



<div class="fieldcontain ${hasErrors(bean: userRolInstance, field: 'rol', 'error')} required">
	<label for="rol">
		<g:message code="userRol.rol.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rol" name="rol.id" from="${easytogo.Rol.list()}" optionKey="id" required="" value="${userRolInstance?.rol?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userRolInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userRol.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${userRolInstance?.user?.id}" class="many-to-one"/>

</div>

