
<%@ page import="com.lj.test.OneTest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'oneTest.label', default: 'OneTest')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-oneTest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-oneTest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'oneTest.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="passWord" title="${message(code: 'oneTest.passWord.label', default: 'Pass Word')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${oneTestInstanceList}" status="i" var="oneTestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${oneTestInstance.id}">${fieldValue(bean: oneTestInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: oneTestInstance, field: "passWord")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${oneTestInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
