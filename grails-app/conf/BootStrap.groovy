import com.camriders.domains.Role
import com.camriders.domains.User

class BootStrap {
	def userService
    def init = { servletContext ->
		
		def role = Role.findByName("User")?: new Role(name: "User").save(flush:true)
		def roleList = Role.findAll()
		roleList.each{roleInstance->
			roleInstance.addToPermissions("auth:*")
			 roleInstance.addToPermissions("profile:updateProfile")
			 roleInstance.addToPermissions("profile:index")
			roleInstance.addToPermissions("camRegistration:*")
			roleInstance.addToPermissions("confirm:*")
 			roleInstance.addToPermissions("stream:view:*")
            //println("ROLE NON ADMIN----------------------------")

			if(roleInstance.name == "Admin"){
				roleInstance.addToPermissions("profile:activityLog")
				roleInstance.addToPermissions("user:*")
			}
			
			roleInstance.save()
		}
		def userInstance = User.findByUsername('admin@camriders.com')
		if(userInstance == null)
			userService.createDefaultUser()
    }
    def destroy = {
    }
}
