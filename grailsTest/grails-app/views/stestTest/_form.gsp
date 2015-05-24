<%@ page import="com.lj.test.StestTest" %>



<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'iiTest', 'error')} required">
	<label for="iiTest">
		<g:message code="stestTest.iiTest.label" default="Ii Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="iiTest" from="${stestTestInstance.constraints.iiTest.inList}" required="" value="${fieldValue(bean: stestTestInstance, field: 'iiTest')}" valueMessagePrefix="stestTest.iiTest"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'bTest', 'error')} required">
	<label for="bTest">
		<g:message code="stestTest.bTest.label" default="BT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bTest" type="number" value="${stestTestInstance.bTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'cTest', 'error')} required">
	<label for="cTest">
		<g:message code="stestTest.cTest.label" default="CT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cTest" type="number" value="${stestTestInstance.cTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'cc', 'error')} required">
	<label for="cc">
		<g:message code="stestTest.cc.label" default="Cc" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="cc" value="${stestTestInstance?.cc}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'ddllTest', 'error')} required">
	<label for="ddllTest">
		<g:message code="stestTest.ddllTest.label" default="Ddll Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ddllTest" value="${fieldValue(bean: stestTestInstance, field: 'ddllTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'dlTest', 'error')} required">
	<label for="dlTest">
		<g:message code="stestTest.dlTest.label" default="Dl Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dlTest" value="${fieldValue(bean: stestTestInstance, field: 'dlTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'dtTest', 'error')} required">
	<label for="dtTest">
		<g:message code="stestTest.dtTest.label" default="Dt Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dtTest" precision="day"  value="${stestTestInstance?.dtTest}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'ftTest', 'error')} required">
	<label for="ftTest">
		<g:message code="stestTest.ftTest.label" default="Ft Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ftTest" value="${fieldValue(bean: stestTestInstance, field: 'ftTest')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'isGood', 'error')} ">
	<label for="isGood">
		<g:message code="stestTest.isGood.label" default="Is Good" />
		
	</label>
	<g:checkBox name="isGood" value="${stestTestInstance?.isGood}" />
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'lTest', 'error')} required">
	<label for="lTest">
		<g:message code="stestTest.lTest.label" default="LT est" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lTest" type="number" value="${stestTestInstance.lTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'll', 'error')} required">
	<label for="ll">
		<g:message code="stestTest.ll.label" default="Ll" />
		<span class="required-indicator">*</span>
	</label>
	<g:localeSelect name="ll" value="${stestTestInstance?.ll}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'oneTest', 'error')} required">
	<label for="oneTest">
		<g:message code="stestTest.oneTest.label" default="One Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="oneTest" name="oneTest.id" from="${com.lj.test.OneTest.list()}" optionKey="id" required="" value="${stestTestInstance?.oneTest?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'oot', 'error')} required">
	<label for="oot">
		<g:message code="stestTest.oot.label" default="Oot" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="oot" name="oot.id" from="${com.lj.test.over.OneOverTest.list()}" optionKey="id" required="" value="${stestTestInstance?.oot?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'sTest', 'error')} ">
	<label for="sTest">
		<g:message code="stestTest.sTest.label" default="ST est" />
		
	</label>
	<g:textField name="sTest" value="${stestTestInstance?.sTest}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'secondTests', 'error')} ">
	<label for="secondTests">
		<g:message code="stestTest.secondTests.label" default="Second Tests" />
		
	</label>
	<g:select name="secondTests" from="${com.lj.test.SecondTest.list()}" multiple="multiple" optionKey="id" size="5" value="${stestTestInstance?.secondTests*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'stTest', 'error')} required">
	<label for="stTest">
		<g:message code="stestTest.stTest.label" default="St Test" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stTest" type="number" value="${stestTestInstance.stTest}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stestTestInstance, field: 'tz', 'error')} required">
	<label for="tz">
		<g:message code="stestTest.tz.label" default="Tz" />
		<span class="required-indicator">*</span>
	</label>
	<g:timeZoneSelect name="tz" value="${stestTestInstance?.tz}"  />
</div>

