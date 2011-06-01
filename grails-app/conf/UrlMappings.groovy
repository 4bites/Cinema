class UrlMappings {
    static mappings = {
		name empresa: "/empresas/$dom/$action"(controller:"empresa")

    	"/$controller/$action?/$id?"{
	    	constraints {
			 // apply constraints here
		  	}
	  	}

      	"/"(view:"/index")
	  	"500"(view:'/error')
	}
}
