<html>
    <head>
    	<nav:resources/>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources />
        <g:layoutHead />
        <g:javascript library="application" />
        <gui:resources components="menu"/>
    </head>
    <body class="yui-skin-sam">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
        
    	<div>
    	<gui:menubar renderTo="div">
    <gui:submenu label='Persona Fisica'>
        <gui:menuitem url='${webRequest.getContextPath()}/personaFisica/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/personaFisica/list'>Listar</gui:menuitem>
    </gui:submenu>
    <gui:submenu label='Persona Juridica'>
        <gui:menuitem url='${webRequest.getContextPath()}/personaJuridica/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/personaJuridica/list'>Listar</gui:menuitem>
    </gui:submenu>
    <gui:submenu label='Empresa'>
    	<gui:submenu label='Exhibidor'>
	        <gui:menuitem url='${webRequest.getContextPath()}/exhibidor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/exhibidor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Productor'>
	        <gui:menuitem url='${webRequest.getContextPath()}/productor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/productor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Distribuidor'>
	        <gui:menuitem url='${webRequest.getContextPath()}/distribuidor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/distribuidor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Video Club'>
	        <gui:menuitem url='${webRequest.getContextPath()}/videoClub/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/videoClub/list'>Listar</gui:menuitem>
	    </gui:submenu>
    </gui:submenu>
   	<gui:submenu label='Sala'>
        <gui:menuitem url='${webRequest.getContextPath()}/sala/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/sala/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Complejo'>
        <gui:menuitem url='${webRequest.getContextPath()}/complejo/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/complejo/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Local de video'>
        <gui:menuitem url='${webRequest.getContextPath()}/video/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/video/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Pelicula'>
        <gui:menuitem url='${webRequest.getContextPath()}/pelicula/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/pelicula/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='DDJJ'>
        <gui:menuitem url='${webRequest.getContextPath()}/ddjjVideo/create'>Video Club</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/ddjjExhibidor/create'>Exhibidor</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='BOC'>
        <gui:menuitem url='${webRequest.getContextPath()}/boc/create'>Ingreso/Egreso</gui:menuitem>
    </gui:submenu>
    
</gui:menubar>
</div>
		<g:layoutBody />
    </body>
</html>
