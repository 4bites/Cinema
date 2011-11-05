<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
		<style type="text/css" media="screen">

			#nav {
				margin-top:20px;
				margin-left:30px;
				width:228px;
				float:left;

			}
			.homePagePanel * {
				margin:0px;
			}
			.homePagePanel .panelBody ul {
				list-style-type:none;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody h1 {
				text-transform:uppercase;
				font-size:1.1em;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody {
			    background: url(images/leftnav_midstretch.png) repeat-y top;
				margin:0px;
				padding:15px;
			}
			.homePagePanel .panelBtm {
			    background: url(images/leftnav_btm.png) no-repeat top;
				height:20px;
				margin:0px;
			}

			.homePagePanel .panelTop {
			    background: url(images/leftnav_top.png) no-repeat top;
				height:11px;
				margin:0px;
			}
			h2 {
				margin-top:15px;
				margin-bottom:15px;
				font-size:1.2em;
			}
			#pageBody {
				margin-left:280px;
				margin-right:20px;
			}
		</style>
    </head>
    <body>
		<gsec:isNotLoggedIn>
		</gsec:isNotLoggedIn>
		<gsec:isLoggedIn>
		<div id="pageBody">
<!--	        <h1>Bienvenidos a nuestra aplicacion!</h1>
	        <p>Vamos gente que se puede!! tiene pagina de home la aplicacion? no tenemos definido eso en ningun lado.
	           Me parece que algo deberiamos tener</p>

	        <div id="controllerList" class="dialog">
	            <ul>
	            </ul>
	        </div>
-->
		</div>
		</gsec:isLoggedIn>
    </body>
</html>
