<%@ page import="easytogo.Respuesta" %>





					<div class="fieldcontain">
						<g:each in="${user?.viaje}" var="v">
							<g:each in="${v?.preguntas}" var="p">
								<g:each in="${p?.respuesta == null}" var="r">
									<g:if test="${r}">
										<li class="fieldcontain">
											<span class="property-value" aria-labelledby="vehiculos-label">Pregunta: ${p?.duda.encodeAsHTML()} (${p?.user.username.encodeAsHTML()})</span>
										</li>
										<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'resp', 'error')} ">
										<label for="resp">
											<g:message code="respuesta.resp.label" default="Escribe tu respuesta aquí: " />		
										</label>
										<g:textField name="resp" value="${respuestaInstance?.resp}"/>
										</div>
									</g:if>
									
								</g:each>
							</g:each>
						</g:each>
						</div>

<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'pregunta', 'error')} required">
	<label for="pregunta">
		<g:message code="respuesta.pregunta.label" default="Pregunta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pregunta" name="pregunta.id" from="${preg}" optionKey="id" required="" value="${respuestaInstance?.pregunta?.id}" class="many-to-one"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="respuesta.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${easytogo.User.list()}" optionKey="id" required="" value="${respuestaInstance?.user?.id}" class="many-to-one"/>

</div>

