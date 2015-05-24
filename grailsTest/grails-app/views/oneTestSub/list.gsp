
<%@ page import="com.lj.test.OneTestSub" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'oneTestSub.label', default: 'OneTestSub')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-oneTestSub" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-oneTestSub" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'oneTestSub.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="passWord" title="${message(code: 'oneTestSub.passWord.label', default: 'Pass Word')}" />
					
						<g:sortableColumn property="test" title="${message(code: 'oneTestSub.test.label', default: 'Test')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${oneTestSubInstanceList}" status="i" var="oneTestSubInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${oneTestSubInstance.id}">${fieldValue(bean: oneTestSubInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: oneTestSubInstance, field: "passWord")}</td>
					
						<td>${fieldValue(bean: oneTestSubInstance, field: "test")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${oneTestSubInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
