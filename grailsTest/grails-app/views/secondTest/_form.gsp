<%@ page import="com.lj.test.SecondTest" %>



<div class="fieldcontain ${hasErrors(bean: secondTestInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="secondTest.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${secondTestInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondTestInstance, field: 'ot', 'error')} required">
	<label for="ot">
		<g:message code="secondTest.ot.label" default="Ot" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ot" name="ot.id" from="${com.lj.test.OneTest.list()}" optionKey="id" required="" value="${secondTestInstance?.ot?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondTestInstance, field: 'ots', 'error')} ">
	<label for="ots">
		<g:message code="secondTest.ots.label" default="Ots" />
		
	</label>
	<g:select name="ots" from="${com.lj.test.OneTestSub.list()}" multiple="multiple" optionKey="id" size="5" value="${secondTestInstance?.ots*.id}" class="many-to-many"/>
</div>

