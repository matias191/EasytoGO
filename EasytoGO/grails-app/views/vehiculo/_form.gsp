<%@ page import="easytogo.Vehiculo" %>
<%@ page import="easytogo.Marca" %>
<g:javascript library='jquery' />

<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'marca', 'error')} required">
	<label for="marca">
		<g:message code="marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="marca" name="marca.id" from="${easytogo.Marca.list()}" optionKey="id" required="" noSelection="[null:' ']" onchange="marcaChanged(this.value);" value="${ModeloInstance?.marca?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'modelo', 'error')} required">
	<label for="modelo">
		<g:message code="vehiculo.modelo.label" default="Modelo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modelo" name="modelo.id" from="${}" optionKey="id" required="" value="${vehiculoInstance?.modelo?.id}" class="many-to-one"/>

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
<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'anio', 'error')} required">
	<label for="anio">
		<g:message code="vehiculo.anio.label" default="Año" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select name="anio" from="${2015..1930}" value="${vehiculoInstance.anio}" required="" />

</div>

<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'color', 'error')} required">
	<label for="color">
		<g:message code="vehiculo.color.label" default="Color" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="color" required="" value="${vehiculoInstance?.color}"/>
	

</div>

<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'combustible', 'error')} required">
	<label for="combustible">
		<g:message code="vehiculo.combustible.label" default="Combustible" />
		<span class="required-indicator">*</span>
	</label>
	<!-- <g:field name="combustible" type="number" value="${vehiculoInstance.combustible}" required=""/> -->
	
<g:select id="combustible" name="combustible" value="${vehiculoInstance.combustible}"
          from="${['1': 'Nafta', '2': 'Gasoil', '3': 'GNC']}"
          optionKey="key" optionValue="value" />



</div>



<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'seguro', 'error')} ">
	<label for="seguro">
		<g:message code="vehiculo.seguro.label" default="Seguro" />
		
	</label>
	<g:checkBox name="seguro" value="${vehiculoInstance?.seguro}" />

</div>



<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="vehiculo.user.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user"  name="user.id" from="${easytogo.User.findById(params.user.id)}" optionKey="id" required="" value="${vehiculoInstance?.user?.id}" class="many-to-one"/>

</div>

