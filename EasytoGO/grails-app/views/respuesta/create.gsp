<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'respuesta.label', default: 'Respuesta')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
	<div class="container">		
			
			<div class="row">
			 <div class="container">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            ¿Qué me han preguntado?
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Recuerda que respondiendo las preguntas tendrás más oportunidad de ir acompañado en tu viaje!
                            </li>
                        </ol>
                    </div>
                </div>
          </div>
          

			<div class="panel-body">
		<div id="create-respuesta" class="content scaffold-create" role="main">
		<asset:image src="pregunta3.png" width="250" height="94" />
			<div class="panel panel-default">
			<div class="panel-body">
		
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${respuestaInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${respuestaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			 
<%--MUESTRA POR CADA PREGUNTA SIN RESPONDER DE ESE USUARIO, UN CAMPO Y UN BOTON PARA QUE LAS RESPONDA--%>


			
		
			<g:set var="preguntas" value="${0}"/>
				<div class="fieldcontain">
						<div class="row">
												<div class="col-md-8">
													<h3 class="page-header">Preguntas realizadas</h3>
															<section class="comment-list">
						<g:each in="${user?.viaje}" var="v">
							<g:each in="${v?.preguntas}" var="p">
								<g:each in="${p?.respuesta == null}" var="r">
									<g:if test="${r}"> <%--Si la respuesta es null entonces muestro la pregunta (formulario completo) asi la responde--%>
										<g:set var="preguntas" value="${preguntas +1 }"/>
										<g:form url="[resource:respuestaInstance, action:'save']" >
									
										<%--PREGUNTA--%>
										
															<article class="row">
																<div class="col-md-2 col-sm-2 hidden-xs">
																<figure class="thumbnail">
																	<img class="img-responsive"
																src="${createLink(controller:'user', action:'avatar_image', id:p.user.id)}" />
																<figcaption class="text-center">
														<i class="fa fa-user"></i>
														${p?.user.username.encodeAsHTML()}
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
															<p> ${p?.duda.encodeAsHTML()}</p>
														</div>
													</div>
												</div>
											</div>
										</article>
										
										<%--CAMPO PARA ESCRIBIR RESPUESTA--%>
										<article class="row">
												<div
													class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-0 hidden-xs">
													<figure class="thumbnail">
														<img class="img-responsive"
															src="${createLink(controller:'user', action:'avatar_image', id:v.conductor.id)}" />
														<figcaption class="text-center">
															<i class="fa fa-user"></i>
															${v.conductor.username.encodeAsHTML()}
														</figcaption>
													</figure>
												</div>
												<div class="col-md-9 col-sm-9">
													<div class="panel panel-default arrow left">
														<div class="panel-heading right">Respuesta</div>
														<div class="panel-body">



															<div class="comment-post ">
																<textarea name="resp" placeholder="Escribe tu respuesta aqui" class="col-md-9" rows="3" >${respuestaInstance?.resp}</textarea>
															</div>
															<button name="create" class="save btn btn-success"	  action="save" value="Responder" >Responder</button>
															</div>
													</div>
												</div>
											</article>
											
											
										<%--
											
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'resp', 'error')} ">
										<label for="resp">
											<g:message code="respuesta.resp.label" default="Escribe tu respuesta aquí: " />		
										</label>
										<g:textField name="resp" value="${respuestaInstance?.resp}"/>
										</div>
										
										--%>
										
										
										<%--ESTO ESTA OCULTO, ES EL ID DE LA PREGUNTA --%>
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'pregunta', 'error')} required">
										<g:hiddenField id="pregunta" name="pregunta.id" type=""  value="${p.id}"/>
										<%--<g:select id="pregunta" name="pregunta.id" from="${preg}" optionKey="id" required="" value="${respuestaInstance?.pregunta?.id}" class="many-to-one"/>--%>
										</div>
										
										<%--ESTO ESTA OCULTO, ES EL ID DEL USUARIO --%>
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'user', 'error')} required">
										<g:hiddenField id="user" name="user.id" type=""  value="${user.id}"/>
										<%--<g:select id="user" name="user.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${respuestaInstance?.user?.id}" class="many-to-one"/>--%>
										</div><%--

										BOTON RESPONDER
										<fieldset class="buttons">
										<g:submitButton name="create" class="save" value="Responder" />
										</fieldset>
							
										--%></g:form>
									</g:if>	
									
								</g:each>
							</g:each>
						</g:each>
									</section>
							</div>
						</div>
						
					<g:if test = "${preguntas == 0}">
					<h4 class="alert alert-success" role="alert">No tienes preguntas para responder.</h4>
					
					</g:if>
				</div>
					</div>
		</div>
		</div>
	</div>
	</div>
	</body>
</html>
