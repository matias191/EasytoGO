
<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 16em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
	</style>
	</head>
	<body>
	<div class="container">
		<div class="row">
		<div class="col col-md-3">
		<div id="status" role="complementary">
			<h1>Verificaciones</h1>
			<ul>
				<sec:ifLoggedIn>
					
							<li class="fieldcontain">
							<g:if test="${userInstance.verifTel.toBoolean() }">
							<span >Teléfono verificado</span>
							<asset:image src="imagenYes.png" width="20" height="20"/>
							</g:if>
							<g:if test="${!userInstance.verifTel.toBoolean()}">
							<span >Teléfono NO verificado</span>
     						<asset:image src="imagenNo.png" width="20" height="20"/>
     						<g:link class="edit" action="sms" resource="${userInstance}">Verificar</g:link>
     						</g:if>
							</li>
						
							<li class="fieldcontain">
							<g:if test="${userInstance.enabled.toBoolean() }">
							<span >E-mail verificado</span>
							<asset:image src="imagenYes.png" width="20" height="20"/>
							</g:if>
							<g:if test="${!userInstance.enabled.toBoolean() }">
							<span >E-mail NO verificado</span>
     						<asset:image src="imagenNo.png" width="20" height="20"/>
							</g:if>
							</li>
							
							<li class="fieldcontain">
							<g:if test="${userInstance.verifDir.toBoolean() }">
							<span >Dirección verificada</span>
							<asset:image src="imagenYes.png" width="20" height="20"/>
							</g:if>
							<g:if test="${!userInstance.verifDir.toBoolean() }">
								<g:if test="${!userInstance.envioCarta.toBoolean() }">
									<span >Dirección NO verificada</span>
     								<asset:image src="imagenNo.png" width="20" height="20"/>
     								<g:link class="edit" action="confirmDireccion" resource="${userInstance}">Verificar</g:link>
								</g:if>
								<g:if test="${userInstance.envioCarta.toBoolean() }">
									<span >Dirección NO verificada</span>
     								<asset:image src="imagenNo.png" width="20" height="20"/>
     								<g:link class="edit" action="confirmCodDireccion" resource="${userInstance}">Ingresar código</g:link>
								</g:if>
							</g:if>
							
							</li>
					
				</sec:ifLoggedIn>
			</ul>
			
		</div>
		
		</div>
	   <div class="container">
	   	<div class="panel panel-default">
			<div class="panel-body">
		<div id="page-body" role="main">
			<h1 class="page-header">Mi perfil</h1>
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			<div class="container">
			<div class="row">
			<g:if test="${userInstance?.avatar}">
			<div class="fieldcontain col-md-2">
				<span class="property-value">
				<img class="avatar img-circle" src="${createLink(controller:'user', action:'avatar_image', id:userInstance.id)}" />
				</span>
			</div>	
			</g:if><g:else>
			<div class="fieldcontain col-md-2">
				<span class="property-value">
				<asset:image class="avatar img-circle" src="user2.png"/></span>
				<span class="property-value"><h4>Todavia no actualizas tu foto? Edita tu perfil y agregala!</h4></span>
			</div>	
			</g:else>
			</div>	
			<div class="row">
			<g:if test="${userInstance?.nombre}">
				<div class="form-group ">
					<span id="nombre-label" class="col-md-2 control-label"><g:message code="user.nombre.label" default="Nombre :" /></span>
						<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="nombre-label" value="${userInstance.nombre}" readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.apellido}">
				<div class="form-group">
					<span id="apellido-label" class="col-md-2 control-label"><g:message code="user.apellido.label" default="Apellido :" /></span>
					<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="apellido-label" value="${userInstance.apellido}"readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.fecNac}">
				<div class="form-group">
					<span id="fecNac-label" class="col-md-2 control-label"><g:message code="user.fecNac.label" default="Fecha de Nacimiento" /></span>
					<div class="col-md-5">
							<input class="form-control input-md" aria-labelledby="fecNac-label" value="${userInstance.fecNac}"readonly >
							
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.sexo}">
				<div class="form-group">
					<span id="sexo-label"class="col-md-2 control-label"><g:message code="user.sexo.label" default="Sexo" /></span>
					<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="sexo-label" value="${userInstance.sexo == 1 ? 'Masculino' : 'Femenino'}"readonly>
						</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<div class="form-group">
					<span id="email-label" class="col-md-2 control-label"><g:message code="user.email.label" default="E-Mail" /></span>
					<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="email-label" value="${userInstance.email}"readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.telefono}">
				<div class="form-group">
					<span id="telefono-label"class="col-md-2 control-label"><g:message code="user.telefono.label" default="Teléfono" /></span>
					<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="telefono-label" value="${userInstance.telefono}"readonly>
						</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.direccion}">
				<div class="form-group">
					<span id="direccion-label" class="col-md-2 control-label"><g:message code="user.direccion.label" default="Dirección" /></span>
					<div class="col-md-5">
						<input class="form-control input-md"  aria-labelledby="direccion-label"  value="${userInstance.direccion}"readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.fecVencCarnet}">
				<div class="form-group">
					<span id="fecVencCarnet-label" class="col-md-2 control-label"><g:message code="user.fecVencCarnet.label" default="Vencimiento carnet de conducir" /></span>
					<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="fecVencCarnet-label" value="${userInstance.fecVencCarnet}"readonly>
					</div>
				</div>
				</g:if>
			
			
				<g:if test="${userInstance?.username}">
				<div class="form-group">
					<span id="username-label" class="col-md-2 control-label"><g:message code="user.username.label" default="Usuario" /></span>
					<div class="col-md-5">
						<input class="form-control input-md" aria-labelledby="username-label" value="${userInstance.username}"readonly>
					</div>
				</div>
				</g:if>
			</div>	
				<%--<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>--%>
				
			<g:if test="${userInstance?.vehiculos}">
				<div class="fieldcontain col-md-2">
					<h1>Vehículo/s</h1>
					
						<g:each in="${userInstance.vehiculos}" var="v">
						<li class="fieldcontain">
						<span class="property-value" aria-labelledby="vehiculos-label"><g:link controller="vehiculo" action="show" id="${v.id}">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</g:link></span>
						</li>
						</g:each>
					
				</div>
				</g:if>
		<div class="container">
			<g:if test="${userInstance?.vehiculos.avatar}">
			<div class="fieldcontain">
				<span class="property-value">
				<g:each in="${userInstance.vehiculos}" var="v">
				<img class="avatar" src="${createLink(controller:'vehiculo', action:'avatar_image', id:v.id)}" />
				</g:each>
				</span>
				</div>
			</g:if>
             


		</div>
			
				<div class = "btn-group btn-group-lg">
					<g:form url="[resource:userInstance, action:'edit',controller:user]">
					<button class="btn btn-info btn-lg"  > Editar perfil /Agregar vehículo</button>
					</g:form>
				</div>	
				<div class = "btn-group btn-group-lg">
					<g:form url="[resource:userInstance,controller:user,view:'updatePassword']">
					<g:link class="edit btn btn-info btn-lg" action="updatePassword" resource="${userInstance}">Cambiar contraseña</g:link>
					</g:form>
				</div>	
				<div class = "btn-group btn-group-lg">
					<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
					<button class="btn btn-danger btn-lg"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >Eliminar perfil</button>
					</g:form>
				</div>	
				</div>
			
		</div>
		</div>
		</div>
		
		</div>
		</div>
		</div>
		</div>
	</body>
</html>
