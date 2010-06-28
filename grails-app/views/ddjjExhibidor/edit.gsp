
<%@ page import="cinema.DdjjExhibidor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjExhibidor.label', default: 'DdjjExhibidor')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ddjjExhibidorInstance}">
            <div class="errors">
                <g:renderErrors bean="${ddjjExhibidorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ddjjExhibidorInstance?.id}" />
                <g:hiddenField name="version" value="${ddjjExhibidorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="ddjjExhibidor.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${ddjjExhibidorInstance?.fecha}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="file"><g:message code="ddjjExhibidor.file.label" default="File" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'file', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ddjjExhibidorRegs"><g:message code="ddjjExhibidor.ddjjExhibidorRegs.label" default="Ddjj Exhibidor Regs" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'ddjjExhibidorRegs', 'errors')}">
                                    
<ul>
<g:each in="${ddjjExhibidorInstance?.ddjjExhibidorRegs?}" var="d">
    <li><g:link controller="ddjjExhibidorRegistry" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="ddjjExhibidorRegistry" action="create" params="['ddjjExhibidor.id': ddjjExhibidorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ddjjExhibidorRegistry.label', default: 'DdjjExhibidorRegistry')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="exhibidora"><g:message code="ddjjExhibidor.exhibidora.label" default="Exhibidora" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'exhibidora', 'errors')}">
                                    <g:select name="exhibidora.id" from="${cinema.Exhibidor.list()}" optionKey="id" value="${ddjjExhibidorInstance?.exhibidora?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
