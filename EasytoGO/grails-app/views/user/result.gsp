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



<div class="container">
    <h1>Confirmación de registro.</h1>
     <div class="alert alert-success">
        ${message}
     </div>
    </div>


	
		</div>
	</body>
</html>
