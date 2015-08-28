<%@ page import="easytogo.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${usuarioInstance?.apellido}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fecNac', 'error')} required">
	<label for="fecNac">
		<g:message code="usuario.fecNac.label" default="Fecha de nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecNac" precision="day"  value="${usuarioInstance?.fecNac}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="usuario.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<!-- <g:field name="sexo" type="number" value="${usuarioInstance.sexo}" required=""/> -->
	
          
    <g:select id="sexo" name="sexo" value="${usuarioInstance.sexo}"
          from="${['1': 'Masculino', '2': 'Femenino']}"
          optionKey="key" optionValue="value" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="usuario.mail.label" default="E-mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${usuarioInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="usuario.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${usuarioInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="usuario.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${usuarioInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fecVencCarnet', 'error')} required">
	<label for="fecVencCarnet">
		<g:message code="usuario.fecVencCarnet.label" default="Vencimiento del carnet de conducir" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecVencCarnet" precision="month"  value="${usuarioInstance?.fecVencCarnet}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="usuario.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" required="" value="${usuarioInstance?.user}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'pass', 'error')} required">
	<label for="pass">
		<g:message code="usuario.pass.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="pass" required="" value="${usuarioInstance?.pass}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'vehiculos', 'error')} ">
	<label for="vehiculos">
		<g:message code="usuario.vehiculos.label" default="Vehiculos" />
		
	</label>

<ul class="one-to-many">
<g:each in="${usuarioInstance?.vehiculos?}" var="v">
    <li><g:link controller="vehiculo" action="show" id="${v.id}">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehiculo" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehiculo.label', default: 'Vehiculo')])}</g:link>
</li>
</ul>
 

</div>


