
<%@ page import="de.ppi.grails.gsec.GsecUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="gsecUser.create" default="Create GsecUser" /></title>
        <g:javascript library="jquery/jquery.password_strength" />
        <style>
			.password_strength {
				padding: 0 5px;
				display: inline-block;
			}
			.password_strength_1 {
				background-color: #fcb6b1;
			}
			.password_strength_2 {
				background-color: #fccab1;
			}
			.password_strength_3 {
				background-color: #fcfbb1;
			}	
			.password_strength_4 {
				background-color: #dafcb1;
			}		
			.password_strength_5 {
				background-color: #bcfcb1;
			}

		</style>
		<script>
	        $(document).ready(function() {
				$('#password').password_strength();

				$('#userform').submit(function(e) {
   			 		if ($(this).find('.password_strength_1').size() != 0) {
			        	e.preventDefault();
        				alert('La clave es demasiado debil!');
    				}else if ($(this).find('.password_strength_2').size() != 0) {
                        e.preventDefault();
                        alert('La clave es debil!');
					}
 				});
			});  
		</script>	
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="gsecUser" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="gsecUser.list" default="GsecUser List" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="gsecUser.create" default="Create GsecUser" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${gsecUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${gsecUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true" name="userform">
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
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="gsecUser.password" default="Password" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gsecUserInstance, field: 'password', 'errors')}">
                                    <input type="text" maxlength="128" id="password" name="password" value="${fieldValue(bean:gsecUserInstance,field:'password')}"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                  <gsec:hasBasicPermission target="gsecUser" action="save">
                      <span class="button"><gti:actionSubmit name="create" class="save" action="save" messageCode="create"/></span>
                  </gsec:hasBasicPermission>
                  <gsec:hasBasicPermission target="gsecUser" action="saveAndRedirectToCreate">
                      <span class="button"><gti:actionSubmit name="create" class="saveAndNext" action="saveAndRedirectToCreate" messageCode="saveAndRedirectToCreate"/></span>
                  </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
