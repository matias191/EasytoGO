<%@ page import="easytogo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main2">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="container">
		<div id="edit-user" class="content scaffold-edit" role="main">


			<div class="row">
				<div class="col-md-3">
					<g:if test="${userInstance?.avatar}">
						<div class="fieldcontain col-md-2">
							<span class="property-value"> <img class="avatar"
								src="${createLink(controller:'user', action:'avatar_image', id:userInstance.id)}" />
							</span>
						</div>
					</g:if>
				</div>
				<div class="col-md-9">
					<h1>Añade tu foto!</h1>
					<h5>Es importante que actualices tu foto de perfil para
						facilitar el encuentro a la hora de viajar.</h5>

					<g:uploadForm action="upload_avatar">
						<div class="row">
							<label for="avatar">Selecciona una foto (1 MB Máx.)</label>
							<div class="btn-group  ">
								<input type="file" class="btn btn-sm" name="avatar" id="avatar"
									placeholder="Seleccionar archivo" />
							</div>
						</div>
						<div class="row">
							<label for="avatar">Añadir al perfil</label>
							<div class="btn-group  ">
								<button type="submit" class="btn btn-sm" name="añadir"
									value="Añadir">Añadir</button>
							</div>
						</div>
					</g:uploadForm>
				</div>
			</div>
			<h1>Modificar mi perfil</h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
				<ul class="alert alert-danger" role="alert">
					<g:eachError bean="${userInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>


			<g:form url="[resource:userInstance, action:'update']" method="PUT"
				class="form-horizontal">
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset>
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<div class="container">
						<div class="form-group">
							<label class="col-md-4 control-label" for="singlebutton"></label>
							<div class="btn-group btn-group-lg col-md-4">

								<g:link controller="user" class="save btn btn-success btn-lg"
									action="save" params="['user.id':userInstance?.id]" > Actualizar</g:link>

							</div>
							<div class="btn-group btn-group-lg ">

								<g:link class="save btn btn-success btn-lg"
									controller="vehiculo" action="create"
									params="['user.id': userInstance?.id]">
									${message(code: 'default.add.label', args: [message(code: 'vehiculo.label', default: 'Vehiculo')])}
								</g:link>
							</div>
						</div>
					</div>
				</fieldset>





			</g:form>



		</div>
	</div>
</body>
</html>
