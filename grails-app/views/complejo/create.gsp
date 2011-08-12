
<%@ page import="cinema.Complejo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="complejo.create" default="Create Complejo" /></title>
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="complejo" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="complejo.list" default="Complejo List" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="complejo.create" default="Create Complejo" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${complejoInstance}">
            <div class="errors">
                <g:renderErrors bean="${complejoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="complejo.codigo" default="Codigo" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complejoInstance, field: 'codigo', 'errors')}">
                                    <input type="text" id="codigo" name="codigo" value="${fieldValue(bean:complejoInstance,field:'codigo')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="denominacion"><g:message code="complejo.denominacion" default="Denominacion" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complejoInstance, field: 'denominacion', 'errors')}">
                                    <input type="text" id="denominacion" name="denominacion" value="${fieldValue(bean:complejoInstance,field:'denominacion')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaApertura"><g:message code="complejo.fechaApertura" default="Fecha Apertura" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complejoInstance, field: 'fechaApertura', 'errors')}">
                                    <g:datePicker name="fechaApertura" value="${complejoInstance?.fechaApertura}" precision="minute" ></g:datePicker>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                  <gsec:hasBasicPermission target="complejo" action="save">
                      <span class="button"><gti:actionSubmit name="create" class="save" action="save" messageCode="create"/></span>
                  </gsec:hasBasicPermission>
                  <gsec:hasBasicPermission target="complejo" action="saveAndRedirectToCreate">
                      <span class="button"><gti:actionSubmit name="create" class="saveAndNext" action="saveAndRedirectToCreate" messageCode="saveAndRedirectToCreate"/></span>
                  </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
