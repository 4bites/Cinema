<html>
    <head>
    	<nav:resources/>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <gui:resources components="menu"/>
    </head>
    <body class="yui-skin-sam">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
        
		<!-- <div id="menu">
			<nav:render group="menu"/>
			<nav:renderSubItems group="menu" actionMatch="true"/>
    	</div>-->
    	<div>
    	<gui:menubar renderTo="div">
    <gui:submenu label='Persona Fisica'>
        <gui:menuitem url='/Cinema/personaFisica/create'>Alta</gui:menuitem>
        <gui:menuitem url='/Cinema/personaFisica/list'>Listar</gui:menuitem>
    </gui:submenu>
    <gui:submenu label='Persona Juridica'>
        <gui:menuitem url='/Cinema/personaJuridica/create'>Alta</gui:menuitem>
        <gui:menuitem url='/Cinema/personaJuridica/list'>Listar</gui:menuitem>
    </gui:submenu>
    <gui:submenu label='Empresa'>
    	<gui:submenu label='Exhibidor'>
	        <gui:menuitem url='/Cinema/exhibidor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='/Cinema/exhibidor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Productor'>
	        <gui:menuitem url='/Cinema/productor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='/Cinema/productor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Distribuidor'>
	        <gui:menuitem url='/Cinema/distribuidor/create'>Alta</gui:menuitem>
	        <gui:menuitem url='/Cinema/distribuidor/list'>Listar</gui:menuitem>
	    </gui:submenu>
    	<gui:submenu label='Video Club'>
	        <gui:menuitem url='/Cinema/videoClub/create'>Alta</gui:menuitem>
	        <gui:menuitem url='/Cinema/videoClub/list'>Listar</gui:menuitem>
	    </gui:submenu>
    </gui:submenu>
   	<gui:submenu label='Sala'>
        <gui:menuitem url='/Cinema/sala/create'>Alta</gui:menuitem>
        <gui:menuitem url='/Cinema/sala/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Complejo'>
        <gui:menuitem url='/Cinema/complejo/create'>Alta</gui:menuitem>
        <gui:menuitem url='/Cinema/complejo/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Local de video'>
        <gui:menuitem url='/Cinema/video/create'>Alta</gui:menuitem>
        <gui:menuitem url='/Cinema/video/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Pelicula'>
        <gui:menuitem url='/Cinema/pelicula/create'>Alta</gui:menuitem>
        <gui:menuitem url='/Cinema/pelicula/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='DDJJ'>
        <gui:menuitem url='/Cinema/ddjjVideo/create'>Video Club</gui:menuitem>
        <gui:menuitem url='/Cinema/ddjjExhibidor/create'>Exhibidor</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='BOC'>
        <gui:menuitem url='/Cinema/boc/create'>Ingreso/Egreso</gui:menuitem>
    </gui:submenu>
    
</gui:menubar>
</div>
		<g:layoutBody />
    </body>
</html>