package sessions
import org.hibernate.event.PostUpdateEventListener
import org.hibernate.event.PostUpdateEvent

class SessionPostUpdateEventListener implements PostUpdateEventListener {
	public void onPostUpdate(PostUpdateEvent event){
		print event.getEntity().class.name
		if(event.getEntity().class.name == 'de.ppi.grails.gsec.GsecUser'){
			HttpSessionCollector.invalidateUser(event.getEntity().username)		
		}
	} 
}

