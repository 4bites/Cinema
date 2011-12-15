package sessions
import org.hibernate.event.PostUpdateEventListener
import org.hibernate.event.PostDeleteEventListener
import org.hibernate.event.PostUpdateEvent
import org.hibernate.event.PostDeleteEvent

class SessionPostUpdateEventListener implements PostUpdateEventListener, PostDeleteEventListener {
	public void onPostUpdate(PostUpdateEvent event){
		print event.getEntity().class.name
		if(event.getEntity().class.name in ['de.ppi.grails.gsec.GsecPermission','de.ppi.grails.gsec.GsecRole','de.ppi.grails.gsec.GsecUser']){
			HttpSessionCollector.updateUsers()		
		}
	} 

	public void onPostDelete(PostDeleteEvent event){
		onPostUpdate(event)
	}
}

