<%@ page import="com.lj.test.over.OneOverTest" %>



<div class="fieldcontain ${hasErrors(bean: oneOverTestInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="oneOverTest.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="code" type="number" value="${oneOverTestInstance.code}" required=""/>
</div>

