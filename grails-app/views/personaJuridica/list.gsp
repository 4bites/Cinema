
<%@ page import="cinema.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
            <g:render template="/js/prov-loc.js"/>

		</script>
    </head>
    <body>
        <div class="nav">
            <!--  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span> -->
            <span class="menuButton"><g:link class="create" action="create">Crear Persona Juridica</g:link></span>
        </div>
        <div class="body">
            <h1>Listado de Personas Juridicas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
				<g:render model="['domain':PersonaJuridica]" template="/shared/list" />
            </div>
        </div>
    </body>
</html>
