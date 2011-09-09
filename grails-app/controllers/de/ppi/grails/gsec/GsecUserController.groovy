package de.ppi.grails.gsec

class GsecUserController {
   
    static scaffold=true

	def edit = {
        def role = GsecUser.get(params.id)
        render view:"/shared/user_edit", model:[gsecUserInstance:role]
    }
	
}
