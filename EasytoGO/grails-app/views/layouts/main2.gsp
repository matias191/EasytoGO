
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>EasyToGO - Una manera Rapida, Economica y Divertida de viajar</title>
		<link rel="shortcut icon" href="${request.contextPath}/choper/favicon.ico">
		<asset:stylesheet src="bootstrap.css" type="text/css"/>
		<asset:stylesheet src="bootstrap-responsive.css" type="text/css"/>
		<link rel="stylesheet" href="${request.contextPath}/choper/assets/css/footers/footer-v1.css">
		<!-- <link rel="stylesheet" href="${request.contextPath}/choper/assets/css/style.css">-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!--<link rel="stylesheet" href="${request.contextPath}/choper/assets/plugins/font-awesome/css/font-awesome.min.css">>-->
		 <link rel="stylesheet" href="${request.contextPath}/choper/assets/plugins/line-icons/line-icons.css">
		<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>
		<asset:stylesheet src="stilos.css" type="text/css"/>
		<asset:stylesheet src="bootstrap-datepicker3.min.css" type="text/css"/>
        <asset:stylesheet src="bootstrap-datepicker.min.css" type="text/css"/>
		<asset:stylesheet src="bootstrap-datetimepicker.min.css" type="text/css"/>
		<asset:stylesheet src="star-rating.min.css" type="text/css"/>
		
		
		<g:layoutHead/>
		
	</head>
	<body>
		<nav class="navbar navbar-inverse" style="margin-bottom: 0 !important;
	border-radius: 0 !important;background:ocefa5 !important;">
  			<div class="container-fluid">
    			<div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a  class="navbar-brand home" style="padding: 0;
	padding-top: 4px;padding-left:10px;" href="${createLink(uri: '/')}" ><asset:image src="esasylogoheade2trans5.png" class="img-responsive" alt="Logo" /></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav" style="vertical-align:center;">
        <li><a class="home" href="${createLink(uri: '/')}"	>Encuentra tu viaje</a></li>
        <sec:ifLoggedIn>
        <li><g:link controller='viaje' action='create'>Publica tu viaje</g:link></li>
        
        
        
<%--        MUESTRA LAS PREGUNTAS QUE TIENE SIN RESPONDER EL USUARIO QUE ESTA LOGUEADO--%>

<g:set var="user" value="${easytogo.User.findById(sec.loggedInUserInfo(field:'id'))}"/>

<g:set var="notificaciones" value="${0}"/>

						<g:each in="${user?.viaje}" var="v">
							<g:each in="${v?.preguntas}" var="p">
								<g:each in="${p?.respuesta == null}" var="r">
									<g:if test="${r}"> 
										<g:set var="notificaciones" value="${notificaciones +1 }"/>
									</g:if>									
								</g:each>
							</g:each>
						</g:each>
				
  <li><a class="home"  href="http://localhost:8080/EasytoGO/respuesta/create">Preguntas <span class="badge">${notificaciones}</span><br></a></li>     
        
        
        
        
        
        
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
		<g:set var="msg" value="${1}"/>
        <li><g:link controller='login' action='auth' params="[msg: msg]">Publica tu viaje</g:link></li>        
        </sec:ifNotLoggedIn>
      </ul>
      <ul class="nav navbar-nav navbar-right" style="float:left;">
      	<sec:ifNotLoggedIn>
        <li><g:link controller='User' action='create'><span class="glyphicon glyphicon-user"></span> Registrarse</g:link></li>
        <li><g:link controller='login' action='auth'><span class="glyphicon glyphicon-log-in"></span> Iniciar sesión</g:link></li>
      	</sec:ifNotLoggedIn>
      	<sec:ifLoggedIn>
      	
      	
      	
      	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><sec:username/><span class="caret"></span></a>
     		<ul class="dropdown-menu">
     		
     			
     		 
     		 <li><a href="#"></a><g:link class="editar" controller='User' action= 'show' id="${sec.loggedInUserInfo(field:'id') }"> <span class="glyphicon glyphicon-user"></span>Mi perfil</g:link></li>
     		 <li><a href="#"></a><g:link class="editar" controller='viaje' action= 'misViajes' id="${sec.loggedInUserInfo(field:'id') }"> <span class="glyphicon glyphicon-plane"></span>Mis Viajes</g:link></li>
     		 <li><a href="#"></a><g:link class="editar" controller='reserva' action= 'misReservas' id="${sec.loggedInUserInfo(field:'id') }"> <span class="glyphicon glyphicon-usd"></span>Mis Reservas</g:link></li>
     		 <li><a href="#"></a><g:link class="editar" controller='viaje' action= 'usuarioViaje' id="${sec.loggedInUserInfo(field:'id') }"> <span class="glyphicon glyphicon-star"></span>Calificar</g:link></li>
     		 <sec:ifAllGranted roles="ROLE_ADMIN">
				 <%--<li><a href="#"></a><g:link class="modelo" controller='Modelo' action= 'index'>ABM Modelo</g:link></li>
				 <li><a href="#"></a><g:link class="marca" controller='Marca' action= 'index'>ABM Marca</g:link></li>
				 --%>
			<li><a href="#"></a><g:link controller='viaje' action='reportes'><span class="glyphicon glyphicon-cog"></span>Administracion</g:link></li>
				</sec:ifAllGranted>
     		 <li class="divider"></li>	
     		 <li><a href="#"></a><g:link class="logout" controller="logout" action= "index" method="POST"> <span class="glyphicon glyphicon-off"></span>Desconectarse</g:link></li>
     		</ul>
     	</sec:ifLoggedIn>
      </ul>
    </div>
  </div>
