
<%@ page import="de.ppi.grails.gsec.GsecUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="gsecUser.edit" default="Edit GsecUser" /></title>
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="gsecUser" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="gsecUser.list" default="GsecUser List" /></gti:link></span>
            </gsec:hasBasicPermission>
            <gsec:hasBasicPermission target="gsecUser" action="create">
              <span class="menuButton"><gti:link class="create" action="create"><g:message code="gsecUser.new" default="New GsecUser" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="gsecUser.edit" default="Edit GsecUser" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${gsecUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${gsecUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true" >
                <g:hiddenField name="id" value="${gsecUserInstance?.id}" />
                <g:hiddenField name="version" value="${gsecUserInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="gsecUser.username" default="Username" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'username', 'errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:gsecUserInstance,field:'username')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="gsecUser.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'name', 'errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:gsecUserInstance,field:'name')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstname"><g:message code="gsecUser.firstname" default="Firstname" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'firstname', 'errors')}">
                                    <input type="text" id="firstname" name="firstname" value="${fieldValue(bean:gsecUserInstance,field:'firstname')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailAdress"><g:message code="gsecUser.emailAdress" default="Email Adress" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'emailAdress', 'errors')}">
                                    <input type="text" id="emailAdress" name="emailAdress" value="${fieldValue(bean:gsecUserInstance,field:'emailAdress')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="loginFailedCount"><g:message code="gsecUser.loginFailedCount" default="Login Failed Count" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'loginFailedCount', 'errors')}">
                                    <input type="text" id="loginFailedCount" name="loginFailedCount" value="${fieldValue(bean:gsecUserInstance,field:'loginFailedCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="gsecUser.enabled" default="Enabled" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${gsecUserInstance?.enabled}" ></g:checkBox>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="gsecUser.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'description', 'errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:gsecUserInstance,field:'description')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="expiredDate"><g:message code="gsecUser.expiredDate" default="Expired Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'expiredDate', 'errors')}">
                                    expiredDate: no rendering defined in renderEditor.template
                                </td>
                            </tr>
                        <gsec:hasBasicPermission target="GsecUser.passwordHash" action="write">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordHash"><g:message code="gsecUser.passwordHash" default="Password Hash" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'passwordHash', 'errors')}">
                                    <input type="text" id="passwordHash" name="passwordHash" value="${fieldValue(bean:gsecUserInstance,field:'passwordHash')}"/>
                                </td>
                            </tr>
                        </gsec:hasBasicPermission>
                         <gsec:hasNot>
	                         <gsec:hasBasicPermission target="GsecUser.passwordHash" action="read">
		                         <tr class="prop">
		                            <td valign="top" class="name"><g:message code="gsecUser.passwordHash" default="Password Hash" />:</td>
		                            
		                            <td valign="top" class="value">${fieldValue(bean: gsecUserInstance, field: "passwordHash")}</td>
		                            
		                         </tr>
	                         </gsec:hasBasicPermission>
                         </gsec:hasNot>
                         
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="gsecUser.password" default="Password" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'password', 'errors')}">
                                    <input type="text" maxlength="128" id="password" name="password" value="${fieldValue(bean:gsecUserInstance,field:'password')}"/>
                                </td>
                            </tr>
                        <gsec:hasBasicPermission target="GsecUser.permissions" action="write">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="permissions"><g:message code="gsecUser.permissions" default="Permissions" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'permissions', 'errors')}">
                                    <g:hiddenField name="mtm_[permissions]" value="permissions" />
<g:select name="permissions"
from="${de.ppi.grails.gsec.GsecPermission.list()?.sort()}"
size="5" multiple="yes" optionKey="id" 
value="${gsecUserInstance?.permissions}" />

                                </td>
                            </tr>
                        </gsec:hasBasicPermission>
                         <gsec:hasNot>
	                         <gsec:hasBasicPermission target="GsecUser.permissions" action="read">
		                         <tr class="prop">
		                            <td valign="top" class="name"><g:message code="gsecUser.permissions" default="Permissions" />:</td>
		                            
		                            <td  valign="top" style="text-align: left;" class="value">
		                                <ul>
		                                <g:each in="${gsecUserInstance?.permissions.sort()}" var="gsecPermissionInstance">
		                                <gsec:hasBasicPermission target="gsecPermission" action="show">
		                                      <li><gti:link controller="gsecPermission" action="show" id="${gsecPermissionInstance.id}">${gsecPermissionInstance.encodeAsHTML()}</gti:link></li>
		                                </gsec:hasBasicPermission>
		                                <gsec:hasNot>
		                                    <li>${gsecPermissionInstance.encodeAsHTML()}</li>
		                                </gsec:hasNot>
		                                </g:each>
		                                </ul>
		                            </td>
		                            
		                         </tr>
	                         </gsec:hasBasicPermission>
                         </gsec:hasNot>
                         
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="roles"><g:message code="gsecUser.roles" default="Roles" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'roles', 'errors')}">
                                    <g:hiddenField name="mtm_[roles]" value="roles" />
<g:select name="roles"
from="${de.ppi.grails.gsec.GsecRole.list()?.sort()}"
size="5" multiple="yes" optionKey="id"
value="${gsecUserInstance?.roles}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                  <gsec:hasBasicPermission target="gsecUser" action="update">
                      <span class="button"><gti:actionSubmit class="save" action="update" messageCode="update"/></span>
                    </gsec:hasBasicPermission>
                    <gsec:hasBasicPermission target="gsecUser" action="delete">
                      <span class="button"><gti:actionSubmit class="delete" action="delete" messageCode="delete" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                    </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
