
<%@ page import="de.ppi.grails.gsec.GsecUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="gsecUser.create" default="Create GsecUser" /></title>
		<script>
	        $(document).ready(function() {
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
            <g:form method="get" useToken="true" name="userform">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Usuarios:</label>
                                </td>
                                <td valign="top"  width=100>
                                    <g:select id="username" name="username" from="${GsecUser.list()}" multiple="yes" optionKey="username" 
									value="${GsecUser.findAllByEnabled(false)}" size=50/> 
                                </td><td valign="top" width="400" align="left">Los seleccionados están inactivos. Seleccione/des-seleccione para inactivar/activar</td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                      <span class="button"><g:actionSubmit name="create" class="save" action="update_status" value="Guardar"/></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