</nav>
  <g:layoutBody/>
	
		
		
<div class="footer-v1">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <!-- About -->
                    <div class="col-md-3 md-margin-bottom-40">
                        <a href="index.html"><asset:image id="logo-footer" class="footer-logo"src="Easytogologotrans3.png" class="img-responsive" alt="Responsive image"/></a>
                        <p>Permite a las personas ofrecer sus viajes, conocer nuevos amigos, compartir experiencias y viajar de manera divertida</p>
                        <p>Aportar su granito de arena para la mejora del medio ambiente</p>
                    </div><!--/col-md-3-->
                    <!-- End About -->

                    <!-- Latest -->
                    <div class="col-md-1 md-margin-bottom-40">
                        <div class="posts">
                            <div class=""><h2></h2></div>
                            <ul class="">
                                <li>
                                    <a href="#"></a>
                                    <small></small>
                                </li>
                                <li>
                                    <a href="#"></a>
                                    <small></small>
                                </li>
                                <li>
                                    <a href="#"></a>
                                    <small></small>
                                </li>
                            </ul>
                        </div>
                    </div><!--/col-md-3-->
                    <!-- End Latest -->

                    <!-- Link List -->
                    <div class="col-md-4 md-margin-bottom-40">
                        <div class="headline"><h2>Nuestra Empresa</h2></div>
                        <ul class="list-unstyled link-list">
                            <li><a href="#">Sobre Nosotros</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#">Nuestra Empresa</a><i class="fa fa-angle-right"></i></li>
                            <li><a href="#"></a><i class=""></i></li>
                            <li><a href="#"></a><i class=""></i></li>
                            <li><a href="#"></a><i class=""></i></li>
                        </ul>
                    </div><!--/col-md-3-->
                    <!-- End Link List -->

                    <!-- Address -->
                    <div class="col-md-4 map-img md-margin-bottom-40">
                        <div class="headline"><h2>Contactenos</h2></div>
                        <address class="md-margin-bottom-40">
                            J. Rodriguez 273, Mendoza <br />
                            Mendoza, Argentina <br />
                            Telefono: 261 2194052 <br />
                            Email: <a href="easytogo.viajescompartidos@gmail.com" class="">easytogo.viajescompartidos@gmail.com</a>
                        </address>
                    </div><!--/col-md-3-->
                    <!-- End Address -->
                </div>
            </div>
        </div><!--/footer-->

        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p>
                            2015 &copy; All Rights Reserved.
                           <a href="#">Politicas de Privacidad</a> | <a href="#">Terminos de Servicio</a>
                        </p>
                    </div>

                    <!-- Social Links -->
                    <div class="col-md-6">
                        <ul class="footer-socials list-inline">
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Skype">
                                    <i class="fa fa-skype"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Google Plus">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Linkedin">
                                    <i class="fa fa-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest">
                                    <i class="fa fa-pinterest"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Dribbble">
                                    <i class="fa fa-dribbble"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Social Links -->
                </div>
            </div>
        </div><!--/copyright-->
    </div>		
		<asset:javascript  src="jquery-2.1.4.js"/>
		<asset:javascript  src="bootstrap.min.js" />
		<asset:javascript  src="bootstrap-datepicker.js" />
		<asset:javascript  src="bootstrap-datepicker.es.min.js" />
		
		<asset:javascript  src="bootstrap-datetimepicker.min.js" />
		<asset:javascript  src="bootstrap-datetimepicker.es.js" />
		
		<asset:javascript  src="star-rating.min.js" />
		<asset:javascript  src="scripts.js" />
		
</body>
</html>