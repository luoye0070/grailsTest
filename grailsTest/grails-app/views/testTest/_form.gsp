<%@ page import="com.lj.test.TestTest" %>



<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'iiTest', 'error')} required">
	<label for="iiTest">
		<g:message code="testTest.iiTest.label" default="Ii Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="iiTest" from="${testTestInstance.constraints.iiTest.inList}" required="" value="${fieldValue(bean: testTestInstance, field: 'iiTest')}" valueMessagePrefix="testTest.iiTest"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'bTest', 'error')} required">
	<label for="bTest">
		<g:message code="testTest.bTest.label" default="BT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bTest" type="number" value="${testTestInstance.bTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'cTest', 'error')} required">
	<label for="cTest">
		<g:message code="testTest.cTest.label" default="CT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cTest" type="number" value="${testTestInstance.cTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'cc', 'error')} required">
	<label for="cc">
		<g:message code="testTest.cc.label" default="Cc" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="cc" value="${testTestInstance?.cc}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'dlTest', 'error')} required">
	<label for="dlTest">
		<g:message code="testTest.dlTest.label" default="Dl Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dlTest" value="${fieldValue(bean: testTestInstance, field: 'dlTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'dtTest', 'error')} required">
	<label for="dtTest">
		<g:message code="testTest.dtTest.label" default="Dt Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dtTest" precision="day"  value="${testTestInstance?.dtTest}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'ftTest', 'error')} required">
	<label for="ftTest">
		<g:message code="testTest.ftTest.label" default="Ft Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ftTest" value="${fieldValue(bean: testTestInstance, field: 'ftTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'isGood', 'error')} ">
	<label for="isGood">
		<g:message code="testTest.isGood.label" default="Is Good" />
		
	</label>
	<g:checkBox name="isGood" value="${testTestInstance?.isGood}" />
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'lTest', 'error')} required">
	<label for="lTest">
		<g:message code="testTest.lTest.label" default="LT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lTest" type="number" value="${testTestInstance.lTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'll', 'error')} required">
	<label for="ll">
		<g:message code="testTest.ll.label" default="Ll" />
		<span class="required-indicator">*</span>
	</label>
	<g:localeSelect name="ll" value="${testTestInstance?.ll}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'oneTest', 'error')} required">
	<label for="oneTest">
		<g:message code="testTest.oneTest.label" default="One Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="oneTest" name="oneTest.id" from="${com.lj.test.OneTest.list()}" optionKey="id" required="" value="${testTestInstance?.oneTest?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'oot', 'error')} required">
	<label for="oot">
		<g:message code="testTest.oot.label" default="Oot" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="oot" name="oot.id" from="${com.lj.test.over.OneOverTest.list()}" optionKey="id" required="" value="${testTestInstance?.oot?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'sTest', 'error')} ">
	<label for="sTest">
		<g:message code="testTest.sTest.label" default="ST est" />
		
	</label>
	<g:textField name="sTest" value="${testTestInstance?.sTest}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'secondTests', 'error')} ">
	<label for="secondTests">
		<g:message code="testTest.secondTests.label" default="Second Tests" />
		
	</label>
	<g:select name="secondTests" from="${com.lj.test.SecondTest.list()}" multiple="multiple" optionKey="id" size="5" value="${testTestInstance?.secondTests*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'stTest', 'error')} required">
	<label for="stTest">
		<g:message code="testTest.stTest.label" default="St Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stTest" type="number" value="${testTestInstance.stTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testTestInstance, field: 'tz', 'error')} required">
	<label for="tz">
		<g:message code="testTest.tz.label" default="Tz" />
		<span class="required-indicator">*</span>
	</label>
	<g:timeZoneSelect name="tz" value="${testTestInstance?.tz}"  />
</div>

