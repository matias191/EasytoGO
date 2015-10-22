
<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			<div class="container">
			
			<g:if test="${userInstance?.nombre}">
				<div class="form-group">
					<span id="nombre-label"class="col-md-4 control-label"><g:message code="user.nombre.label" default="Nombre" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md"  aria-labelledby="nombre-label" value="${userInstance.nombre}" readonly>
					</div>
				 </div>
				
			</g:if>
			
				<g:if test="${userInstance?.apellido}">
				<div class="form-group">
					<span id="apellido-label" class="col-md-4 control-label"><g:message code="user.apellido.label" default="Apellido" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="apellido-label" value="${userInstance.apellido}"readonly>
					</div>
				 </div>
				</g:if>
			
				<g:if test="${userInstance?.fecNac}">
				<div class="form-group">
					<span id="fecNac-label" class="col-md-4 control-label"><g:message code="user.fecNac.label" default="Fecha de Nacimiento" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fecNac-label"value="${userInstance.fecNac}"  readonly>
					</div>
				 </div>
				</g:if>
			
				<g:if test="${userInstance?.sexo}">
				<div class="form-group">
					<span id="sexo-label" class="col-md-4 control-label"><g:message code="user.sexo.label" default="Sexo" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="sexo-label" value="${userInstance.sexo == 1 ? 'Masculino' : 'Femenino'}" readonly>
					
					</div>
				 </div>
				</g:if>
			
				<g:if test="${userInstance?.mail}">
				<div class="form-group">
					<span id="mail-label" class="col-md-4 control-label"><g:message code="user.mail.label" default="Mail" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="mail-label"value="${userInstance.mail}"  readonly>
				</div>
				 </div>
				</g:if>
			
				<g:if test="${userInstance?.telefono}">
				<div class="form-group">
					<span id="telefono-label" class="col-md-4 control-label"><g:message code="user.telefono.label" default="Teléfono" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="telefono-label"value="${userInstance.telefono}"  readonly>
				</div>
				 </div>
				</g:if>
			
				<g:if test="${userInstance?.direccion}">
				<div class="form-group">
					<span id="direccion-label" class="col-md-4 control-label"><g:message code="user.direccion.label" default="Dirección" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="direccion-label" value="${userInstance.direccion}"  readonly>
				</div>
				 </div>
				</g:if>
			
				<g:if test="${userInstance?.fecVencCarnet}">
				<div class="form-group">
					<span id="fecVencCarnet-label" class="col-md-4 control-label"><g:message code="user.fecVencCarnet.label" default="Vencimiento carnet de conducir" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fecVencCarnet-label" value="${userInstance?.fecVencCarnet}" readonly>
					</div>
				 </div>
				</g:if>
			
			
				<g:if test="${userInstance?.username}">
				<div class="form-group">
					<span id="username-label" class="col-md-4 control-label"><g:message code="user.username.label" default="Username" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="username-label" value="${userInstance?.username}" readonly>
					</div>
				 </div>
				</g:if>
			
				<%--<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>--%>
				
			<g:if test="${userInstance?.vehiculos}">
				<div class="form-group">
					<span id="vehiculos-label" class="col-md-4 control-label"><g:message code="user.vehiculos.label" default="Vehículos" /></span>
					<div class="col-md-6">	
						<g:each in="${userInstance.vehiculos}" var="v">
						<g:form controller="vehiculo" action="show" id="${v.id}"> 
						<button class="form-control btn btn-info" aria-labelledby="vehiculos-label" ><span class="glyphicon glyphicon-user " ></span>${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</button>
						</g:form>
						</g:each>
					</div>
				 </div>
				</g:if>
				
			
				
			
			
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
					
				<div class="form-group">		
				 <label class="col-md-4 control-label" for="button1id"></label>
				 <div class="col-md-4">
   					<g:form action="updatePassword" resource="${userInstance}">
					<button  class="edit form-control btn btn-info" name="button1id" id="button1id">Cambiar Contraseña</button>
					</g:form>
				 </div>
				 </div>
				 
				 <div class="form-group">
    			<label class="col-md-4 control-label" for="singlebutton"></label>
    			<div class="col-md-4">
    				<g:form action="edit" resource="${userInstance}">
					<button class="form-control btn btn-info"   name="button2id" id="button2id" >Agregar/Editar vehiculo</button>
					</g:form>
				 </div>
 				 </div>
 				 
				<div class="form-group">
				<label class="col-md-4 control-label" for="singlebutton"></label>
				<div class="col-md-4">
				<g:form action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
					<button class="delete form-control btn btn-info" >Eliminar Usuario </button>
				</g:form>
				</div>
				 </div>
			
			</g:form>
			
			</div>
			</div>
		</div>
		
	</body>
</html>
