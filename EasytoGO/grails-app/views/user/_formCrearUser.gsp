<%@ page import="easytogo.User"%>


<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'nombre', 'error')} required">
	<label for="nombre"> <g:message code="user.nombre.label"
			default="Nombre" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${userInstance?.nombre}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'apellido', 'error')} required">
	<label for="apellido"> <g:message code="user.apellido.label"
			default="Apellido" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required=""
		value="${userInstance?.apellido}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'fecNac', 'error')} required">
	<label for="fecNac"> <g:message code="user.fecNac.label"
			default="Fecha de nacimiento" /> <span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecNac" precision="day"
		value="${userInstance?.fecNac}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'sexo', 'error')} required">
	<label for="sexo"> <g:message code="user.sexo.label"
			default="Sexo" /> <span class="required-indicator">*</span>
	</label>
	<!-- <g:field name="sexo" type="number" value="${userInstance.sexo}" required=""/> -->


	<g:select id="sexo" name="sexo" value="${userInstance.sexo}"
		from="${['1': 'Masculino', '2': 'Femenino']}" optionKey="key"
		optionValue="value" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
	<label for="mail"> <g:message code="user.mail.label"
			default="E-mail" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${userInstance?.mail}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'telefono', 'error')} required">
	<label for="telefono"> <g:message code="user.telefono.label"
			default="Telefono" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required=""
		value="${userInstance?.telefono}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'direccion', 'error')} required">
	<label for="direccion"> <g:message code="user.direccion.label"
			default="Direccion" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required=""
		value="${userInstance?.direccion}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'fecVencCarnet', 'error')} required">
	<label for="fecVencCarnet"> <g:message
			code="user.fecVencCarnet.label"
			default="Vencimiento del carnet de conducir" /> <span
		class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecVencCarnet" precision="month"
		value="${userInstance?.fecVencCarnet}" />

</div>


<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username"> <g:message code="user.username.label"
			default="Usuario" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required=""
		value="${userInstance?.username}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password"> <g:message code="user.password.label"
			default="Contraseña" /> <span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required=""
		value="${userInstance?.password}" />

</div>
<!-- 
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

</div>

-->