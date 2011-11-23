
<%@ page import="cinema.Complejo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="complejo.show" default="Show Complejo" /></title>
		<g:set var="entityName" value="${message(code: 'complejo.label', default: 'Complejo')}" />	
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complejo.codigo" default="Codigo" />:</td>
                            
                            <td valign="top" class="value">${complejoInstance?.codigo}</td>
                            
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
                                      <li><gti:link controller="sala" action="show" id="${salaInstance.id}">${salaInstance}</gti:link></li>
                                </gsec:hasBasicPermission>
                                <gsec:hasNot>
                                    <li>${salaInstance}</li>
                                </gsec:hasNot>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                      
                    </tbody>
                </table>
            </div>
			<div class="buttons">
	            <g:form>
    	            <g:hiddenField name="id" value="${complejoInstance?.id}" />
        	        <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
            	    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
	            </g:form>
<!--
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
-->
        </div>
    </body>
</html>
