<%@ page import="easytogo.Vehiculo" %>
<%@ page import="easytogo.Marca" %>
<g:javascript library='jquery' />
<div class="container">
     <div class="form-group">
			<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'marca', 'error')} required">
				<label for="marca"class="col-md-4 control-label">
						<g:message code="marca.label" default="Marca" />
						<span class="required-indicator">*</span>
			</label>
			<div class="col-md-6">
				<g:select id="marca" name="marca.id" from="${easytogo.Marca.list()}" optionKey="id" required="" noSelection="[null:' ']" onchange="marcaChanged(this.value);" value="${ModeloInstance?.marca?.id}" class="many-to-one"/>
			</div>
			</div>
		</div>
		 <div class="form-group">
				<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'modelo', 'error')} required">
					<label for="modelo" class="col-md-4 control-label">
							<g:message code="vehiculo.modelo.label" default="Modelo" />
							<span class="required-indicator">*</span>
					</label>
		<div class="col-md-6">
		<g:select id="modelo" name="modelo.id" from="${}" optionKey="id" required="" value="${vehiculoInstance?.modelo?.id}" class="many-to-one"/>
			</div>
			</div>
		</div>
         
		 <script>
            function marcaChanged(marcaId) {
                <g:remoteFunction controller="vehiculo" action="marcaChanged"
                    update="modelo"
                    params="'marcaId='+marcaId"/>
            }
		</script>
 
 <!--
  <script>
    function marcaChanged(marcaId) {
        jQuery.ajax({type:'POST',data:'marcaId='+marcaId, url:'/forum/easytogo/marcaChanged',success:function(data,textStatus){jQuery('#subContainer').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
    }
</script>
-->
 <div class="form-group">
<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'anio', 'error')} required">
	<label for="anio" class="col-md-4 control-label">
			<g:message code="vehiculo.anio.label" default="Año" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:select name="anio" from="${2015..1930}" value="${vehiculoInstance.anio}" required="" />
	</div>
</div>
</div>
<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'color', 'error')} required">
	<label for="color"  class="col-md-4 control-label">
		<g:message code="vehiculo.color.label" default="Color" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<input name="color" class="form-control input-md" required="" value="${vehiculoInstance?.color}"/>
	</div>
</div>

</div>
<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'combustible', 'error')} required">
	<label for="combustible" class="col-md-4 control-label">
		<g:message code="vehiculo.combustible.label" default="Combustible" />
		<span class="required-indicator">*</span>
	</label>
	<!-- <g:field name="combustible" type="number" value="${vehiculoInstance.combustible}" required=""/> -->
	<div class="col-md-6">
	<g:select id="combustible" name="combustible" value="${vehiculoInstance.combustible}"
          from="${['1': 'Nafta', '2': 'Gasoil', '3': 'GNC']}"
          optionKey="key" optionValue="value" />

	</div>
</div>

</div>


<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'seguro', 'error')} ">
	<label for="seguro" class="col-md-4 control-label">
		<g:message code="vehiculo.seguro.label" default="Tengo seguro" />
		
	</label>
	<div class="col-md-6">
	<g:checkBox name="seguro" value="${vehiculoInstance?.seguro}" />

</div></div>
</div>


<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'user', 'error')} required">
	<label for="user" class="col-md-4 control-label">
		<g:message code="vehiculo.user.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<g:select id="user"  name="user.id" from="${easytogo.User.findById(params.user.id)}" optionKey="id" required="" value="${vehiculoInstance?.user?.id}" class="many-to-one"/>
</div>
</div>
</div>
</div>
