import org.codehaus.groovy.grails.commons.ApplicationHolder
class UrlMappings {
    static mappings = {
		name empresa: "/empresas/$dom/$action/$id?"(controller:"empresa")

    	"/$controller/$action?/$id?"{
	    	constraints {
			 // apply constraints here
		  	}
	  	}

      	"/"(controller:"home", view:"/index")
	  	"500"(view:'/error')

	}

	
}
