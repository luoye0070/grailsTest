<%@ page import="com.lj.test.OneTestSub" %>



<div class="fieldcontain ${hasErrors(bean: oneTestSubInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="oneTestSub.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${oneTestSubInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: oneTestSubInstance, field: 'passWord', 'error')} ">
	<label for="passWord">
		<g:message code="oneTestSub.passWord.label" default="Pass Word" />
		
	</label>
	<g:textField name="passWord" value="${oneTestSubInstance?.passWord}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: oneTestSubInstance, field: 'test', 'error')} ">
	<label for="test">
		<g:message code="oneTestSub.test.label" default="Test" />
		
	</label>
	<g:textField name="test" value="${oneTestSubInstance?.test}"/>
</div>

