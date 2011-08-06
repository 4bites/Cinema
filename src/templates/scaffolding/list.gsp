<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="${domainClass.propertyName}.list" default="${className} List" /></title>
    </head>
    <body>
        <div class="nav">
          <gsec:hasBasicPermission action="create" target="${domainClass.propertyName}" )>
            <span class="menuButton"><gti:link class="create" action="create"><g:message code="${domainClass.propertyName}.new" default="New ${className}" /></gti:link></span>
          </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="${domainClass.propertyName}.list" default="${className} List" /></h1>
            <g:if test="\${flash.message}">
            <div class="message"><g:message code="\${flash.message}" args="\${flash.args}" default="\${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        <%  excludedProps = ["version", "authorizationService",
                                             Events.ONLOAD_EVENT,
                                             Events.BEFORE_INSERT_EVENT,
                                             Events.BEFORE_UPDATE_EVENT,
                                             Events.BEFORE_DELETE_EVENT]
                            props = domainClass.properties.findAll { !excludedProps.contains(it.name) && it.type != Set.class }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))

                            needsPermissionList = domainClass.getPropertyOrStaticPropertyOrFieldValue('needsPermission', HashMap)

                            props.eachWithIndex { p, i ->
                             if (i < 8) {
                                 needsPermission = needsPermissionList?.get(p.name)
                                 if (needsPermission) {
                                     %><gsec:hasBasicPermission target="${className}.${p.name}" action="read"><%
                                 }
                                 if (p.isAssociation()) { %>
                         <th><g:message code="${domainClass.propertyName}.${p.name}" default="${p.naturalName}" /></th>
                         <%      } else { %>
                         <g:sortableColumn property="${p.name}" title="${p.naturalName}" titleKey="${domainClass.propertyName}.${p.name}" />
                        <%  }
                           if (needsPermission) {
                               %></gsec:hasBasicPermission><%
                           }
                           }   } %>
                        <th><g:message code="action"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                        <tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
                        <%  props.eachWithIndex { p, i ->
                                if (i == 0) { %>
                            <td><gti:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</gti:link></td>
                        <%      } else if (i < 8) {
                            needsPermission = needsPermissionList?.get(p.name)
                            if (needsPermission) {
                                %><gsec:hasBasicPermission target="${className}.${p.name}" action="read"><%
                            }
                                    if (p.type == Boolean.class || p.type == boolean.class) { %>
                            <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                        <%          } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                            <td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                        <%          } else { %>
                            <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                        <%  }
                           if (needsPermission) {
                               %></gsec:hasBasicPermission><%
                           }
                           }   } %>
                           <td>
                             <gsec:hasBasicPermission target="${domainClass.propertyName}" action="show">
                                <gti:link action="show" id="\${${propertyName}.id}"><img src="\${resource(dir:'images/skin',file:'magnifier_left.png')}" /></gti:link>
                            </gsec:hasBasicPermission>
                            <gsec:hasBasicPermission target="${domainClass.propertyName}" action="edit">
                                <gti:link action="edit" id="\${${propertyName}.id}"><img src="\${resource(dir:'images/skin',file:'pencil.png')}" /></gti:link>
                            </gsec:hasBasicPermission>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="\${${propertyName}Total}" />
            </div>
        </div>
    </body>
</html>
