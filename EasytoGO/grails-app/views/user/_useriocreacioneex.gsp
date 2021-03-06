<%@ page import="easytogo.User"%>

<div class="container">
     <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nombre', 'error')} required controls">
			<label for="nombre"class="col-md-4 control-label"> <g:message code="user.nombre.label"
			default="Nombre" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="nombre"  required="" value="${userInstance?.nombre}" class="form-control input-md" placeholder="Nombre"/>
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
			default="Fecha de nacimiento" /> <span class="required-indicator">*</span>
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
			default="Teléfono" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input name="telefono" required="" value="${userInstance?.telefono}" class="form-control input-md" placeholder="Sin espacios +(Cod País)(Cod Área)(Teléfono) +542613456321"/>
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'direccion', 'error')} required controls">
			<label for="direccion"class="col-md-4 control-label"> <g:message code="user.direccion.label"
			default="Dirección completa" />
			</label>
			<div class="col-md-6">
			<input name="direccion" value="${userInstance?.direccion}" class="form-control input-md" placeholder="Direccion"/><span>(opcional)</span>
			</div>
		</div>
	</div>
	  <div class="form-group">
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fecVencCarnet', 'error')} required controls">
			<label for="fecVencCarnet"class="col-md-4 control-label"> <g:message code="user.fecVencCarnet.label"
			default="Vencimiento del carnet de conducir" /> 
			</label>
			<div class="col-md-6">
			<g:datePicker noSelection="['':'']" name="fecVencCarnet" years="${2015..2020}" precision="month" value="${userInstance?.fecVencCarnet}" /><span>(opcional)</span>
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
       	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required controls">
			<label for="password"class="col-md-4 control-label"> <g:message code="user.password.label"
			default="Contraseña" /> <span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input type="password" name="password" required="" value="${userInstance?.password}" class="form-control input-md" placeholder="Contraseña"/>
		    </div>
		</div>
	</div>
 	<div class="form-group">
       	<div class="fieldcontain controls">
			<label for="confirmPassword" class="col-md-4 control-label">Confirmar contraseña<span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
			<input type="password" name="confirmPassword" required="" value="" placeholder="Repite la Contraseña"class="form-control input-md"/>
			</div>
		</div>
	</div>
	<div class="form-group">
	 <div class="fieldcontain controls">
		<div class="col-md-6">
		<label class="col-md-4 control-label">*Campos Obligatorios</label>
		</div>
	 </div>	
	</div>
 </div>
