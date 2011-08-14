
<%@ page import="cinema.Complejo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="complejo.list" default="Complejo List" /></title>
    </head>
    <body>
        <div class="nav">
          <gsec:hasBasicPermission action="create" target="complejo" )>
            <span class="menuButton"><gti:link class="create" action="create"><g:message code="complejo.new" default="New Complejo" /></gti:link></span>
          </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="complejo.list" default="Complejo List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <g:render template="/shared/list" model="[domain:Complejo]" />
            </div>
        </div>
    </body>
</html>
