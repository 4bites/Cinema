class UrlMappings {
    static mappings = {
		"/company/$type/$action"(controller:"Empresa", action:"$action")
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }

      "/"(view:"/index")
	  "500"(view:'/error')
	}
}
