<%@ page import="com.lj.test.Ttest" %>



<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'iTest', 'error')} required">
	<label for="iTest">
		<g:message code="ttest.iTest.label" default="IT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="iTest" from="${ttestInstance.constraints.iTest.inList}" required="" value="${fieldValue(bean: ttestInstance, field: 'iTest')}" valueMessagePrefix="ttest.iTest"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'cc', 'error')} required">
	<label for="cc">
		<g:message code="ttest.cc.label" default="Cc" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="cc" value="${ttestInstance?.cc}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'dlTest', 'error')} required">
	<label for="dlTest">
		<g:message code="ttest.dlTest.label" default="Dl Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dlTest" value="${fieldValue(bean: ttestInstance, field: 'dlTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'dtTest', 'error')} required">
	<label for="dtTest">
		<g:message code="ttest.dtTest.label" default="Dt Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dtTest" precision="day"  value="${ttestInstance?.dtTest}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'ftTest', 'error')} required">
	<label for="ftTest">
		<g:message code="ttest.ftTest.label" default="Ft Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ftTest" value="${fieldValue(bean: ttestInstance, field: 'ftTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'isGood', 'error')} ">
	<label for="isGood">
		<g:message code="ttest.isGood.label" default="Is Good" />
		
	</label>
	<g:checkBox name="isGood" value="${ttestInstance?.isGood}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'll', 'error')} required">
	<label for="ll">
		<g:message code="ttest.ll.label" default="Ll" />
		<span class="required-indicator">*</span>
	</label>
	<g:localeSelect name="ll" value="${ttestInstance?.ll}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'oneTest', 'error')} required">
	<label for="oneTest">
		<g:message code="ttest.oneTest.label" default="One Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="oneTest" name="oneTest.id" from="${com.lj.test.OneTest.list()}" optionKey="id" required="" value="${ttestInstance?.oneTest?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'sTest', 'error')} ">
	<label for="sTest">
		<g:message code="ttest.sTest.label" default="ST est" />
		
	</label>
	<g:textField name="sTest" value="${ttestInstance?.sTest}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'secondTests', 'error')} ">
	<label for="secondTests">
		<g:message code="ttest.secondTests.label" default="Second Tests" />
		
	</label>
	<g:select name="secondTests" from="${com.lj.test.SecondTest.list()}" multiple="multiple" optionKey="id" size="5" value="${ttestInstance?.secondTests*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'stTest', 'error')} required">
	<label for="stTest">
		<g:message code="ttest.stTest.label" default="St Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stTest" type="number" value="${ttestInstance.stTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ttestInstance, field: 'tz', 'error')} required">
	<label for="tz">
		<g:message code="ttest.tz.label" default="Tz" />
		<span class="required-indicator">*</span>
	</label>
	<g:timeZoneSelect name="tz" value="${ttestInstance?.tz}"  />
</div>

