
<%@ page import="cinema.Complejo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="complejo.show" default="Show Complejo" /></title>
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="complejo" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="complejo.list" default="Complejo List" /></gti:link></span>
            </gsec:hasBasicPermission>
            <gsec:hasBasicPermission target="complejo" action="create">
              <span class="menuButton"><gti:link class="create" action="create"><g:message code="complejo.new" default="New Complejo" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="complejo.show" default="Show Complejo" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complejo.id" default="Id" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complejoInstance, field: "id")}</td>
                            
                        </tr>
                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complejo.codigo" default="Codigo" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complejoInstance, field: "codigo")}</td>
                            
                        </tr>
                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complejo.denominacion" default="Denominacion" />:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complejoInstance, field: "denominacion")}</td>
                            
                        </tr>
                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complejo.fechaApertura" default="Fecha Apertura" />:</td>
                            
                            <td valign="top" class="value"><g:formatDate date="${complejoInstance?.fechaApertura}" /></td>
                            
                        </tr>
                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complejo.salas" default="Salas" />:</td>
                            
                            <td  valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${complejoInstance?.salas.sort()}" var="salaInstance">
                                <gsec:hasBasicPermission target="sala" action="show">
                                      <li><gti:link controller="sala" action="show" id="${salaInstance.id}">${salaInstance.encodeAsHTML()}</gti:link></li>
                                </gsec:hasBasicPermission>
                                <gsec:hasNot>
                                    <li>${salaInstance.encodeAsHTML()}</li>
                                </gsec:hasNot>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                      
                    </tbody>
                </table>
            </div>
            <g:form useToken="true">
                <g:hiddenField name="id" value="${complejoInstance?.id}" />
                <div class="buttons">
                  <gsec:hasBasicPermission target="complejo" action="edit">
                    <span class="button"><gti:actionSubmit class="edit" action="edit" messageCode="edit" /></span>
                  </gsec:hasBasicPermission>
                  <gsec:hasBasicPermission target="complejo" action="delete">
                    <span class="button"><gti:actionSubmit class="delete" action="delete" messageCode="delete" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                  </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
