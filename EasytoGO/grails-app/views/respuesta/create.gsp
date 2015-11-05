<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'respuesta.label', default: 'Respuesta')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<a href="#create-respuesta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-respuesta" class="content scaffold-create" role="main">
			<span><h1>¿Qué me han preguntado?</h1></span><asset:image src="pregunta3.png" width="250" height="94" />
			<h3>Recuerda que respondiendo las preguntas tendrás más oportunidad de ir acompañado en tu viaje!</h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${respuestaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${respuestaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			 
<%--MUESTRA POR CADA PREGUNTA SIN RESPONDER DE ESE USUARIO, UN CAMPO Y UN BOTON PARA QUE LAS RESPONDA--%>
		
			<g:set var="preguntas" value="${0}"/>
				<div class="fieldcontain">
						<g:each in="${user?.viaje}" var="v">
							<g:each in="${v?.preguntas}" var="p">
								<g:each in="${p?.respuesta == null}" var="r">
									<g:if test="${r}"> <%--Si la respuesta es null entonces muestro la pregunta (formulario completo) asi la responde--%>
										<g:set var="preguntas" value="${preguntas +1 }"/>
										<g:form url="[resource:respuestaInstance, action:'save']" >
										<asset:image src="pregunta6.png" width="31" height="25" />
										<%--PREGUNTA--%>
										<li class="fieldcontain">
											<span class="property-value">Pregunta: ${p?.duda.encodeAsHTML()} (${p?.user.username.encodeAsHTML()})</span>
										</li>			
										
										<%--CAMPO PARA ESCRIBIR RESPUESTA--%>
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'resp', 'error')} ">
										<label for="resp">
											<g:message code="respuesta.resp.label" default="Escribe tu respuesta aquí: " />		
										</label>
										<g:textField name="resp" value="${respuestaInstance?.resp}"/>
										</div>
										
										<%--ESTO ESTA OCULTO, ES EL ID DE LA PREGUNTA --%>
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'pregunta', 'error')} required">
										<g:hiddenField id="pregunta" name="pregunta.id" type=""  value="${p.id}"/>
										<%--<g:select id="pregunta" name="pregunta.id" from="${preg}" optionKey="id" required="" value="${respuestaInstance?.pregunta?.id}" class="many-to-one"/>--%>
										</div>
										
										<%--ESTO ESTA OCULTO, ES EL ID DEL USUARIO --%>
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'user', 'error')} required">
										<g:hiddenField id="user" name="user.id" type=""  value="${user.id}"/>
										<%--<g:select id="user" name="user.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${respuestaInstance?.user?.id}" class="many-to-one"/>--%>
										</div>

										<%--BOTON RESPONDER--%>
										<fieldset class="buttons">
										<g:submitButton name="create" class="save" value="Responder" />
										</fieldset>
										
										</g:form>
									</g:if>	
									
								</g:each>
							</g:each>
						</g:each>
					<g:if test = "${preguntas == 0}">
					<h4>No tienes preguntas para responder.</h4>
					
					</g:if>
				</div>
		</div>
	</body>
</html>
