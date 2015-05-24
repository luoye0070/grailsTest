
<%@ page import="com.lj.test.SecondTest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secondTest.label', default: 'SecondTest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-secondTest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-secondTest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list secondTest">
			
				<g:if test="${secondTestInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="secondTest.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${secondTestInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${secondTestInstance?.ot}">
				<li class="fieldcontain">
					<span id="ot-label" class="property-label"><g:message code="secondTest.ot.label" default="Ot" /></span>
					
						<span class="property-value" aria-labelledby="ot-label"><g:link controller="oneTest" action="show" id="${secondTestInstance?.ot?.id}">${secondTestInstance?.ot?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${secondTestInstance?.ots}">
				<li class="fieldcontain">
					<span id="ots-label" class="property-label"><g:message code="secondTest.ots.label" default="Ots" /></span>
					
						<g:each in="${secondTestInstance.ots}" var="o">
						<span class="property-value" aria-labelledby="ots-label"><g:link controller="oneTestSub" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${secondTestInstance?.id}" />
					<g:link class="edit" action="edit" id="${secondTestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
