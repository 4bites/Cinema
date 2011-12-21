package de.ppi.grails.gsec

class GsecUserController {
   
    static scaffold=true

	def edit = {
        def role = GsecUser.get(params.id)
        render view:"/shared/user_edit", model:[gsecUserInstance:role]
    }

    def create = {
        def role = GsecUser.get(params.id)
        render view:"/shared/user_create", model:[gsecUserInstance:role]
    }

	def status = {
		render view:"/shared/users_status"
	}

	def update_status = {
		params.list("username").each{	
			def user = GsecUser.findByUsername(it)
			if(user){
				user.enabled = false		
				user.save()
			}
		}
		GsecUser.findAllByUsernameNotInList(params.list("username")).each{ 
			it.enabled = true
			it.save()
		}
		redirect action:"status"
	}
}
