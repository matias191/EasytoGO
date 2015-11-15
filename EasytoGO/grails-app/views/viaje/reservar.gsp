<%@ page import="easytogo.Viaje"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main2">
<g:set var="entityName"
	value="${message(code: 'viaje.label', default: 'Viaje')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="container">
		<div id="show-viaje" class="content scaffold-show" role="main">

			<h3 class="page-header">Conoce los detalles del viaje, pregunta
				tus dudas al conductor y reserva una plaza!</h3>
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<div class="comment-tabs">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#comments-logout" role="tab"
						data-toggle="tab"><h4 class="reviews text-capitalize">Detalles
								del Viaje</h4></a></li>
					<li><a href="#add-comment" role="tab" data-toggle="tab"><h4
								class="reviews text-capitalize">Pasajeros</h4></a></li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="comments-logout">
						<div class="row">
							<div class="col-md-3">
								<g:if test="${userInstance?.avatar}">
									<div class="fieldcontain col-md-2">
										<span class="property-value"> <img class="avatar"
											src="${createLink(controller:'user', action:'avatar_image', id:viajeInstance.id)}" />
										</span>
									</div>
								</g:if>
								<div class="form-group">
									<br>
														<br>
									<h4>Verificaciones</h4>
									<div id="status" role="complementary">
										<ul>
											<sec:ifLoggedIn>
										
												
												<li class="">Conductor : <span class="glyphicon glyphicon-user "></span>
														${viajeInstance?.conductor?.encodeAsHTML()} </li>	
												<li class="fieldcontain">Edad: ${age} años
												</li>

												<li class="fieldcontain"><g:if
														test="${viajeInstance?.conductor.verifTel.toBoolean() }">
														<span>Teléfono verificado</span>
														<asset:image src="imagenYes.png" width="20" height="20" />
													</g:if> <g:if
														test="${!viajeInstance?.conductor.verifTel.toBoolean()}">
														<span>Teléfono NO verificado</span>
														<asset:image src="imagenNo.png" width="20" height="20" />
													</g:if></li>

												<li class="fieldcontain"><g:if
														test="${viajeInstance?.conductor.enabled.toBoolean() }">
														<span>E-mail verificado</span>
														<asset:image src="imagenYes.png" width="20" height="20" />
													</g:if> <g:if
														test="${!viajeInstance?.conductor.enabled.toBoolean() }">
														<span>E-mail NO verificado</span>
														<asset:image src="imagenNo.png" width="20" height="20" />
													</g:if></li>

												<li class="fieldcontain"><g:if
														test="${viajeInstance?.conductor.verifDir.toBoolean() }">
														<span>Dirección verificada</span>
														<asset:image src="imagenYes.png" width="20" height="20" />
													</g:if> <g:if
														test="${!viajeInstance?.conductor.verifDir.toBoolean() }">
														<span>Dirección NO verificada</span>
														<asset:image src="imagenNo.png" width="20" height="20" />
													</g:if></li>
											</sec:ifLoggedIn>
										</ul>
									</div>

								</div>

									<%--Muestra el vehiculo--%>

								<div class="form-group">
								<div id="status" role="complementary">
									<g:if test="${viajeInstance?.conductor.vehiculos}">
										<h4>Vehículo</h4>
										<div class="fieldcontain">
											

											<g:each in="${viajeInstance.conductor.vehiculos}" var="v">
												<li class="fieldcontain"><span class="property-value"
													aria-labelledby="vehiculos-label">
														${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}
												</span></li>
											</g:each>
										</div>
									</g:if>
								</div>
								</div>

								<%--Foto del vehiculo--%>
								<div class="form-group">
									<g:if test="${viajeInstance?.conductor.vehiculos.avatar}">
										<div class="fieldcontain">
											<span class="property-value"> <g:each
													in="${viajeInstance.conductor.vehiculos}" var="v">
													<img class="avatar avatar_small" width="60" height="60"
														src="${createLink(controller:'vehiculo', action:'avatar_image', id:v.id)}" />
												</g:each>
											</span>
										</div>
									</g:if>
								</div>
							</div>
							<div class="col-md-9">
							<div class="form-horizontal">
								<div class="container">

									<g:if test="${viajeInstance?.origen}">
											<br>
												<br>
										<div class="">
											<span id="origen-label" class="control-label">Origen:</span><h4>${viajeInstance.origen}</h4>
											
										</div>

									</g:if>

									<g:if test="${viajeInstance?.destino}">
										<div class="">
											<span id="destino-label" class="control-label">Destino:</span><h4>${viajeInstance.destino}</h4>
											
										</div>
									</g:if>

									<g:if test="${viajeInstance?.fecha_salida}">
										<div class="">
											<span id="fecha_salida-label" class="control-label">Fecha de salida:</span><h4>${viajeInstance.fecha_salida}</h4>
											
										</div>
										
									</g:if>

									<g:if test="${viajeInstance?.fecha_llegada}">
										<div class="">
											<span id="fecha_llegada-label" class="control-label">Fecha de llegada:</span><h4>${viajeInstance.fecha_llegada}</h4>
											
										</div>
									</g:if>

									<g:if test="${viajeInstance?.plazas_disponibles}">
										<div class="">
											<span id="plazas_disponibles-label" class="control-label">Cantidad de Plazas disponibles:</span><h4>${viajeInstance.plazas_disponibles}</h4>
											
										</div>
										
									</g:if>

									<g:if test="${viajeInstance?.costoplaza}">
									<div class="">
											<span id="costoplaza-label" class="control-label">Costo de la plaza:</span><h4>${viajeInstance.costoplaza}</h4>
											
										</div>
										
									</g:if>
									
	

									

							
									
									<div class="">
											<span id="equipaje-label" class="control-label">¿Se permite equipaje?</span><h4>${viajeInstance.equipaje == 1 ? 'Pequeño (bolsa o maletin)' : viajeInstance.equipaje == 2 ? 'Mediano (bolso hasta 15 kg)'  : 'Grande (valija)' }
											</h4>
											
										</div>
																
										
										<div class="">
											<span id="fumar-label" class="control-label">¿Se permite Fumar?</span><h4>${viajeInstance.fumar == true ? 'Si' : 'No'}
											</h4>
											
										</div>

									
										
										<div class="">
											<span id="mascota-label" class="control-label">¿Se permite Mascota?</span><h4>${viajeInstance.mascota == 1 ? 'Si' : 'No' }
											</h4>
											
										</div>
									
										
																	
										<div class="">
											<span id="conductor-label" class=" ontrol-label">
													Conoce los detalles del conductor:</span>
												<br>
												<g:form controller="user" action="show"
													id="${viajeInstance?.conductor?.id}">
														<br>
													<button class="btn btn-info">
														<span class="glyphicon glyphicon-user "></span>
														${viajeInstance?.conductor?.encodeAsHTML()}

													</button>
														
												</g:form>
													<br>
										</div>
										
										<g:if test="${viajeInstance?.comentario}">
										<div class="">
											<span id="comentario-label" class=" control-label">Comentario del Conductor:</span>
											<br>
											<div class="">
													
												<textarea class="col-md-6" rows="4"
													 readonly>
													${viajeInstance?.comentario?.encodeAsHTML()}
												</textarea>
													<br>
											</div>
										</div>
									</g:if>								

								</div>

								<%--Verificaciones--%>


							</div>
							</div>
						</div>
					</div>
						<div class="tab-pane" id="add-comment">
							<br>
							<br>
							<%--Pasajeros--%>
							
							<g:each in="${reserva}" status="i" var="Reservas">
							
								<div class="">
									<g:if test="${Reservas.usuario.username}" var="r">
										<div class="fieldcontain"><g:if
												test="${Reservas.usuario.avatar}">
												<div class="fieldcontain col-md-2">
													<span class="property-value"> <img
														class="avatar avatar_small"
														src="${createLink(controller:'user', action:'avatar_image', id:Reservas.usuario.id)}" />
														${Reservas.usuario.username}
													</span>
												</div>
											</g:if></div>
									</g:if>

								</div>
							</g:each>

							<br>
							<br>
						</div>

						<br>
						<br>
						
					</div>
				</div>
				<h3 class="page-header">Reserva tu viaje ahora</h3>

				<br>
				<fieldset class="form">
					<g:form
						url="[resource:reservaInstance, controller:'reserva', action:'save']">
						<div class="fieldcontain">
							
								<div class="">
									<span id="cant_plaz-label" class=" control-label">Cantidad de plazas</span>
									<br>
									<div class="">
									<br>
										<span class="property-value" aria-labelledby="cant_plaz-label"><g:field
												name="cant_plaz" type="number" min="1" class="col-md-3" placeholder="Ingresa cantidad aqui"
												max="${viajeInstance?.plazas_disponibles}"
												value="${reservaInstance?.cant_plaz}" required="" />
										<g:actionSubmit controller="reserva" name="create"  style="margin-left:0.5em !important;"
												action="save_reserva" class="save btn btn-success"
												value="reservar" /></span>
									</div>
								</div>
							

							<g:hiddenField name="plazas_disponibles" type="number"
								value="${viajeInstance?.plazas_disponibles-1}" required="" />


							<g:hiddenField name="fecha_res" type="String"
								value="${new Date().format('dd/MM/yyyy HH:mm')}" />

							<g:hiddenField name="usuario.id" type=""
								value="${sec.loggedInUserInfo(field:'id')}" />
							<g:hiddenField name="viajes.id" type=""
								value="${viajeInstance.id}" />



						</div>

					</g:form>
				</fieldset>




				<%--Formulario para hacer preguntas--%>
				<div class="form-group">
					<g:form
						url="[resource:preguntaInstance, controller: 'pregunta', action:'save']">
						<fieldset class="form-horizontal" >
							<g:render template="formPregunta" />
						</fieldset>
						<fieldset class="buttons">
						<span class="col-md-3 control-label"></span>
						<div class="col-md-6">
							<g:submitButton name="create" class="save btn btn-success" value="Preguntar" />
						</div>
						</fieldset>
					</g:form>
				</div>

				<%--Se muestran las preguntas con sus respuestas (si es q tiene rta)--%>
				<div class="form-group">
					<g:if test="${viajeInstance?.preguntas}">
						<div class="row">
							<div class="col-md-8">
								<h3 class="page-header">Preguntas realizadas</h3>
								<section class="comment-list">
									<g:each in="${viajeInstance.preguntas}" var="v">
										<article class="row">
											<div class="col-md-2 col-sm-2 hidden-xs">
												<figure class="thumbnail">
													<img class="img-responsive"
														src="${createLink(controller:'user', action:'avatar_image', id:v.user.id)}" />
													<figcaption class="text-center">
														<i class="fa fa-user"></i>
														${v?.user.username.encodeAsHTML()}
													</figcaption>
												</figure>
											</div>
											<div class="col-md-10 col-sm-10">
												<div class="panel panel-default arrow left">

													<div class="panel-heading right">
														<div class="comment-user">Pregunta</div>

													</div>
													<div class="panel-body">
														<div class="comment-post">
															<p>
																${v?.duda.encodeAsHTML()}
															</p>
														</div>
													</div>
												</div>
											</div>
										</article>
										<g:if test="${v?.respuesta}">
											<article class="row">
												<div
													class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-0 hidden-xs">
													<figure class="thumbnail">
														<img class="img-responsive"
															src="${createLink(controller:'user', action:'avatar_image', id:v.respuesta.user.id)}" />
														<figcaption class="text-center">
															<i class="fa fa-user"></i>
															${v?.respuesta.user.encodeAsHTML()}
														</figcaption>
													</figure>
												</div>
												<div class="col-md-9 col-sm-9">
													<div class="panel panel-default arrow left">
														<div class="panel-heading right">Respuesta</div>
														<div class="panel-body">



															<div class="comment-post">
																<p>
																	${v?.respuesta.resp.encodeAsHTML()}
																</p>
															</div>

														</div>
													</div>
												</div>
											</article>
										</g:if>

										<br />
									</g:each>
								</section>
							</div>
						</div>
					</g:if>
				</div>



				



			</div>
		</div>
</body>
</html>
