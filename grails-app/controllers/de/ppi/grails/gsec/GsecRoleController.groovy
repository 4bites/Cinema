package de.ppi.grails.gsec

class GsecRoleController {

    static scaffold=true

	def edit = {
		def role = GsecRole.get(params.id)
		render view:"/shared/edit", model:[gsecRoleInstance:role]
	}
}
