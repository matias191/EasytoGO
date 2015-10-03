<%@ page import="easytogo.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" />(vuela mas adelante)</g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" />(vuela mas adelante)</g:link></li>
			</ul>
		</div>



<h1>Gracias por registrarte en Easy To GO!</h1>
<p>Hemos enviado un e-mail a ${mail},
por favor revisa tu e-mail y haz click en el link para completar el proceso de registro.<p>

<p>Si no puedes ver el e-mail en el transcurso de unos minutos, por favor revisa la
carpeta Spam o No deseada.</p>
<br></br>
<p> Ante dudas o consultas puedes escribir a support@easytogo.com.ar</p>


	
		</div>
	</body>
</html>
