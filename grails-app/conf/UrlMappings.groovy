class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/setup/"(view:"/setup/index")
		"/about/"(view:"/about/index")
		"/testvideo/"(view:"/testvideo/index")
		"500"(view:'/error')
	}
}
