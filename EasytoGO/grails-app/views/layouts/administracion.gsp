
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->

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
		<asset:stylesheet src="sb-admin.css" type="text/css"/>	
		<link rel="stylesheet" href="${request.contextPath}/choper/assets/css/footers/footer-v1.css" >
		 <link rel="stylesheet" href="${request.contextPath}/choper/assets/plugins/line-icons/line-icons.css">
		<g:layoutHead/>
</head>
	
<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-bottom: 0 !important;
				border-radius: 0 !important;background:ocefa5 !important;">
  			
    			<div class="navbar-header">
      				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        					<span class="icon-bar"></span>
       						 <span class="icon-bar"></span>
        					<span class="icon-bar"></span>                        
      				</button>
      				<a  class="navbar-brand home" style="padding: 0;
						padding-top: 4px;padding-left:10px;" href="${createLink(uri: '/')}" ><asset:image src="esasylogoheade2trans5.png" class="img-responsive" alt="Logo" /></a>
    			</div>
    			<div class="collapse navbar-collapse " id="myNavbar">
      				<ul class="nav navbar-nav" style="vertical-align:center;">
        				<li><a class="home" href="${createLink(uri: '/')}"	>Encuentra tu viaje</a></li>
        				<sec:ifLoggedIn>
        				<li><g:link controller='viaje' action='create'>Publica tu viaje</g:link></li>
        				</sec:ifLoggedIn>
        				<sec:ifNotLoggedIn>
        				<li><g:link controller='login' action='auth'>Publica tu viaje</g:link></li>
        				</sec:ifNotLoggedIn>
      				</ul>
      				<ul class="nav navbar-nav navbar-right top-nav" style="float:left;">
      				<sec:ifNotLoggedIn>
        			<li><g:link controller='User' action='create'><span class="glyphicon glyphicon-user"></span> Sign Up</g:link></li>
        			<li><g:link controller='login' action='auth'><span class="glyphicon glyphicon-log-in"></span> Login</g:link></li>
      				</sec:ifNotLoggedIn>
      				<sec:ifLoggedIn>
      	
      	
      	
      				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><sec:username/><span class="caret"></span></a>
     				<ul class="dropdown-menu">
     		
     			
     		 
     		 			<li><a href="#"></a><g:link class="editar" controller='User' action= 'show' id="${sec.loggedInUserInfo(field:'id') }"> <span class="glyphicon glyphicon-user"></span>Mi perfil</g:link></li>
     		 			<sec:ifAllGranted roles="ROLE_ADMIN">
				 		<%--<li><a href="#"></a><g:link class="modelo" controller='Modelo' action= 'index'>ABM Modelo</g:link></li>
				 		<li><a href="#"></a><g:link class="marca" controller='Marca' action= 'index'>ABM Marca</g:link></li>
				 		--%>
			 			<li><a href="#"></a><g:link controller='marca' action='index'><span class="glyphicon glyphicon-cog"></span>Administracion</g:link></li>
						</sec:ifAllGranted>
     		 			<li class="divider"></li>	
     					 <li><a href="#"></a><g:link class="logout" controller="logout" action= "index" method="POST"> <span class="glyphicon glyphicon-off"></span>Desconectarse</g:link></li>
     				</ul>
     				</sec:ifLoggedIn>
     				 </ul>
    			</div>
  	
				<div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                       <a href="#"> <i class="fa fa-fw fa-dashboard"></i>Reportes</a>
                    </li>
                    <li>
                       <g:link controller='marca' action='index'><i class="fa fa-fw fa-bar-chart-o"></i> Marcas</g:link>
                    </li>
                    <li>
                       <g:link controller='modelo' action='index'><i class="fa fa-fw fa-table"></i> Modelos</g:link>
                    </li>
                    <li>
                          <g:link controller='user' action='index'><i class="fa fa-fw fa-edit"></i> Usuarios</g:link>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-desktop"></i> Viajes</a>
                    </li>
                   
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Seguridad <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Crear permisos</a>
                            </li>
                            <li>
                                <a href="#">Revocar permisos</a>
                            </li>
                        </ul>
                    </li>
                   
                </ul>
            </div>
			


		</nav>

  
<g:layoutBody/>


		<asset:javascript  src="jquery-2.1.4.js"/>
		<asset:javascript  src="bootstrap.min.js" />
		<asset:javascript  src="bootstrap-datepicker.js" />
		<asset:javascript  src="bootstrap-datepicker.es.min.js" />
		
		<asset:javascript  src="scripts.js" />
		
</body>
</html>












