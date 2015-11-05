<%@ page import="easytogo.Viaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'viaje.label', default: 'Viaje')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
			
		<div id="show-viaje" class="content scaffold-show" role="main">
			
			<h3>Conoce los detalles del viaje, pregunta tus dudas al conductor y reserva una plaza!  </h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="form-horizontal">
			<div class="container">
			
				<g:if test="${viajeInstance?.origen}">
				
    				 <div class="form-group">
						<span id="origen-label" class="col-md-4 control-label"><g:message code="viaje.origen.label" default="Origen" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="origen-label" value="${viajeInstance.origen}" readonly>
					</div>
				   	</div>
				
				</g:if>
				
				<g:if test="${viajeInstance?.destino}">
				 <div class="form-group">
					<span id="destino-label" class="col-md-4 control-label"><g:message code="viaje.destino.label" default="Destino" /></span>
						<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="destino-label" value="${viajeInstance.destino}" readonly>
						</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_salida}">
				 <div class="form-group">
					<span id="fecha_salida-label" class="col-md-4 control-label"><g:message code="viaje.fecha_salida.label" default="Fecha de salida" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fecha_salida-label" value="${viajeInstance.fecha_salida}" readonly>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fecha_llegada}">
				<div class="form-group">
					<span id="fecha_llegada-label" class="col-md-4 control-label"><g:message code="viaje.fecha_llegada.label" default="Fecha de llegada" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md formatdate" aria-labelledby="fecha_llegada-label" value="${viajeInstance.fecha_llegada}" readonly>
				</div>
				   	</div>
				</g:if>
				
				<g:if test="${viajeInstance?.plazas_disponibles}">
				<div class="form-group">
					<span id="plazas_disponibles-label" class="col-md-4 control-label"><g:message code="viaje.plazas_disponibles.label" default="Plazas disponibles" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="plazas_disponibles-label" value="${viajeInstance.plazas_disponibles}" readonly>
				</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.costoplaza}">
				<div class="form-group">
					<span id="costoplaza-label" class="col-md-4 control-label"><g:message code="viaje.costoplaza.label" default="Costo por plaza" /> ARS$</span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="costoplaza-label" value="${viajeInstance.costoplaza}" readonly><span></span>
				</div>
				   	</div>
				</g:if>
				
				
				
			
			
				<g:if test="${viajeInstance?.comentario}">
				<div class="form-group">
					<span id="comentario-label" class="col-md-4 control-label"><g:message code="viaje.comentario.label" default="Comentario" /></span>
					<div class="col-md-6">	
						<textarea class="form-control input-md uneditable-input" aria-labelledby="comentario-label" readonly >${viajeInstance?.comentario?.encodeAsHTML()}</textarea>
				</div>
				   	</div>
				</g:if>
				
				<g:if test="${viajeInstance?.equipaje}">
				<div class="form-group">
					<span id="equipaje-label" class="col-md-4 control-label"><g:message code="viaje.equipaje.label" default="¿Se permite equipe?" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="equipaje-label" value="${viajeInstance.equipaje == 1 ? 'Pequeño (bolsa o maletin)' : viajeInstance.equipaje == 2 ? 'Mediano (bolso hasta 15 kg)'  : 'Grande (valija)' }" readonly>
					</div>
				   	</div>
				</g:if>
			
				<g:if test="${viajeInstance?.fumar}">
				<div class="form-group">
					<span id="fumar-label" class="col-md-4 control-label"><g:message code="viaje.fumar.label" default="¿Se permite fumar?" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="fumar-label" value="${viajeInstance.fumar == true ? 'Si' : 'No'}" readonly>
					</div>
				   	</div>
				</g:if>
			
				
				<div class="form-group">
					<span id="mascota-label" class="col-md-4 control-label"><g:message code="viaje.mascota.label" default="¿Se permiten mascotas?" /></span>
					<div class="col-md-6">	
						<input class="form-control input-md" aria-labelledby="mascota-label" value="${viajeInstance.mascota == 1 ? 'Si' : 'No' }"readonly>
					</div>
				   	</div>
			
				<g:if test="${viajeInstance?.conductor}">
				<div class="form-group">
					<span id="conductor-label" class="col-md-4 control-label"><g:message code="viaje.conductor.label" default="Conoce los detalles del conductor" /></span>
					<div class="col-md-6" >	
						<g:form controller="user"action="show" id="${viajeInstance?.conductor?.id}" >
						<button class="form-control btn btn-info" aria-labelledby="conductor-label" ><span class="glyphicon glyphicon-user " ></span> 	${viajeInstance?.conductor?.encodeAsHTML()} 
							
						</button>
						</g:form>
					</div>
				   	</div>
				</g:if>
				
				<%--Foto del conductor--%>
				<div class="form-group">
							<g:if test="${viajeInstance?.conductor.avatar}">
							<div class="fieldcontain col-md-2">
							<span class="property-value">
							<img class="avatar avatar_small" src="${createLink(controller:'user', action:'avatar_image', id:viajeInstance.conductor.id)}" />
							</span>
							</div>	
							</g:if>	
				</div>
				
			<%--Verificaciones--%>
			<div class="form-group">			
			<div class="col col-md-3">
			<div id="status" role="complementary">			
			<ul>
				<sec:ifLoggedIn>
							<li class="fieldcontain">
							Edad: ${age} años
							</li>	
											
							<li class="fieldcontain">							
							<g:if test="${viajeInstance?.conductor.verifTel.toBoolean() }">
							<span >Teléfono verificado</span>
							<asset:image src="imagenYes.png" width="20" height="20"/>
							</g:if>
							<g:if test="${!viajeInstance?.conductor.verifTel.toBoolean()}">
							<span >Teléfono NO verificado</span>
     						<asset:image src="imagenNo.png" width="20" height="20"/>
     						</g:if>
							</li>
						
							<li class="fieldcontain">														
							<g:if test="${viajeInstance?.conductor.enabled.toBoolean() }">
							<span >E-mail verificado</span>
							<asset:image src="imagenYes.png" width="20" height="20"/>
							</g:if>
							<g:if test="${!viajeInstance?.conductor.enabled.toBoolean() }">
							<span >E-mail NO verificado</span>
     						<asset:image src="imagenNo.png" width="20" height="20"/>
							</g:if>
							</li>
							
							<li class="fieldcontain">												
							<g:if test="${viajeInstance?.conductor.verifDir.toBoolean() }">
							<span >Dirección verificada</span>
							<asset:image src="imagenYes.png" width="20" height="20"/>
							</g:if>
							<g:if test="${!viajeInstance?.conductor.verifDir.toBoolean() }">
							<span >Dirección NO verificada</span>
     						<asset:image src="imagenNo.png" width="20" height="20"/>
							</g:if>
							</li>					
				</sec:ifLoggedIn>
				</ul>			
				</div>		
				</div>
				</div>
				
				<%--Muestra el vehiculo--%>
				<div class="form-group">
				<g:if test="${viajeInstance?.conductor.vehiculos}">
				<div class="fieldcontain col-md-2">
					Vehículo
					
						<g:each in="${viajeInstance.conductor.vehiculos}" var="v">
						<li class="fieldcontain">
						<span class="property-value" aria-labelledby="vehiculos-label">${v?.modelo.marca.nombre.encodeAsHTML()} ${v?.modelo.nombre.encodeAsHTML()}</span>
						</li>
						</g:each>
				</div>
				</g:if>
				</div>
				
				<%--Foto del vehiculo--%>
				<div class = "form-group">
					<g:if test="${viajeInstance?.conductor.vehiculos.avatar}">
						<div class="fieldcontain">
							<span class="property-value">
								<g:each in="${viajeInstance.conductor.vehiculos}" var="v">
								<img class="avatar avatar_small" src="${createLink(controller:'vehiculo', action:'avatar_image', id:v.id)}" />
								</g:each>
							</span>
						</div>
					</g:if>
				</div>
				
				<%--Pasajeros--%>
			Pasajeros
				<g:each in="${reserva}" status="i" var="Reservas">	
				 	
				   	<div class = "form-group">
				   	 <g:if test="${Reservas.usuario.username}" var="r">
				   	  <li class="fieldcontain"> 
				   			<g:if test="${Reservas.usuario.avatar}">
							<div class="fieldcontain col-md-2">
							<span class="property-value">
							<img class="avatar avatar_small" src="${createLink(controller:'user', action:'avatar_image', id:Reservas.usuario.id)}" />
							${Reservas.usuario.username}
							</span>
							</div>	
							</g:if>	
					    </li>
				   		</g:if>
				   		
				   	</div>
				</g:each>
				
				<%--Formulario para hacer preguntas--%>
				<div class="form-group">
				<g:form url="[resource:preguntaInstance, controller: 'pregunta', action:'save']" >
				<fieldset class="form">
					<g:render template="formPregunta"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Preguntar" />
				</fieldset>
			</g:form>
				</div>
			
				<%--Se muestran las preguntas con sus respuestas (si es q tiene rta)--%>
				<div class = "form-group">
				<g:if test="${viajeInstance?.preguntas}">
					
					<h3>Preguntas realizadas</h3><asset:image src="pregunta6.png" width="31" height="25" />
					
						<g:each in="${viajeInstance.preguntas}" var="v">
						<li class="fieldcontain">
						<span class="property-value" aria-labelledby="vehiculos-label">Pregunta: ${v?.duda.encodeAsHTML()} (${v?.user.username.encodeAsHTML()})</span>
						</li>
						<g:if test="${v?.respuesta}">
						<li class="fieldcontain">
						<span class="property-value" aria-labelledby="vehiculos-label">Respuesta: ${v?.respuesta.resp.encodeAsHTML()} (${v?.respuesta.user.username.encodeAsHTML()}) </span>
						
						</li>
						<br/>
						</g:if>
						<br/>
						</g:each>
					
				
				</g:if>
				</div>
				
				   	
				<div class="form-group">
				<h5>No darle bola a esto, excepto Roberto jaja </h5>
				<h5>	Esto lo podes tratar asi para darle otro formato. Y ya como texto es mas facil pq lo metes en cualquier lado</h5> 
				<h5>EL costo por plaza es ${viajeInstance.costoplaza}</h5>
				<h5>Plazas disponibles: ${viajeInstance.plazas_disponibles}</h5>
				<h5>Cristian, si queres sacar esto pq justo haces el video andate al proyecto->views->viajes->reservar y borra esto </h5>
				</div> 
				
			<fieldset class="form">
			<g:form url="[resource:reservaInstance, controller:'reserva', action:'save']" >
			<div class="fieldcontain">
			<g:if test = "${viajeInstance?.plazas_disponibles}" >
			<div class="form-group">
			<span id="cant_plaz-label" class="col-md-4 control-label" ><g:message code="reserva.cant_plaz.label" default="Cantidad de plazas" /></span>
					<div class="col-md-6">	
			<span class="property-value" aria-labelledby="cant_plaz-label"><g:field name="cant_plaz" type="number" value="${reservaInstance?.cant_plaz}" required=""/><g:actionSubmit controller="reserva" name="create" action="save_reserva" class="save btn btn-success" value="reservar"/></span>
			</div>
			</div>
			</g:if>
			
			<g:hiddenField name="plazas_disponibles" type="number" value="${viajeInstance?.plazas_disponibles-1}" required=""/>
			
			
			<g:hiddenField name="fecha_res" type="String"  value="${new Date().format('dd/MM/yyyy HH:mm')}"  />
			
			<g:hiddenField name="usuario.id" type="" value="${sec.loggedInUserInfo(field:'id')}"/>
			<g:hiddenField name="viajes.id" type=""  value="${viajeInstance.id}"/>
			
			
			
			</div>
		
				</g:form>
			</fieldset>
				
			</div>
			</div>
		</div>
	</body>
</html>
