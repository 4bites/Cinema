class BeanFilters { 
    def filters = { 
        all(controller:'*', action:'*') { 
            after = { 
                def bean = applicationContext.getBean("com.grailsrocks.beanfields.BeanTagLib")
				bean.inputTemplate({ args -> 
                    def sb = new StringBuilder()
					sb << "<tr class=\"prop\">"
                	sb << "<td valign=\"top\" class=\"name\">${args.label}</td>"
                	sb << "<td valign=\"top\" class=\"value ${args.errorClassToUse}\">${args.field} </td>"
            		sb << "</tr>"
                })
                bean.selectTemplate({ args ->
                    def sb = new StringBuilder()
                    sb << "<tr class=\"prop\">"
                    sb << "<td valign=\"top\" class=\"name\">${args.label}</td>"
                    sb << "<td valign=\"top\" class=\"value ${args.errorClassToUse}\">${args.field} </td>"
                    sb << "</tr>"
                })
 
            } 
        } 
    }     
} 
