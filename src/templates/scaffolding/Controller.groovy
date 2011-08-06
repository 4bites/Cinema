

<%=packageName ? "package ${packageName}\n\n" : ''%>class ${className}Controller {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ ${propertyName}List: ${className}.list( params ), ${propertyName}Total: ${className}.count() ]
    }

    def show = {
        this.defineLastReturnToAction(session, request, this.getAllowedReferers('show'))
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName}) {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(getRedirectMap(session, [action:"list"]))
        } else {
            return [${propertyName}: ${propertyName}]
        }
    }

    def delete = {
        def ${propertyName} = ${className}.get( params.id )
        if(${propertyName}) {
            try {
                ${propertyName}.delete()
                flash.message = "${domainClass.propertyName}.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "${className} \${params.id} deleted"
                redirect(getRedirectMap(session, [action:"list"]))
            } catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${domainClass.propertyName}.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "${className} \${params.id} could not be deleted"
                redirect(action: 'show', id: params.id)
            }
        } else {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(getRedirectMap(session, [action:"list"]))
        }
    }

    def edit = {
        if (flash.renderModel) {
            return flash.renderModel
        }
        
        this.defineLastReturnToAction(session, request, this.getAllowedReferers('edit'))
        if (request.post) {
            params.action='edit'
            redirect(params)
        }
        def ${propertyName} = ${className}.get(Long.parseLong(params.id.toString()))
        if(!${propertyName}) {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(getRedirectMap(session, [action:"list"]))
        } else {
            return [ ${propertyName} : ${propertyName} ]
        }
    }

    def update = {
        deleteUnauthorizedParams(params)
        def ${propertyName} = ${className}.get( params.id )
        if(${propertyName}) {
            if(params.version) {
                def version = params.version.toLong()
                if(${propertyName}.version > version) {
                    <%def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className)%>
                    ${propertyName}.errors.rejectValue("version", "${lowerCaseName}.optimistic.locking.failure", "Another user has updated this ${className} while you were editing.")
                    flash.renderModel=[${propertyName}:${propertyName}]
                    redirect(action: 'edit', id: params.id)
                    return 
                }
            }
            ${propertyName}.properties = params
            
            //fix for http://jira.codehaus.org/browse/GRAILS-5221
            params.each { name, value ->
                if (name.startsWith('mtm_') && !params."\${value}") {
                    ${propertyName}."\${value}" = null
                }
            }
            
            if(!${propertyName}.hasErrors() && ${propertyName}.save()) {
                flash.message = "${domainClass.propertyName}.updated"
                flash.args = [params.id]
                flash.defaultMessage = "${className} \${params.id} updated"
                redirect(getRedirectMap(session, [action:"list"]))
            } else {
                flash.renderModel=[${propertyName}:${propertyName}]
                redirect(action: 'edit', id: params.id)
                return 
            }
        }
        else {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(action: 'edit', id: params.id)
        }
    }

    def create = {
        if (flash.renderModel) {
            return flash.renderModel
        }        
        this.defineLastReturnToAction(session, request, this.getAllowedReferers('create'))
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params
        return ['${propertyName}':${propertyName}]
    }

    def save = {
        def ${propertyName} = new ${className}(params)
        if (saveObject(${propertyName})) {
            redirect(getRedirectMap(session, [action: 'show', id: ${propertyName}.id]))
        } else {
            flash.renderModel=[${propertyName}:${propertyName}]
            redirect(action: 'create')        
        }
    }

    def saveAndRedirectToCreate = {
        def ${propertyName} = new ${className}(params)
        if (saveObject(${propertyName})) {
            redirect(action: 'create')
        }
        else {
            flash.renderModel=[${propertyName}:${propertyName}]
            redirect(action: 'create')        
        }
    }

    /**
     * Save the given Domain-Object.
     */
    private saveObject(def ${propertyName}) {
        def flash = org.springframework.web.context.request.RequestContextHolder.currentRequestAttributes().getFlashScope()
        defineDefaultsForUnauthorizedProperties (${propertyName})
        if (!${propertyName}.hasErrors() && ${propertyName}.save()) {
            flash.message = "${domainClass.propertyName}.created"
            flash.args = [${propertyName}.id]
            flash.defaultMessage = "${className} \${${propertyName}.id} created"
            return true
        }
        return false
    }

    /**
     * Removes parameter values from request that are restricted due to the
     * current user role. The actual checking is done by the underlying private
     * method handleUnauthorizedProperties.
     *
     * @param params The params to check and clear for restricted values.
     */
    private deleteUnauthorizedParams(def params) {
        def action = {map, key, closure, session ->
            map.remove(key)
        }
        handleUnauthorizedProperties (params, action)
    }


    /**
     * Sets domain object properties to default values that have not been set by the view
     * due to the current user role restriction. The actual default value is gathered
     * by the underlying private method handleUnauthorizedProperties.
     *
     * @param domainObject The domain object to set default values for.
     */
    private defineDefaultsForUnauthorizedProperties (def domainObject) {
        def action = { object, key, closure, session ->
            def defaultValue = closure(session, object)
            object."\${key}" = defaultValue
        }
        handleUnauthorizedProperties (domainObject, action)
    }

    /**
     * Checks and handles restricted write-only object properties. If the current user is not
     * authorized to update a property a closure is called to handle the problem.
     * For each restricted property a static map is defined on the domain object.
     * In that map a closure is defined to gather the default value for the property.
     *
     * @param object The domain object to handle unautherized properties for.
     * @param action A closure which is called in case a properties needs to be handled.
     */
    private handleUnauthorizedProperties (def object, def action) {
        def permissionField = ${className}.getMetaClass().getMetaProperty("needsPermission")
        if (permissionField && java.lang.reflect.Modifier.isStatic(permissionField.getModifiers())) {
            def session = org.springframework.web.context.request.RequestContextHolder.currentRequestAttributes().getSession()
            def authorizationService = org.codehaus.groovy.grails.commons.ApplicationHolder.application.mainContext.getBean("authorizationService")

            ${className}.needsPermission.each { key, closure ->
                if (closure && !authorizationService.hasPermission("${className}.\${key}", "write", session)) {
                    action(object, key, closure, session)
                }
            }
        }
    }
    
    /**
     * Saves request.referer information into the session to remember return to pages.
     * Useful to trigger an e.g. edit page from multiple locations.
     */
    private defineLastReturnToAction(def session, def request, def allowedReferers) {
        def referer = request.getHeader("referer")
        if (!referer) {
            return
        }
        def allowed = true
        if (allowedReferers != null) {
            allowed = false
            allowedReferers.each {
                if (referer.contains(it)) { allowed = true }
            }
        }
        if (allowed) {
            //If you run in trouble with this it could be helpful to store for
            //each COntroller separately into "returnToReferer\${${className}Controller}"
            session.returnToReferer = request.getHeader("referer")
        }
    }
    
    private getAllowedReferers(actionName) {
        def allowedRefererMapField = ${className}.getMetaClass().getMetaProperty("allowedReferer")
        def defaultAllowedReferer = ['edit': ["${domainClass.propertyName}/list","${domainClass.propertyName}/show"]]
        if (allowedRefererMapField && java.lang.reflect.Modifier.isStatic(allowedRefererMapField.getModifiers())) {
            ${className}.allowedReferer.each{key, value ->
                defaultAllowedReferer[key] = value;
            }
        }
        return defaultAllowedReferer[actionName]?:[]
    }
    
    private Map getRedirectMap(session, defaultMap=[action:'list']) {
        def redirectMap = defaultMap
        if (session.returnToReferer) {            
            redirectMap = [url:session.returnToReferer]
            session.removeAttribute('returnToReferer')        
        } 
        return redirectMap
    }
        
}
