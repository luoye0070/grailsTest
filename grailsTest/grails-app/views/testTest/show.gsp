
<%@ page import="com.lj.test.TestTest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testTest.label', default: 'TestTest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-testTest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-testTest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list testTest">
			
				<g:if test="${testTestInstance?.iiTest}">
				<li class="fieldcontain">
					<span id="iiTest-label" class="property-label"><g:message code="testTest.iiTest.label" default="Ii Test" /></span>
					
						<span class="property-value" aria-labelledby="iiTest-label"><g:fieldValue bean="${testTestInstance}" field="iiTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.bTest}">
				<li class="fieldcontain">
					<span id="bTest-label" class="property-label"><g:message code="testTest.bTest.label" default="BT est" /></span>
					
						<span class="property-value" aria-labelledby="bTest-label"><g:fieldValue bean="${testTestInstance}" field="bTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.cTest}">
				<li class="fieldcontain">
					<span id="cTest-label" class="property-label"><g:message code="testTest.cTest.label" default="CT est" /></span>
					
						<span class="property-value" aria-labelledby="cTest-label"><g:fieldValue bean="${testTestInstance}" field="cTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.cc}">
				<li class="fieldcontain">
					<span id="cc-label" class="property-label"><g:message code="testTest.cc.label" default="Cc" /></span>
					
						<span class="property-value" aria-labelledby="cc-label"><g:fieldValue bean="${testTestInstance}" field="cc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.dlTest}">
				<li class="fieldcontain">
					<span id="dlTest-label" class="property-label"><g:message code="testTest.dlTest.label" default="Dl Test" /></span>
					
						<span class="property-value" aria-labelledby="dlTest-label"><g:fieldValue bean="${testTestInstance}" field="dlTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.dtTest}">
				<li class="fieldcontain">
					<span id="dtTest-label" class="property-label"><g:message code="testTest.dtTest.label" default="Dt Test" /></span>
					
						<span class="property-value" aria-labelledby="dtTest-label"><g:formatDate date="${testTestInstance?.dtTest}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.ftTest}">
				<li class="fieldcontain">
					<span id="ftTest-label" class="property-label"><g:message code="testTest.ftTest.label" default="Ft Test" /></span>
					
						<span class="property-value" aria-labelledby="ftTest-label"><g:fieldValue bean="${testTestInstance}" field="ftTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.isGood}">
				<li class="fieldcontain">
					<span id="isGood-label" class="property-label"><g:message code="testTest.isGood.label" default="Is Good" /></span>
					
						<span class="property-value" aria-labelledby="isGood-label"><g:formatBoolean boolean="${testTestInstance?.isGood}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.lTest}">
				<li class="fieldcontain">
					<span id="lTest-label" class="property-label"><g:message code="testTest.lTest.label" default="LT est" /></span>
					
						<span class="property-value" aria-labelledby="lTest-label"><g:fieldValue bean="${testTestInstance}" field="lTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.ll}">
				<li class="fieldcontain">
					<span id="ll-label" class="property-label"><g:message code="testTest.ll.label" default="Ll" /></span>
					
						<span class="property-value" aria-labelledby="ll-label"><g:fieldValue bean="${testTestInstance}" field="ll"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.oneTest}">
				<li class="fieldcontain">
					<span id="oneTest-label" class="property-label"><g:message code="testTest.oneTest.label" default="One Test" /></span>
					
						<span class="property-value" aria-labelledby="oneTest-label"><g:link controller="oneTest" action="show" id="${testTestInstance?.oneTest?.id}">${testTestInstance?.oneTest?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.oot}">
				<li class="fieldcontain">
					<span id="oot-label" class="property-label"><g:message code="testTest.oot.label" default="Oot" /></span>
					
						<span class="property-value" aria-labelledby="oot-label"><g:link controller="oneOverTest" action="show" id="${testTestInstance?.oot?.id}">${testTestInstance?.oot?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.sTest}">
				<li class="fieldcontain">
					<span id="sTest-label" class="property-label"><g:message code="testTest.sTest.label" default="ST est" /></span>
					
						<span class="property-value" aria-labelledby="sTest-label"><g:fieldValue bean="${testTestInstance}" field="sTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.secondTests}">
				<li class="fieldcontain">
					<span id="secondTests-label" class="property-label"><g:message code="testTest.secondTests.label" default="Second Tests" /></span>
					
						<g:each in="${testTestInstance.secondTests}" var="s">
						<span class="property-value" aria-labelledby="secondTests-label"><g:link controller="secondTest" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.stTest}">
				<li class="fieldcontain">
					<span id="stTest-label" class="property-label"><g:message code="testTest.stTest.label" default="St Test" /></span>
					
						<span class="property-value" aria-labelledby="stTest-label"><g:fieldValue bean="${testTestInstance}" field="stTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testTestInstance?.tz}">
				<li class="fieldcontain">
					<span id="tz-label" class="property-label"><g:message code="testTest.tz.label" default="Tz" /></span>
					
						<span class="property-value" aria-labelledby="tz-label"><g:fieldValue bean="${testTestInstance}" field="tz"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${testTestInstance?.id}" />
					<g:link class="edit" action="edit" id="${testTestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
