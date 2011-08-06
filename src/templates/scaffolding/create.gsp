<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="${domainClass.propertyName}.create" default="Create ${className}" /></title>
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="${domainClass.propertyName}" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="${domainClass.propertyName}.list" default="${className} List" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="${domainClass.propertyName}.create" default="Create ${className}" /></h1>
            <g:if test="\${flash.message}">
            <div class="message"><g:message code="\${flash.message}" args="\${flash.args}" default="\${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="\${${propertyName}}">
            <div class="errors">
                <g:renderErrors bean="\${${propertyName}}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true"<%= multiPart ? " enctype=\"multipart/form-data\"" : "" %>>
                <div class="dialog">
                    <table>
                        <tbody>
                        <%  excludedProps = ["version",
                                             "id","authorizationService",
                                             Events.ONLOAD_EVENT,
                                             Events.BEFORE_INSERT_EVENT,
                                             Events.BEFORE_UPDATE_EVENT,
                                             Events.BEFORE_DELETE_EVENT]
                            props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.each { p ->
                                if (!Collection.class.isAssignableFrom(p.type)) {
                                    cp = domainClass.constrainedProperties[p.name]

                                    needsPermissionList = domainClass.getPropertyOrStaticPropertyOrFieldValue('needsPermission', HashMap)
                                    needsPermission = needsPermissionList?.get(p.name)

                                    display = (cp ? cp.display : true)
                                    if (display) {
                                        if (needsPermission) {
                                            %><gsec:hasBasicPermission target="${className}.${p.name}" action="write"><%
                                        }
                                    %>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="${p.name}"><g:message code="${domainClass.propertyName}.${p.name}" default="${p.naturalName}" />:</label>
                                </td>
                                <td valign="top" class="value \${hasErrors(bean: ${propertyName}, field: '${p.name}', 'errors')}">
                                    ${renderEditor(p)}
                                </td>
                            </tr>
                        <%  
		                             	if (needsPermission) {
		                                 	%></gsec:hasBasicPermission><%
		                             	}
                             		}	
                               }   
                          } %>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                  <gsec:hasBasicPermission target="${domainClass.propertyName}" action="save">
                      <span class="button"><gti:actionSubmit name="create" class="save" action="save" messageCode="create"/></span>
                  </gsec:hasBasicPermission>
                  <gsec:hasBasicPermission target="${domainClass.propertyName}" action="saveAndRedirectToCreate">
                      <span class="button"><gti:actionSubmit name="create" class="saveAndNext" action="saveAndRedirectToCreate" messageCode="saveAndRedirectToCreate"/></span>
                  </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
