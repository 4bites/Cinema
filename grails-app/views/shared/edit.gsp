
<%@ page import="de.ppi.grails.gsec.GsecRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="gsecRole.edit" default="Edit GsecRole" /></title>
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="gsecRole" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="gsecRole.list" default="GsecRole List" /></gti:link></span>
            </gsec:hasBasicPermission>
            <gsec:hasBasicPermission target="gsecRole" action="create">
              <span class="menuButton"><gti:link class="create" action="create"><g:message code="gsecRole.new" default="New GsecRole" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="gsecRole.edit" default="Edit GsecRole" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${gsecRoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${gsecRoleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true" >
                <g:hiddenField name="id" value="${gsecRoleInstance?.id}" />
                <g:hiddenField name="version" value="${gsecRoleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="gsecRole.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecRoleInstance, field: 'name', 'errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:gsecRoleInstance,field:'name')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="permissions"><g:message code="gsecRole.permissions" default="Permissions" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecRoleInstance, field: 'permissions', 'errors')}">
                                    <g:hiddenField name="mtm_[permissions]" value="permissions" />

<g:select name="permissions"
from="${de.ppi.grails.gsec.GsecPermission.list()?.sort()}"
size="5" multiple="yes" optionKey="id" 
value="${gsecRoleInstance?.permissions}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="users"><g:message code="gsecRole.users" default="Users" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecRoleInstance, field: 'users', 'errors')}">
                                    
<ul>
<g:each in="${gsecRoleInstance?.users.sort()}" var="gsecUserInstance">
	<gsec:hasBasicPermission target="gsecUser" action="show">
        <li><gti:link controller="gsecUser" action="show" id="${gsecUserInstance.id}">${gsecUserInstance?.encodeAsHTML()}</gti:link></li>
	</gsec:hasBasicPermission>
	<gsec:hasNot>
        <li>${gsecUserInstance?.encodeAsHTML()}</li>
	</gsec:hasNot>
</g:each>
</ul>
<gsec:hasBasicPermission target="gsecUser" action="create">
    <gti:link controller="gsecUser" params="['gsecRole.id': gsecRoleInstance?.id]" action="create"><g:message code="gsecUser.new" default="New GsecUser" /></gti:link>
</gsec:hasBasicPermission>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                  <gsec:hasBasicPermission target="gsecRole" action="update">
                      <span class="button"><gti:actionSubmit class="save" action="update" messageCode="update"/></span>
                    </gsec:hasBasicPermission>
                    <gsec:hasBasicPermission target="gsecRole" action="delete">
                      <span class="button"><gti:actionSubmit class="delete" action="delete" messageCode="delete" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                    </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
