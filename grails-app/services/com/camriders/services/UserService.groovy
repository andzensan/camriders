package com.camriders.services

import com.camriders.domains.History
import org.apache.shiro.crypto.hash.Sha512Hash
import org.springframework.transaction.annotation.Transactional

import com.camriders.domains.Role
import com.camriders.domains.User

class UserService {
    def activityLog
	def emailNotificationService
	def grailsApplication
   def createRole(){
		def roleInstance = new Role(name: "Admin")
		addPermission(roleInstance)
		roleInstance = new Role(name: "User")
		addPermission(roleInstance)
	}
   
   def addPermission(def roleInstance){
	   roleInstance.addToPermissions("auth:*")
	   roleInstance.addToPermissions("profile:updateProfile")
	   roleInstance.addToPermissions("profile:index")
	   roleInstance.addToPermissions("camRegistration:*")
	   roleInstance.addToPermissions("confirm:*")
	   if(roleInstance.name == "Admin"){
		   roleInstance.addToPermissions("profile:activityLog")
		   roleInstance.addToPermissions("user:*")
		   
	   }
	   
	   roleInstance.save()
   }
	
	def createDefaultUser() {
		createRole()
		def adminRole = Role.findByName("Admin")
		
		def admin = new User(username: "admin@camriders.com", passwordHash: new Sha512Hash("admin").toHex(), firstName :"Camriders", lastName : "Admin", gender : "Male", dob : new Date(), ipAddress : Inet4Address.getLocalHost().getHostAddress(), isVerified : true, phoneNumber : "9898095678", zipCode : "21221")
		admin.addToRoles(adminRole)
		admin.save()
	   
	}
	
	@Transactional(readOnly = true)
	def getRoleByName(def roleName){
		def adminRole = Role.findByName("Admin")
	}
	def createUser(def userInstance){
		def isEmailVerifcationEnable = grailsApplication.config.grails.emailVerification.enable ?: false
		def emailUUID = UUID.randomUUID().toString()?.replace("-", "")
		userInstance?.emailUUID = emailUUID
		if(isEmailVerifcationEnable == false){
			userInstance?.isVerified = true
		}
		userInstance.save(flush:true)
        activityLogForCreate(userInstance.username)
		println "isEmailVerifcationEnable :" + isEmailVerifcationEnable
		
		//Sending email verification email which will be using background process that is runAsync
		if(isEmailVerifcationEnable == true){
			runAsync {
				emailNotificationService.sendRegistrationConfirmationEmail(userInstance)
				//event("sendRegistrationConfirmationEmail", userInstance?.username)
			}
		}
	}
    def activityLogForCreate(def username){
         def history=new History()
         history.comment="User with "+username+" have been successfully created."
         history.createdDate=new Date()
         history.userAction=ActivityName.USERCREATED
         history.save()

    }
}
