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
		<jqDT:resources/>
		<g:javascript library="jquery/jquery.dataTables.columnFilter" />
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
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/Exhibidor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/Exhibidor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Productor'>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/Productor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/Productor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Distribuidor'>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/Distribuidor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/Distribuidor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Video Club'>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/VideoClub/create'>Alta</gui:menuitem>
	        <gui:menuitem url='${webRequest.getContextPath()}/empresas/VideoClub/list'>Listar</gui:menuitem>
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
        <gui:menuitem url='${webRequest.getContextPath()}/local/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/local/list'>Listar</gui:menuitem>
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
		<gui:submenu label='BOC Ingreso'>
	        <gui:menuitem url='${webRequest.getContextPath()}/bocIngreso/create'>Alta</gui:menuitem>
			<gui:menuitem url='${webRequest.getContextPath()}/bocIngreso/list'>Listar</gui:menuitem>
		</gui:submenu>
       <gui:submenu label='BOC Egreso'>
            <gui:menuitem url='${webRequest.getContextPath()}/bocEgreso/create'>Alta</gui:menuitem>
            <gui:menuitem url='${webRequest.getContextPath()}/bocEgreso/list'>Listar</gui:menuitem>
        </gui:submenu>
    </gui:submenu>
    
</gui:menubar>
</div>
		<g:layoutBody />
    </body>
</html>
