import de.ppi.grails.gsec.GsecBasicPermission
import de.ppi.grails.gsec.GsecPermission
import de.ppi.grails.gsec.GsecRole
import de.ppi.grails.gsec.GsecUser;
// (C) 2009 PPI AG



/**
 * Helperclass to create and update permissions and roles.
 * @author PPI AG
 */
public class PermissionRolesAndUserBootStrap {
    def adminRole

    def permissions = [:]

    def createPermissions() {
        findAndUpdatePermission('root','*','*')

        findAndUpdatePermission('gsecUser.view',"gsecUser", "index,list,show")
        findAndUpdatePermission('gsecUser.edit',"gsecUser", "edit, update")
        findAndUpdatePermission('gsecUser.create',"gsecUser", "create, save, saveAndRedirectToCreate")
        findAndUpdatePermission('gsecUser.delete',"gsecUser", "delete")

		findAndUpdatePermission('complejo.view','complejo', 'index,list,show')
		findAndUpdatePermission('complejo.edit','complejo', 'edit, update')
		findAndUpdatePermission('complejo.create','complejo', 'create, save, saveAndRedirectToCreate')
		findAndUpdatePermission('complejo.delete','complejo', 'delete')

    }

    def createRoles() {
        adminRole = GsecRole.findByName("Administrator");
        if (adminRole == null) {
            adminRole = new GsecRole(name: "Administrator")
        }
        adminRole.addToPermissions(permissions['gsecUser.view'])
        adminRole.addToPermissions(permissions['gsecUser.edit'])
        adminRole.addToPermissions(permissions['gsecUser.create'])
        adminRole.addToPermissions(permissions['gsecUser.delete'])

		adminRole.addToPermissions(permissions['complejo.view']);
		adminRole.addToPermissions(permissions['complejo.edit']);
		adminRole.addToPermissions(permissions['complejo.create']);
		adminRole.addToPermissions(permissions['complejo.delete']);

        adminRole.save()

    }
    
    def createUsers() {
        def rootUser = findOrCreateUser("root", "Root", "Adminstrator", 
                "secret", true)
        rootUser.addToPermissions(permissions['root'])
        rootUser.save()
        
        def adminUser = findOrCreateUser("admin", "Normal", "Adminstrator", 
                "secret", true)
        adminUser.addToRoles(adminRole);
        adminUser.save()
        
    }

    private void findAndUpdatePermission(String name, target, actions) {
        def result = GsecPermission.findByName(name);
        if (result == null) {
            result = GsecPermission.createFromPermission(name,
                new GsecBasicPermission(target, actions))
            result.save()
        } else {
            if ((result.actions != actions) || (result.target != target)) {
                result.actions = actions
                result.target = target
                result.save()
            }
        }
        permissions[name] = result
    }
    
    private GsecUser findOrCreateUser(userName, firstName,
            name, password, enabled) {
        def user = GsecUser.findByUsername(userName)
        if (user == null) {
            user = new GsecUser(username: userName, firstname: firstName,
                    name: name, password: password, enabled:enabled)
        }
        return user;
    }
    
    
    def init = { servletContext ->
        GsecUser.withTransaction{tx ->
            createPermissions()
            createRoles()
            createUsers()
        }    
            
    }
}
