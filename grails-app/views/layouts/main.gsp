<html>
    <head>
    	<nav:resources/>
        <title><g:layoutTitle default="4Bites" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'demo_table_filters.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<g:javascript library="jquery" plugin="jquery"/>
		<g:javascript library="jquery/jquery.ui.datepicker-es" />
		<jqui:resources />
        <g:layoutHead />
        <g:javascript library="application" />
        <gui:resources components="menu"/>
		<jqDT:resources/>
		<g:javascript library="jquery/jquery.dataTables.columnFilter" />
		<g:javascript library="jquery/jquery.dataTables.tableTools" />
    </head>
    <body class="yui-skin-sam">

        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo">
			<table style="border-width:0px">
			<tr class="prop"><td>
			<img src="${resource(dir:'images',file:'4bites.png')}" alt="4Bites INCAA" />
				</td><td align="right">
			<gsec:isLoggedIn>
				<span style="margin-left:auto;margin-right:0px">Usuario:<gsec:user /> | <a href="${createLink(controller:'auth', action:'signOut')}">Logout</a></span>
			</gsec:isLoggedIn>	
			</td></tr></table>
		</div>
        
    	<div>
		<gsec:isLoggedIn>
    	<gui:menubar renderTo="div">
    
	<gui:menuitem url='${webRequest.getContextPath()}/'>Home</gui:menuitem>

    
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
		<gui:menuitem url='${webRequest.getContextPath()}/empresas/empresa/controlPagosList'>Control de Pagos</gui:menuitem>
		<gui:menuitem url='${webRequest.getContextPath()}/empresas/empresa/revalidasList'>Vencimientos de Revalidas</gui:menuitem>
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
		<gui:submenu label="Video Club">	
	        <gui:menuitem url='${webRequest.getContextPath()}/ddjjVideo/create'>Alta</gui:menuitem>
			<gui:menuitem url='${webRequest.getContextPath()}/ddjjVideo/list'>Listar</gui:menuitem>	
		</gui:submenu>
		<gui:submenu label="Exhibidor">
	        <gui:menuitem url='${webRequest.getContextPath()}/ddjjExhibidor/create'>Alta</gui:menuitem>
			<gui:menuitem url='${webRequest.getContextPath()}/ddjjExhibidor/list'>Listar</gui:menuitem>
		</gui:submenu>
    </gui:submenu>
   	<gui:submenu label='BOC'>
         <gui:menuitem url='${webRequest.getContextPath()}/boc/create'>Movimientos</gui:menuitem>
         <gui:menuitem url='${webRequest.getContextPath()}/boc/list'>Listar</gui:menuitem>
    </gui:submenu>
   	<gui:submenu label='Pagos AFIP'> 
		<gui:menuitem url='${webRequest.getContextPath()}/pago/create'>Alta</gui:menuitem>
        <gui:menuitem url='${webRequest.getContextPath()}/pago/list'>Listar</gui:menuitem>
	</gui:submenu>
	<gsec:isLoggedIn>
         <gui:submenu label="${session.gsecUsername}" >
			<gsec:hasRole name="Administrator" >
				<gui:submenu label='Usuarios'>
	            	<gui:menuitem url="${createLink(controller:'gsecUser', action:'create')}" >Alta</gui:menuitem>
    	            <gui:menuitem url="${createLink(controller:'gsecUser', action:'list')}" >Listar</gui:menuitem>
				</gui:submenu>
				<gui:submenu label='Roles'>
                    <gui:menuitem url="${createLink(controller:'gsecRole', action:'create')}" >Alta</gui:menuitem>
                    <gui:menuitem url="${createLink(controller:'gsecRole', action:'list')}" >Listar</gui:menuitem>
                </gui:submenu>
				<gui:submenu label='Permisos'>
                    <gui:menuitem url="${createLink(controller:'gsecPermission', action:'create')}" >Alta</gui:menuitem>
                    <gui:menuitem url="${createLink(controller:'gsecPermission', action:'list')}" >Listar</gui:menuitem>
                </gui:submenu>
				<gui:menuitem url="${createLink(controller:'auditLogEvent', action:'list')}">Logs</gui:menuitem>
            </gsec:hasRole>

			<gui:menuitem url="${createLink(controller:'auth', action:'signOut')}">Logout</gui:menuitem>
		</gui:submenu>	
    </gsec:isLoggedIn>
	<gsec:isNotLoggedIn>
		<gui:menuitem url="${createLink(controller:'auth', action:'login')}" >Login</gui:menuitem>
	</gsec:isNotLoggedIn>
</gui:menubar>
</gsec:isLoggedIn>
</div>
		<g:layoutBody />
    </body>
</html>
