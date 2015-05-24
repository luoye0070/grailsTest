
<%@ page import="com.lj.test.Ttest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ttest.label', default: 'Ttest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ttest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ttest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ttest">
			
				<g:if test="${ttestInstance?.iTest}">
				<li class="fieldcontain">
					<span id="iTest-label" class="property-label"><g:message code="ttest.iTest.label" default="IT est" /></span>
					
						<span class="property-value" aria-labelledby="iTest-label"><g:fieldValue bean="${ttestInstance}" field="iTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.cc}">
				<li class="fieldcontain">
					<span id="cc-label" class="property-label"><g:message code="ttest.cc.label" default="Cc" /></span>
					
						<span class="property-value" aria-labelledby="cc-label"><g:fieldValue bean="${ttestInstance}" field="cc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.dlTest}">
				<li class="fieldcontain">
					<span id="dlTest-label" class="property-label"><g:message code="ttest.dlTest.label" default="Dl Test" /></span>
					
						<span class="property-value" aria-labelledby="dlTest-label"><g:fieldValue bean="${ttestInstance}" field="dlTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.dtTest}">
				<li class="fieldcontain">
					<span id="dtTest-label" class="property-label"><g:message code="ttest.dtTest.label" default="Dt Test" /></span>
					
						<span class="property-value" aria-labelledby="dtTest-label"><g:formatDate date="${ttestInstance?.dtTest}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.ftTest}">
				<li class="fieldcontain">
					<span id="ftTest-label" class="property-label"><g:message code="ttest.ftTest.label" default="Ft Test" /></span>
					
						<span class="property-value" aria-labelledby="ftTest-label"><g:fieldValue bean="${ttestInstance}" field="ftTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.isGood}">
				<li class="fieldcontain">
					<span id="isGood-label" class="property-label"><g:message code="ttest.isGood.label" default="Is Good" /></span>
					
						<span class="property-value" aria-labelledby="isGood-label"><g:formatBoolean boolean="${ttestInstance?.isGood}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.ll}">
				<li class="fieldcontain">
					<span id="ll-label" class="property-label"><g:message code="ttest.ll.label" default="Ll" /></span>
					
						<span class="property-value" aria-labelledby="ll-label"><g:fieldValue bean="${ttestInstance}" field="ll"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.oneTest}">
				<li class="fieldcontain">
					<span id="oneTest-label" class="property-label"><g:message code="ttest.oneTest.label" default="One Test" /></span>
					
						<span class="property-value" aria-labelledby="oneTest-label"><g:link controller="oneTest" action="show" id="${ttestInstance?.oneTest?.id}">${ttestInstance?.oneTest?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.sTest}">
				<li class="fieldcontain">
					<span id="sTest-label" class="property-label"><g:message code="ttest.sTest.label" default="ST est" /></span>
					
						<span class="property-value" aria-labelledby="sTest-label"><g:fieldValue bean="${ttestInstance}" field="sTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.secondTests}">
				<li class="fieldcontain">
					<span id="secondTests-label" class="property-label"><g:message code="ttest.secondTests.label" default="Second Tests" /></span>
					
						<g:each in="${ttestInstance.secondTests}" var="s">
						<span class="property-value" aria-labelledby="secondTests-label"><g:link controller="secondTest" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.stTest}">
				<li class="fieldcontain">
					<span id="stTest-label" class="property-label"><g:message code="ttest.stTest.label" default="St Test" /></span>
					
						<span class="property-value" aria-labelledby="stTest-label"><g:fieldValue bean="${ttestInstance}" field="stTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ttestInstance?.tz}">
				<li class="fieldcontain">
					<span id="tz-label" class="property-label"><g:message code="ttest.tz.label" default="Tz" /></span>
					
						<span class="property-value" aria-labelledby="tz-label"><g:fieldValue bean="${ttestInstance}" field="tz"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ttestInstance?.id}" />
					<g:link class="edit" action="edit" id="${ttestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
