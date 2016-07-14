<%@ page import="easytogo.Rol" %>


<div class="form-group">
<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'authority', 'error')} required">
	<label for="authority" class="col-md-4 control-label">
		<g:message code="rol.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-6">
	<input name="authority"  class="form-control input-md
	" required="" value="${rolInstance?.authority}"/>
</div>
</div>
</div>

