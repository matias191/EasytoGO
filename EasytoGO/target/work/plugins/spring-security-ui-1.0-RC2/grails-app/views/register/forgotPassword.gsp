<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title' /></title>
<meta name='layout' content='main2' />
<style type='text/css' media='screen'>

body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
}
#login {
	margin: 15px 0px;
	padding: 0px;
	text-align: center;
}

#login .inner {
	width: 400px;
	padding-bottom: 6px;
	margin: 60px auto;
	text-align: left;
	border: 1px solid #aab;
	background-color: #f0f0fa;
	-moz-box-shadow: 2px 2px 2px #eee;
	-webkit-box-shadow: 2px 2px 2px #eee;
	-khtml-box-shadow: 2px 2px 2px #eee;
	box-shadow: 2px 2px 2px #eee;
}

#login .inner .fheader {
	padding: 18px 26px 14px 26px;
	background-color: #f7f7ff;
	margin: 0px 0 14px 0;
	color: #2e3741;
	font-size: 18px;
	font-weight: bold;
}

#login .inner .cssform p {
	clear: left;
	margin: 0;
	padding: 4px 0 3px 0;
	padding-left: 105px;
	margin-bottom: 20px;
	height: 1%;
}

#login .inner .cssform input[type='text'] {
	width: 1400px;
}

#login .inner .cssform label {
	font-weight: bold;
	float: left;
	text-align: right;
	margin-left: -105px;
	width: 120px;
	padding-top: 3px;
	padding-right: 10px;
}

#login #remember_me_holder {
	padding-left: 120px;
}

#login #submit {
	margin-left: 15px;
}

#login #remember_me_holder label {
	float: none;
	margin-left: 0;
	text-align: left;
	width: 200px
}

#login .inner .login_message {
	padding: 6px 25px 20px 25px;
	color: #c33;
}

#login .inner .text_ {
	width: 120px;
}

#login .inner .chk {
	height: 12px;
}
.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
    padding-right:0 !important;
    padding-left:0 !important;
	width: 230px !important;
	text-aling:center !important;
	margin-left:80px !important;
}
</style>
</head>

<body>

	<p />
	<div id='login'>
		<div class="inner" style='text-align: center;'>

			<div class='fheader'>Reestablecer contraseña</div>
			<g:form action='forgotPassword' name="forgotPasswordForm"
				autocomplete='off'>

				<g:if test='${emailSent}'>
					<br />
					<g:message code='spring.security.ui.forgotPassword.sent' />
					<%--	es el mensaje de que el mail fue enviado y q lo revise--%>
				</g:if>

				<g:else>

					<br />
					<h5>Ingresá tu nombre de usuario y te enviaremos un link para
						reestablecer tu contraseña a la dirección de email que tenemos
						asociada a tu cuenta.</h5>

					<table>
						<tr>
							<td><label for="username" style="margin-left:20px !important">Usuario:</label></td>
							<td><g:textField class="form-control" name="username" size="25" /></td>
						</tr>
					</table>

					<input type='submit' id="submit"  class="btn btn-primary btn-block btn-signin" value='Resetear contraseña' />
				</g:else>

			</g:form>

		</div>
	</div>
	<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
