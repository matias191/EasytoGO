<%@ page import="easytogo.User" %>

<div class="container">
     <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nombre', 'error')} required controls">
			<label for="nombre"class="col-md-4 control-label"> <g:message code="user.nombre.label"
			default="Nombre" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="nombre" required="" value="${userInstance?.nombre}" class="form-control input-md" placeholder="Nombre"/>
			</div>
		</div>
	</div>
      
 	  <div class="form-group">	
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'apellido', 'error')} required controls">
			<label for="apellido"class="col-md-4 control-label"> <g:message code="user.apellido.label"
			default="Apellido" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="apellido" required="" value="${userInstance?.apellido}" class="form-control input-md" placeholder="Apellido"/>
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fecNac', 'error')} required controls">
			<label for="fecNac"class="col-md-4 control-label"> <g:message code="user.fecNac.label"
			default="Fecha de Nacimiento" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:datePicker name="fecNac" precision="day" value="${userInstance?.fecNac}" />
			</div>
		</div>
	</div>
    <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sexo', 'error')} required controls">
			<label for="sexo"class="col-md-4 control-label"> <g:message code="user.sexo.label"
			default="Sexo" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:select id="sexo" name="sexo" value="${userInstance.sexo}"
				from="${['1': 'Masculino', '2': 'Femenino']}" optionKey="key"
				optionValue="value" />
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required controls">
			<label for="email"class="col-md-4 control-label"> <g:message code="user.email.label"
			default="E-mail" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="email" required="" value="${userInstance?.email}" class="form-control input-md" placeholder="email"/>
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'telefono', 'error')} required controls">
			<label for="telefono"class="col-md-4 control-label"> <g:message code="user.telefono.label"
			default="Telefono" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="telefono" required="" value="${userInstance?.telefono}" class="form-control input-md" placeholder="Telefono"/>
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'direccion', 'error')} required controls">
			<label for="direccion"class="col-md-4 control-label"> <g:message code="user.direccion.label"
			default="Direccion" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="direccion" value="${userInstance?.direccion}" class="form-control input-md" placeholder="Direccion"/><span>(opcional)</span>
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fecVencCarnet', 'error')} required controls">
			<label for="fecVencCarnet"class="col-md-4 control-label"> <g:message code="user.fecVencCarnet.label"
			default="Vencimiento del carnet de conducir" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<g:datePicker default="none" noSelection="['':'']" name="fecVencCarnet" precision="month" value="${userInstance?.fecVencCarnet}" /><span>(opcional)</span>
			</div>
		</div>
	</div>
    <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required controls">
			<label for="username"class="col-md-4 control-label"> <g:message code="user.username.label"
			default="Usuario" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="username" required="" value="${userInstance?.username}" class="form-control input-md" placeholder="Nombre de Usuario"/>
			</div>
		</div>
		</div>
		
			<div class="form-group">
 				 <label class="col-md-4 control-label" for="selectbasic">Vehiculos</label>
  					<div class="col-md-5">
    				<select id="selectbasic" name="selectbasic" class="form-control">
      				<g:each in="${userInstance?.vehiculos?}" var="v">
      				<option value="v">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</option>
     				 </g:each>
      				</select>
  					</div>
  					<div class="col-md-2">
  					<g:form url="[resource:vehiculoInstance, action:'delete']" method="DELETE">	
  					<g:link class="edit" action="edit" controller="Vehiculo" resource="${UserInstance}" value=""><span class="glyphicon glyphicon-edit">Editar</span></g:link>
					</g:form>
					</div>
			</div>
	</div>
	<%--

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>

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

--%>
