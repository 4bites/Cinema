
<%@ page import="cinema.DdjjExhibidor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjExhibidor.label', default: 'DdjjExhibidor')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjExhibidorInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.fecha.label" default="Fecha" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ddjjExhibidorInstance?.fecha}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.file.label" default="File" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjExhibidorInstance, field: "file")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.ddjjExhibidorRegs.label" default="Ddjj Exhibidor Regs" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${ddjjExhibidorInstance.ddjjExhibidorRegs}" var="d">
                                    <li><g:link controller="ddjjExhibidorRegistry" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each> 
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.exhibidora.label" default="Exhibidora" /></td>
                            
                            <td valign="top" class="value"><g:link controller="exhibidor" action="show" id="${ddjjExhibidorInstance?.exhibidora?.id}">${ddjjExhibidorInstance?.exhibidora?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ddjjExhibidorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>