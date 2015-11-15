<%@ page import="easytogo.Calificacion"%>
<%@ page import="easytogo.Viaje"%>
<%@ page import="easytogo.Reserva"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main2">


</head>
<body>
	<div class="container">
		<div id="show-viaje" class="content scaffold-show" role="main">
			<h1 class="page-header">Califica tu Compañero</h1>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>

		</div>
		<div class="row">
			<span class="property-value col-lg-4"> <img class="avatar"
				src="${createLink(controller:'user', action:'avatar_image', id:usuario.id)}" />
			</span>


			<div
				class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'calificado', 'error')} required">
				<label for="calificado" class=""> <span
					class="required-indicator">Compañero a Calificar</span>
				</label>
				<h4>
					${usuario.username}
				</h4>


			</div>
			<fieldset class="form form-horizantal">
				<g:form
					url="[resource:calificacionInstance, controller:'calificacion', action:'save']">


					<div
						class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'calificador', 'error')} required">

						<g:hiddenField name="calificador" required=""
							value="${sec.loggedInUserInfo(field:'id')}" class="many-to-one" />

					</div>

					<g:hiddenField name="calificado.id" required=""
						value="${usuario.id}" class="many-to-one" />
					<div class="row">
						<div class="form-group">
							<div
								class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} required">
								<label for="comentario" class="col-md-2 control-label">
									<g:message code="calificacion.comentario.label"
										default="Comentario" /> <span class="required-indicator">*</span>
								</label>
								<div class="col-md-6">
									<textarea name="comentario" class="form-control"
										value="${calificacionInstance?.comentario}" rows="4" required="required"> </textarea>
								</div>
							</div>
						</div>
						<br> <br>
					</div>
					<div>
						<g:hiddenField name="reserva.id" required="" value="${reserva.id}" />
						<g:hiddenField name="calificacion.id" required=""
							value="${calificacionInstance?.id}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'fecha', 'error')} required">

						<g:hiddenField name="fecha" required=""
							value="${new Date().format('dd/MM/yyyy HH:mm')}" />


					</div>

					<div class="row">
						<div class="form-group">
							<div
								class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'valor', 'error')} required">
								 <label for="valor"
									class="col-md-2 control-label"> <g:message
										code="calificacion.valor.label" default="Valor" /> <span
									class="required-indicator">*</span>
								</label>
								<div class="col-md-6">

									<g:field type="number" name="valor" id="input-1" class="rating" data-min="0" data-max="5" value="${calificacionInstance?.valor}"data-size="xs" data-step="1" required="required"/>
									
								</div>
							</div>
						</div>
						
						
						<div
							class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'viaje_c', 'error')} required">

							<g:hiddenField name="viaje_c.id" required=""
								value="${reserva.viajes.id}" class="many-to-one" />


						</div>

						<div class="row">
							<div class="form-group">
								<br> <br> <label for="valor"
									class="col-md-2 control-label"> <span></span>
								</label>
								<div class="col-md-6">
									<g:actionSubmit controller="calificacion" name="create"
										action="save_calificacion" class="save btn btn-success"
										value="calificar" />

								</div>
							</div>
						</div>

					</div>

				</g:form>
			</fieldset>
		</div>
	</div>
	<br>
	<br>
<asset:javascript  src="jquery-2.1.4.js"/>
<script>

$("#input-1").rating();

</script>	
</body>
</html>