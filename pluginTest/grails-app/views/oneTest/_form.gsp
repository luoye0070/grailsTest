<%@ page import="com.lj.test.OneTest" %>



<div class="fieldcontain ${hasErrors(bean: oneTestInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="oneTest.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${oneTestInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: oneTestInstance, field: 'passWord', 'error')} ">
	<label for="passWord">
		<g:message code="oneTest.passWord.label" default="Pass Word" />
		
	</label>
	<g:textField name="passWord" value="${oneTestInstance?.passWord}" />
</div>

