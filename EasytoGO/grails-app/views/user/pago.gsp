<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mercadopago.MP"%>
<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@ page import="easytogo.User" %>

<%
	MP mp = new MP("5286447250441871", "TCfxImOOdc4uoBsXAVDuzWpiI0y9Ptav");

	String preferenceData = "{'items':"+
		"[{"+
			"'title':'Multicolor kite',"+
			"'quantity':1,"+
			"'currency_id':'ARS',"+ // Available currencies at: https://api.mercadopago.com/currencies
			"'unit_price':10.0"+
		"}]"+
	"}";

	JSONObject preference = mp.createPreference(preferenceData);

	String initPoint = preference.getJSONObject("response").getString("init_point");
%>

<!DOCTYPE html>
<html>
	<head>
		<title>Pay</title>
		<meta name="layout" content="main2">
	</head>
	<body>
		<a href="<%= initPoint %>" name="MP-Checkout" mp-mode="popup" class="orange-S-Sq-Ar">Pagar</a>
		
		<script type="text/javascript">
    (function(){function $MPC_load(){window.$MPC_loaded !== true && (function(){var s = document.createElement("script");s.type = "text/javascript";s.async = true;
    s.src = document.location.protocol+"//resources.mlstatic.com/mptools/render.js";
    var x = document.getElementsByTagName('script')[0];x.parentNode.insertBefore(s, x);window.$MPC_loaded = true;})();}
    window.$MPC_loaded !== true ? (window.attachEvent ? window.attachEvent('onload', $MPC_load) : window.addEventListener('load', $MPC_load, false)) : null;})();
</script>
	</body>
</html>