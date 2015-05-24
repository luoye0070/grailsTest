
<%@ page import="com.lj.test.StestTest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stestTest.label', default: 'StestTest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stestTest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stestTest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stestTest">
			
				<g:if test="${stestTestInstance?.iiTest}">
				<li class="fieldcontain">
					<span id="iiTest-label" class="property-label"><g:message code="stestTest.iiTest.label" default="Ii Test" /></span>
					
						<span class="property-value" aria-labelledby="iiTest-label"><g:fieldValue bean="${stestTestInstance}" field="iiTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.bTest}">
				<li class="fieldcontain">
					<span id="bTest-label" class="property-label"><g:message code="stestTest.bTest.label" default="BT est" /></span>
					
						<span class="property-value" aria-labelledby="bTest-label"><g:fieldValue bean="${stestTestInstance}" field="bTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.cTest}">
				<li class="fieldcontain">
					<span id="cTest-label" class="property-label"><g:message code="stestTest.cTest.label" default="CT est" /></span>
					
						<span class="property-value" aria-labelledby="cTest-label"><g:fieldValue bean="${stestTestInstance}" field="cTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.cc}">
				<li class="fieldcontain">
					<span id="cc-label" class="property-label"><g:message code="stestTest.cc.label" default="Cc" /></span>
					
						<span class="property-value" aria-labelledby="cc-label"><g:fieldValue bean="${stestTestInstance}" field="cc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.ddllTest}">
				<li class="fieldcontain">
					<span id="ddllTest-label" class="property-label"><g:message code="stestTest.ddllTest.label" default="Ddll Test" /></span>
					
						<span class="property-value" aria-labelledby="ddllTest-label"><g:fieldValue bean="${stestTestInstance}" field="ddllTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.dlTest}">
				<li class="fieldcontain">
					<span id="dlTest-label" class="property-label"><g:message code="stestTest.dlTest.label" default="Dl Test" /></span>
					
						<span class="property-value" aria-labelledby="dlTest-label"><g:fieldValue bean="${stestTestInstance}" field="dlTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.dtTest}">
				<li class="fieldcontain">
					<span id="dtTest-label" class="property-label"><g:message code="stestTest.dtTest.label" default="Dt Test" /></span>
					
						<span class="property-value" aria-labelledby="dtTest-label"><g:formatDate date="${stestTestInstance?.dtTest}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.ftTest}">
				<li class="fieldcontain">
					<span id="ftTest-label" class="property-label"><g:message code="stestTest.ftTest.label" default="Ft Test" /></span>
					
						<span class="property-value" aria-labelledby="ftTest-label"><g:fieldValue bean="${stestTestInstance}" field="ftTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.isGood}">
				<li class="fieldcontain">
					<span id="isGood-label" class="property-label"><g:message code="stestTest.isGood.label" default="Is Good" /></span>
					
						<span class="property-value" aria-labelledby="isGood-label"><g:formatBoolean boolean="${stestTestInstance?.isGood}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.lTest}">
				<li class="fieldcontain">
					<span id="lTest-label" class="property-label"><g:message code="stestTest.lTest.label" default="LT est" /></span>
					
						<span class="property-value" aria-labelledby="lTest-label"><g:fieldValue bean="${stestTestInstance}" field="lTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.ll}">
				<li class="fieldcontain">
					<span id="ll-label" class="property-label"><g:message code="stestTest.ll.label" default="Ll" /></span>
					
						<span class="property-value" aria-labelledby="ll-label"><g:fieldValue bean="${stestTestInstance}" field="ll"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.oneTest}">
				<li class="fieldcontain">
					<span id="oneTest-label" class="property-label"><g:message code="stestTest.oneTest.label" default="One Test" /></span>
					
						<span class="property-value" aria-labelledby="oneTest-label"><g:link controller="oneTest" action="show" id="${stestTestInstance?.oneTest?.id}">${stestTestInstance?.oneTest?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.oot}">
				<li class="fieldcontain">
					<span id="oot-label" class="property-label"><g:message code="stestTest.oot.label" default="Oot" /></span>
					
						<span class="property-value" aria-labelledby="oot-label"><g:link controller="oneOverTest" action="show" id="${stestTestInstance?.oot?.id}">${stestTestInstance?.oot?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.sTest}">
				<li class="fieldcontain">
					<span id="sTest-label" class="property-label"><g:message code="stestTest.sTest.label" default="ST est" /></span>
					
						<span class="property-value" aria-labelledby="sTest-label"><g:fieldValue bean="${stestTestInstance}" field="sTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.secondTests}">
				<li class="fieldcontain">
					<span id="secondTests-label" class="property-label"><g:message code="stestTest.secondTests.label" default="Second Tests" /></span>
					
						<g:each in="${stestTestInstance.secondTests}" var="s">
						<span class="property-value" aria-labelledby="secondTests-label"><g:link controller="secondTest" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.stTest}">
				<li class="fieldcontain">
					<span id="stTest-label" class="property-label"><g:message code="stestTest.stTest.label" default="St Test" /></span>
					
						<span class="property-value" aria-labelledby="stTest-label"><g:fieldValue bean="${stestTestInstance}" field="stTest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stestTestInstance?.tz}">
				<li class="fieldcontain">
					<span id="tz-label" class="property-label"><g:message code="stestTest.tz.label" default="Tz" /></span>
					
						<span class="property-value" aria-labelledby="tz-label"><g:fieldValue bean="${stestTestInstance}" field="tz"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stestTestInstance?.id}" />
					<g:link class="edit" action="edit" id="${stestTestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
