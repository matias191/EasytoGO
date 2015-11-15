
<%@ page import="easytogo.Reserva" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mercadopago.MP"%>
<%@page import="org.codehaus.jettison.json.JSONObject"%>

<%
	MP mp = new MP("5286447250441871", "TCfxImOOdc4uoBsXAVDuzWpiI0y9Ptav");

	String preferenceData = "{'items':"+
		"[{"+
			"'title':'${descripcion}',"+
      		"'description':'Gracias por viajar con Easy to GO',"+
     		"'quantity':${cantidad},"+
			"'currency_id':'ARS',"+ // Available currencies at: https://api.mercadopago.com/currencies
			"'unit_price':${precio},"+
     		"'picture_url': 'http://www.despegar.com.ar/blog/wp-content/uploads/2014/07/tips-de-viaje.jpg'"+
		"}],'back_urls': {"+
		"'success': 'http://localhost:8080/EasytoGO/reserva/showReserva/"+idRese+"'"+		
	"}}";
    
    

 
	JSONObject preference = mp.createPreference(preferenceData);

	// String initPoint = preference.getJSONObject("response").getString("init_point");
 	 String sandboxInitPoint = preference.getJSONObject("response").getString("sandbox_init_point");
%>


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
		<h3 class="alert alert-success" role="alert"> Ya casi terminas, ahora solo queda pagar</h3>
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1 class="page-header">Mi reserva</h1>
			<%--<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			--%><div class="form-horizontal"> 	 	
			<div class="container">
			
				<g:if test="${reservaInstance?.cant_plaz}">
					<div class="form-group ">
					<span id="cant_plaz-label" class="col-md-2 control-label"><g:message code="reserva.cant_plaz.label" default="Cantidad de plazas reservadas" /></span>
					<div class="col-md-5">
						<input class="form-control input-sm" aria-labelledby="cant_plaz-label" value="${reservaInstance.cant_plaz}"readonly>
					</div>
				</div>
				</g:if>
			
				<g:if test="${reservaInstance?.fecha_res}">
					<div class="form-group ">
					<span id="fecha_res-label" class="col-md-2 control-label"><g:message code="reserva.fecha_res.label" default="Fecha de reserva" /></span>
					<div class="col-md-5">
						<input class="form-control input-sm" aria-labelledby="fecha_res-label" value="${reservaInstance.fecha_res}"readonly>
					</div>
				</div>
				
				</g:if>
				
				<%--
				<p>${session}</p>
				<p>${session.properties}</p>
				<p>${session.id}</p>			
				--%>
				<g:if test="${reservaInstance?.usuario}">
				<div class="form-group ">
					<span id="usuario-label" class="col-md-2 control-label"><g:message code="reserva.usuario.label" default="Pasajero" /></span>
					<div class="col-md-5">
						<input class="form-control input-sm" aria-labelledby="usuario-label" value="${reservaInstance?.usuario?.encodeAsHTML()}"readonly>
					
					</div>
				</div>
				</g:if>
				
<%--				<a href="<%= initPoint %>" name="MP-Checkout" mp-mode="modal" class="green-M-Rn-ArOn">Pagar</a>--%>
				<a href="<%= sandboxInitPoint %>" name="MP-Checkout" mp-mode="modal" class="green-M-Rn-ArOn">Pagar</a>
				
<%--				<iframe src="<%= initPoint %>" name="MP-Checkout" width="740" height="600" frameborder="0"></iframe>--%>
		
		<script type="text/javascript">
    (function(){function $MPC_load(){window.$MPC_loaded !== true && (function(){var s = document.createElement("script");s.type = "text/javascript";s.async = true;
    s.src = document.location.protocol+"//resources.mlstatic.com/mptools/render.js";
    var x = document.getElementsByTagName('script')[0];x.parentNode.insertBefore(s, x);window.$MPC_loaded = true;})();}
    window.$MPC_loaded !== true ? (window.attachEvent ? window.attachEvent('onload', $MPC_load) : window.addEventListener('load', $MPC_load, false)) : null;})();
</script>
			
				<%--<g:if test="${reservaInstance?.viajes}">
				<li class="fieldcontain">
					<span id="viajes-label" class="property-label"><g:message code="reserva.viajes.label" default="Viajes" /></span>
					
						<span class="property-value" aria-labelledby="viajes-label"><g:link controller="viaje" action="show" id="${reservaInstance?.viajes?.id}">${reservaInstance?.viajes?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			--%>
			 	 	 	
		<%-- 
			<g:form url="[resource:reservaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>--%>
			</div>
				</div>
		</div>
		</div>
	</body>
</html>
