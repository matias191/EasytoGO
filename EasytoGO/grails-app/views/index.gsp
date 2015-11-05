<%@ page import="easytogo.User"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="es"> <!--<![endif]-->
<head>
     <meta name="layout" content="main2"/>
</head>

<body>
<div class="wrapper">
      <div class="interactive-slider-v2 img-v1" style="background: url('${resource(dir: 'images', file: 'Carre.jpg')}'); background-size: cover;background-position: center;margin-top:0; ">
     	<div class="container">
     		
            <h1>Bienvenido a EasyToGO</h1>
            
            <p>Encuentra tu viaje</p>
           
             <fieldset class="form">
				<g:form controller="viaje"action="buscaViaje" method="GET">
					<div class="row">
					<div class="fieldcontain required">
						<div class="input-group input-group-sm" style="padding: 0 25% 0 25%;">
						<label for="query" class="input-group-addon" id="basic-addon1" aria-describedby="basic-addon1" ><span class="glyphicon glyphicon-map-marker"></span></label>
						<g:textField id="pac-input2" class="form-control" name="query" value="${params.query}"placeholder="Ingresa un Origen"/> 
						</div>
					</div>
						
					<div class="fieldcontain" style="margin-top:0.3em;" >
						<div class="input-group input-group-sm col-lg-12" style="padding: 0 25% 0 25%;" >
						<label for="query"class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-map-marker"></span></label>
						<g:textField id="pac-input" class="form-control" name="query1" value="${params.query1}" aria-describedby="basic-addon2" placeholder="Ingresa un Destino"/> <br>
						</div>
						<div class="fieldcontain" style="margin-top:0.3em; padding: 0 25% 0 25%;" >						
						       <div class="input-group date input-group-sm col-lg-12" >
      							<input id="date" type="text" class="form-control" placeholder="Fecha de Viaje"><span class="input-group-addon" ><i class="glyphicon glyphicon-th"></i></span>
    						   </div>
						<div >
						<div class="fieldcontain" style="margin-top:0.3em;" >
						<button type="submit" class="controls btn btn-success btn-lg rounded"  value="Buscar">Buscar</button>
						</div>
						</div>
						</div>
					</div>
				</div>
				</g:form>
			</fieldset>
            
        </div>
    </div>
    <!--=== End Slider ===-->

    <!--=== Purchase Block ===-->
    <!--/row-->
    <!-- End Purchase Block -->

    <!--=== Content Part ===-->
    <div class="container content-sm">
    	<!-- Service Blocks -->
    	<div class="row margin-bottom-30">
        	<div class="col-md-4">
        		<div class="service">
                    <i class="fa fa-compress service-icon"></i>
        			<div class="desc">
        				<h4>Comparte tu Viaje</h4>
                        <p>Estas cansado de viajar solo y gastar demasiado dinero en combustible?
                            Comparte tu viaje hoy y olvidate de estos problemas</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="service">
                    <i class="fa fa-cogs service-icon"></i>
        			<div class="desc">
        				<h4>Conoce Nuevas Personas</h4>
                        <p>Encuentrar nuevos amigos es mas facil que nunca, nada hace mejor la amistad que gastar unas pocas horas hablando con personas interesantes</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="service">
                    <i class="fa fa-rocket service-icon"></i>
        			<div class="desc">
        				<h4>Ve a nuevos lugares</h4>
                        <p>Encuentra nuevos lugares para descansar, ya no tienes excusas para quedarte y no conocer</p>
        			</div>
        		</div>	
        	</div>
    	</div>

    </div>
    
</div>

<asset:javascript  src="bootstrap-datepicker.es.min.js" />
<asset:javascript  src="scripts.js" />

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmPsZlBSWMaZodkL-MfbUsIwdqoOX9F2s&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>