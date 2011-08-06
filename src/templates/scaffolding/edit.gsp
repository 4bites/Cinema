<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="${domainClass.propertyName}.edit" default="Edit ${className}" /></title>
    </head>
    <body>
        <div class="nav">
            <gsec:hasBasicPermission target="${domainClass.propertyName}" action="list">
              <span class="menuButton"><gti:link class="list" action="list"><g:message code="${domainClass.propertyName}.list" default="${className} List" /></gti:link></span>
            </gsec:hasBasicPermission>
            <gsec:hasBasicPermission target="${domainClass.propertyName}" action="create">
              <span class="menuButton"><gti:link class="create" action="create"><g:message code="${domainClass.propertyName}.new" default="New ${className}" /></gti:link></span>
            </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="${domainClass.propertyName}.edit" default="Edit ${className}" /></h1>
            <g:if test="\${flash.message}">
            <div class="message"><g:message code="\${flash.message}" args="\${flash.args}" default="\${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="\${${propertyName}}">
            <div class="errors">
                <g:renderErrors bean="\${${propertyName}}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" useToken="true" <%= multiPart ? " enctype=\"multipart/form-data\"" : "" %>>
                <g:hiddenField name="id" value="\${${propertyName}?.id}" />
                <g:hiddenField name="version" value="\${${propertyName}?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        <%  excludedProps = ["version",
                                             "id", "authorizationService",
                                             Events.ONLOAD_EVENT,
                                             Events.BEFORE_INSERT_EVENT,
                                             Events.BEFORE_UPDATE_EVENT,
                                             Events.BEFORE_DELETE_EVENT]
                            props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.each { p ->
                                cp = domainClass.constrainedProperties[p.name]
                                display = (cp ? cp.display : true)

                                needsPermissionList = domainClass.getPropertyOrStaticPropertyOrFieldValue('needsPermission', HashMap)
                                needsPermission = needsPermissionList?.get(p.name)

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
                                		%></gsec:hasBasicPermission>
                         <gsec:hasNot>
	                         <gsec:hasBasicPermission target="${className}.${p.name}" action="read">
		                         <tr class="prop">
		                            <td valign="top" class="name"><g:message code="${domainClass.propertyName}.${p.name}" default="${p.naturalName}" />:</td>
		                            <%  if (p.isEnum()) { %>
		                            <td valign="top" class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</td>
		                            <%  } else if (p.oneToMany || p.manyToMany) { %>
		                            <td  valign="top" style="text-align: left;" class="value">
		                                <ul>
		                                <g:each in="\${${propertyName}?.${p.name}.sort()}" var="${p.referencedDomainClass?.propertyName}Instance">
		                                <gsec:hasBasicPermission target="${p.referencedDomainClass?.propertyName}" action="show">
		                                      <li><gti:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.referencedDomainClass?.propertyName}Instance.id}">\${${p.referencedDomainClass?.propertyName}Instance.encodeAsHTML()}</gti:link></li>
		                                </gsec:hasBasicPermission>
		                                <gsec:hasNot>
		                                    <li>\${${p.referencedDomainClass?.propertyName}Instance.encodeAsHTML()}</li>
		                                </gsec:hasNot>
		                                </g:each>
		                                </ul>
		                            </td>
		                            <%  } else if (p.manyToOne || p.oneToOne) { %>
		                            <td valign="top" class="value">
		                            <gsec:hasBasicPermission target="${p.referencedDomainClass?.propertyName}" action="show">
		                              <gti:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</gti:link>
		                            </gsec:hasBasicPermission>
		                            <gsec:hasNot>
		                              \${${propertyName}?.${p.name}?.encodeAsHTML()}
		                            </gsec:hasNot>
		                            </td>
		                            <%  } else if (p.type == Boolean.class || p.type == boolean.class) { %>
		                            <td valign="top" class="value"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></td>
		                            <%  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
		                            <td valign="top" class="value"><g:formatDate date="\${${propertyName}?.${p.name}}" /></td>
		                            <%  } else { %>
		                            <td valign="top" class="value">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
		                            <%  } %>
		                         </tr>
	                         </gsec:hasBasicPermission>
                         </gsec:hasNot>
                         <%
                            		}
                                }    
                             } %>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                  <gsec:hasBasicPermission target="${domainClass.propertyName}" action="update">
                      <span class="button"><gti:actionSubmit class="save" action="update" messageCode="update"/></span>
                    </gsec:hasBasicPermission>
                    <gsec:hasBasicPermission target="${domainClass.propertyName}" action="delete">
                      <span class="button"><gti:actionSubmit class="delete" action="delete" messageCode="delete" onclick="return confirm('\${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                    </gsec:hasBasicPermission>
                </div>
            </g:form>
        </div>
    </body>
</html>
